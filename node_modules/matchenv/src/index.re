open Ast_mapper;

open Ast_helper;

open Asttypes;

open Parsetree;

open Longident;

let getenv = (s) =>
  try (Sys.getenv(s)) {
  | Not_found => ""
  };

let getenv_mapper = (argv) =>
  /* Our getenv_mapper only overrides the handling of expressions in the default mapper. */
  {
    ...default_mapper,
    structure_item: (mapper, structure_item) =>
      switch structure_item {
      /* Is this an extension node? */
      | {
          pstr_desc:
            Pstr_include({pincl_mod: {pmod_desc: Pmod_extension(({txt: "matchenv"}, pstr))}}),
          pstr_loc: loc
        } =>
        switch pstr {
        | PStr([
            {
              pstr_desc:
                Pstr_eval(
                  {
                    pexp_desc:
                      Pexp_match({pexp_desc: Pexp_construct({txt: Lident(identVar)}, _)}, caseList)
                  },
                  _
                )
            }
          ]) =>
          let expandedVar = getenv(identVar);
          if (expandedVar == "") {
            raise(
              Location.Error(Location.error(~loc, "No env var found for '" ++ (identVar ++ "'")))
            )
          } else {
            let rec findFirstMatch = (li) =>
              switch li {
              | [] =>
                raise(
                  Location.Error(
                    Location.error(~loc, "Didn't found a match for '" ++ (expandedVar ++ "'"))
                  )
                )
              | [
                  {
                    pc_lhs: {ppat_desc: Ppat_constant(Const_string(s, _))},
                    pc_rhs: {pexp_desc: Pexp_construct(moduleNameIdent, _)}
                  },
                  ...rest
                ]
                  when s == expandedVar => moduleNameIdent
              | [
                  {
                    pc_lhs: {ppat_desc: Ppat_any},
                    pc_rhs: {pexp_desc: Pexp_construct(moduleNameIdent, _)}
                  },
                  ...rest
                ] => moduleNameIdent
              | [_, ...rest] => findFirstMatch(rest)
              };
            Str.include_(~loc, Incl.mk(~loc, Mod.ident(~loc, findFirstMatch(caseList))))
          }
        | _ => raise(Location.Error(Location.error(~loc, "[%matchenv] only accepts a match")))
        }
      /* Delegate to the default mapper. */
      | x => default_mapper.structure_item(mapper, x)
      }
  };

let () = register("matchenv", getenv_mapper);
