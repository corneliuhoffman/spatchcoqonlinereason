let separate_hyps = x => {
  let sep = Js.String.split("<br>============================<br>", x);
  let conc = sep[1];
  let hy = Js.String.split("<br>", sep[0]);
  {"hyps": hy, "conclusion": conc};
};

let gethead = tree => {
  let text = tree##innerHTML;
  separate_hyps(text);
};

let newconclusion = tree =>
  List.map(a => gethead(a)##conclusion, tree##children);

let newhyp = tree => {
  let oldhyp = gethead(tree)##hyps;
  let list =
    List.map(
      x => {
        let nhyp = gethead(x)##hyps;
        List.filter(
          a => ! List.mem(a, Array.to_list(oldhyp)),
          Array.to_list(nhyp),
        );
      },
      tree##children,
    );
  List.map(x => String.concat("$, $", x), list);
};

let deadhyp = tree => {
  let oldhyp = gethead(tree)##hyps;
  let lll = List.map(x => gethead(x)##hyps, tree##children);
  let union =
    List.fold_left(
      (a, b) => a @ List.filter(x => ! List.mem(x, a), Array.to_list(b)),
      [],
      lll,
    );
  let r =
    String.concat(
      "$ $",
      List.filter(a => ! List.mem(a, union), Array.to_list(oldhyp)),
    );
  
  r;
};

let change = (pattern, string, replist) => {
  let reg = Js_re.fromString("/" ++ pattern ++ "\\{(.*?)\\}/g");
  let list = Js.String.match(reg, string);
  switch (list) {
  | None => string
  | Some(l) =>
    let li = List.tl(Array.to_list(l));
    List.fold_left(
      (a, b) => {
        let ss: string = "/" ++ pattern ++ "\\{" ++ b ++ "\\}/g";
        let mre = Js_re.fromString(ss);
        Js.String.replaceByRe(
          mre,
          List.nth(replist, int_of_string(b) - 1),
          a,
        );
      },
      string,
      li,
    );
  };
};

let subs_list = (l, str) =>
  List.fold_left(
    (a, b) => {
      let r = Js_re.fromString("/" ++ b[0] ++ "/g");
      Js.String.replaceByRe(r, b[1], a);
    },
    str,
    l,
  );

let changes = [
  ["\226\136\168", "\\lor "],
  ["\226\134\146", "\\Rightarrow "],
  ["\226\136\128", "\\forall "],
  ["\226\136\131", "\\exists "],
  ["\226\136\167", "\\land "],
  ["\226\134\148", "\\Leftrightarrow "],
  [" +", " "],
  ["\226\136\136", "\\in "],
  ["\226\136\169", "\\cap "],
  ["\226\136\170", "\\cup "],
  ["_", "-"],
  ["\226\138\134", "\\subseteq "],
  ["\226\136\133", "\\emptyset "],
  ["\226\136\129", "\\complement "],
  ["<b>", ""],
  ["<br>", ""],
];

let rec latex = (tree, commandstr) => {
  let comp1 =
    List.map(
      x => Js.String.replaceByRe(Js_re.fromString("/'/g"), "", x[1]),
      commandstr,
    );
  let comp =
    List.map(
      x => {
        let re = Js_re.fromString("/Notation(.*?):=/");
        let v0 = Js.String.match(re, x);
        let v =
          switch (v0) {
          | None => ""
          | Some(x) => x[0]
          };
        let re1 =
          Js_re.fromString(
            "/constr\\(.?\\)|hyp\\(.?\\)|reference\\(.?\\)|ident\\(.?\\)/g",
          );
        let v1 = String.trim(Js.String.replaceByRe(re1, "let", v)) ++ ".";
        let re2 = Js_re.fromString("/\\s\\s+/g");
        let v2 = Js.String.replaceByRe(re2, " ", v1);
        let re3 = Js_re.fromString("/VAR/g");
        let v3 = Js.String.replaceByRe(re3, "\\(.+?\\)", v2);
        Js_re.fromString("/" ++ v3 ++ "/g");
      },
      comp1,
    );
  let string =
    if (tree##leavingtactic != "") {
      let res0 =
        List.mapi(
          (s, a) => {
            let match =
              Js.String.match(List.nth(comp, s), tree##leavingtactic);
            switch (match) {
            | Some(l) => [a, l]
            | None => []
            };
          },
          commandstr,
        );
      let res = List.hd(List.filter(a => a != [], res0));
      change(
        "@val",
        List.hd(res)[0],
        Array.to_list(List.hd(List.tl(res))),
      );
    } else {
      "{\\color{red} This still needs a proof\n\n}";
    };
  let string1 = change("@conc", string, [gethead(tree)##conclusion]);
  let string2 = change("@newconclusion", string1, newconclusion(tree));
  let string3 = change("@newhyp", string2, newhyp(tree));
  let string4 = change("@deadhyp", string3, [deadhyp(tree)]);
  let string5 =
    change(
      "@latex",
      string4,
      List.map(t => latex(t, commandstr), tree##children),
    );
  subs_list(List.map(Array.of_list, changes), string5);
};
/*
 */
/* let printlatex =(list, coms)=>{
   	let l1=Tree.position(list);
   	let t = Tree.makejsontree(l1);
        latex(t, coms);

   } */
/* let process_lemma=(l)=>{
   	let l1= subs_list(changes, l)
   	let tr= l.split(" ")
   	tr=tr.splice(1).join(" ").split(":")
   	console.log(tr)

   } */
/* let get_all_lemmas=(list, comms)=>{
   	let get_all=breaklist(list).filter(x=>x.length>0).map(
   	aa=>
       {let lemma =aa[0][0][2] ;
       	let list=aa[0].slice(1);
       	console.log(list)
       	return lemma+"\n\n"+printlatex(list, comms);
       	})
   return get_all.join("\n\n") } */