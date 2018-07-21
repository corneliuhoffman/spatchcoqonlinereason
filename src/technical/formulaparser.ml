
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | UNION
    | TIMES
    | SUCC
    | SUBSET
    | SPACE
    | SETMINUS
    | RPAREN
    | POW
    | PLUS
    | OR
    | NOT
    | NE
    | MINUS
    | LPAREN
    | LIST of (
# 34 "formulaparser.mly"
       (string)
# 25 "formulaparser.ml"
  )
    | LE
    | INTERSECTION
    | IN
    | IMPLIES
    | IFF
    | ID of (
# 22 "formulaparser.mly"
       (string)
# 35 "formulaparser.ml"
  )
    | FORALL
    | EXISTS
    | EQUALS
    | EOF
    | EMPTYSET
    | DIV
    | COMPLEMENT
    | COMMA
    | AND
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState53
  | MenhirState50
  | MenhirState47
  | MenhirState45
  | MenhirState43
  | MenhirState41
  | MenhirState39
  | MenhirState37
  | MenhirState34
  | MenhirState32
  | MenhirState29
  | MenhirState26
  | MenhirState24
  | MenhirState22
  | MenhirState20
  | MenhirState18
  | MenhirState16
  | MenhirState14
  | MenhirState12
  | MenhirState8
  | MenhirState6
  | MenhirState5
  | MenhirState3
  | MenhirState2
  | MenhirState1
  | MenhirState0

# 8 "formulaparser.mly"
  
open Ast

# 93 "formulaparser.ml"

let rec _menhir_run29 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29

and _menhir_run32 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_run39 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run41 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run34 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34

and _menhir_run37 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37

and _menhir_run47 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_run43 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_run45 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_run12 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_run18 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_run14 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14

and _menhir_run20 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20

and _menhir_run22 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_run24 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

and _menhir_run16 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_run26 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_goto_func : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (b : (
# 22 "formulaparser.mly"
       (string)
# 551 "formulaparser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s, (a : (Ast.expr))) = _menhir_stack in
        let _v : (Ast.expr) = 
# 179 "formulaparser.mly"
                                              ( List ([ a; Var b]) )
# 557 "formulaparser.ml"
         in
        _menhir_goto_func _menhir_env _menhir_stack _menhir_s _v
    | AND | COMMA | DIV | EOF | EQUALS | IFF | IMPLIES | IN | INTERSECTION | LE | MINUS | NE | OR | PLUS | POW | RPAREN | SETMINUS | SUBSET | TIMES | UNION ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
        let _v : (Ast.expr) = 
# 175 "formulaparser.mly"
        (_1)
# 566 "formulaparser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EOF | EQUALS | ID _ | IMPLIES | IN | INTERSECTION | NE | OR | RPAREN | SUBSET | UNION ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.expr) = 
# 159 "formulaparser.mly"
                       (Complement(e))
# 608 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | DIV | EOF | EQUALS | ID _ | IMPLIES | IN | INTERSECTION | LE | MINUS | NE | OR | PLUS | RPAREN | SETMINUS | SUBSET | UNION ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 153 "formulaparser.mly"
                                ( Times(e1,e2) )
# 635 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | DIV | EOF | EQUALS | ID _ | IMPLIES | IN | INTERSECTION | LE | MINUS | NE | OR | PLUS | RPAREN | SETMINUS | SUBSET | TIMES | UNION ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e : (Ast.expr))), _, (f : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 143 "formulaparser.mly"
                        (Pow(e,f))
# 660 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | DIV | EOF | EQUALS | ID _ | IMPLIES | IN | INTERSECTION | LE | MINUS | NE | OR | PLUS | POW | RPAREN | SETMINUS | SUBSET | TIMES | UNION ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 146 "formulaparser.mly"
                             ( Iff(e1,e2) )
# 683 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | DIV | EOF | EQUALS | ID _ | IMPLIES | IN | INTERSECTION | LE | MINUS | NE | OR | PLUS | RPAREN | SUBSET | UNION ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 152 "formulaparser.mly"
                                   ( Setminus(e1,e2) )
# 712 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | DIV | EOF | EQUALS | ID _ | IMPLIES | IN | INTERSECTION | LE | NE | OR | RPAREN | SUBSET | UNION ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 150 "formulaparser.mly"
                               ( Add(e1,e2) )
# 745 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | DIV | EOF | EQUALS | ID _ | IMPLIES | IN | INTERSECTION | LE | NE | OR | PLUS | RPAREN | SUBSET | UNION ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 151 "formulaparser.mly"
                                ( Minus(e1,e2) )
# 776 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EOF | EQUALS | ID _ | IMPLIES | IN | INTERSECTION | NE | OR | RPAREN | SUBSET | UNION ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 148 "formulaparser.mly"
                             ( Le(e1,e2) )
# 813 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EOF | EQUALS | ID _ | IMPLIES | IN | INTERSECTION | LE | NE | OR | RPAREN | SUBSET | UNION ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 147 "formulaparser.mly"
                            (Div(e1, e2))
# 848 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMPLEMENT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | EMPTYSET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | EXISTS ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | FORALL ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | ID _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
            | LPAREN ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | NOT ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | SUCC ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50)
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IMPLIES ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | NE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (b : (
# 22 "formulaparser.mly"
       (string)
# 941 "formulaparser.ml"
            )) = _v in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 169 "formulaparser.mly"
                                         ( List([Union(e1,e2); Var b]) )
# 948 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EOF | EQUALS | IMPLIES | IN | INTERSECTION | NE | OR | RPAREN | SUBSET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 156 "formulaparser.mly"
                                ( Union(e1,e2) )
# 974 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EOF | EQUALS | ID _ | IMPLIES | NE | OR | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 160 "formulaparser.mly"
                             (Subset(e1, e2))
# 1019 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (b : (
# 22 "formulaparser.mly"
       (string)
# 1042 "formulaparser.ml"
            )) = _v in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 170 "formulaparser.mly"
                                                ( List([Intersection(e1,e2); Var b]) )
# 1049 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EOF | EQUALS | IMPLIES | IN | NE | OR | RPAREN | SUBSET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 158 "formulaparser.mly"
                                       (Intersection(e1,e2) )
# 1077 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EOF | EQUALS | ID _ | IMPLIES | NE | OR | RPAREN | SUBSET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 172 "formulaparser.mly"
                             ( In(e1,e2) )
# 1118 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | NE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EOF | ID _ | IMPLIES | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 155 "formulaparser.mly"
                             ( Or(e1,e2) )
# 1171 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EOF | EQUALS | ID _ | IMPLIES | OR | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 163 "formulaparser.mly"
                          (Not(Equals(e1, e2)))
# 1216 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | NE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EOF | ID _ | IMPLIES | OR | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 162 "formulaparser.mly"
                              (Equals(e1, e2))
# 1263 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | NE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EOF | ID _ | IMPLIES | OR | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 154 "formulaparser.mly"
                              ( And(e1,e2) )
# 1314 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (b : (
# 22 "formulaparser.mly"
       (string)
# 1341 "formulaparser.ml"
            )) = _v in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 174 "formulaparser.mly"
                                                                 ( Implies(e1,(List([e2; Var b]))) )
# 1348 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IMPLIES ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | NE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EOF | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 168 "formulaparser.mly"
                                 ( Implies(e1,e2) )
# 1386 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IMPLIES ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | NE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EOF | ID _ | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 166 "formulaparser.mly"
                                      (Exists(e1 , e3))
# 1442 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMPLEMENT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | EMPTYSET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | EXISTS ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | FORALL ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | ID _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
            | LPAREN ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | NOT ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | SUCC ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IMPLIES ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | NE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IMPLIES ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | NE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EOF | ID _ | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 167 "formulaparser.mly"
                                      (Forall(e1 , e3))
# 1568 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EQUALS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IMPLIES ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | NE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 173 "formulaparser.mly"
                             ((e))
# 1618 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EOF | EQUALS | ID _ | IMPLIES | NE | OR | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.expr) = 
# 165 "formulaparser.mly"
                (Not(e))
# 1671 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | DIV | EOF | EQUALS | ID _ | IMPLIES | IN | INTERSECTION | LE | MINUS | NE | OR | PLUS | RPAREN | SETMINUS | SUBSET | TIMES | UNION ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.expr) = 
# 144 "formulaparser.mly"
                  (Succ(e))
# 1696 "formulaparser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 122 "formulaparser.mly"
       (Ast.expr)
# 1722 "formulaparser.ml"
            ) = 
# 130 "formulaparser.mly"
                  ( e )
# 1726 "formulaparser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 122 "formulaparser.mly"
       (Ast.expr)
# 1733 "formulaparser.ml"
            )) = _v in
            Obj.magic _1
        | EQUALS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | IFF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack)
        | IMPLIES ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | INTERSECTION ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | NE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | POW ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | SETMINUS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | SUBSET ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | UNION ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "formulaparser.mly"
       (string)
# 1964 "formulaparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 22 "formulaparser.mly"
       (string)
# 1972 "formulaparser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 180 "formulaparser.mly"
           ( Var x )
# 1977 "formulaparser.ml"
     in
    _menhir_goto_func _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 138 "formulaparser.mly"
             ( EmptySet )
# 2043 "formulaparser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 122 "formulaparser.mly"
       (Ast.expr)
# 2089 "formulaparser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMPLEMENT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EMPTYSET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EXISTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FORALL ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | LPAREN ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SUCC ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 219 "/Users/Hoff/.opam/4.06.1/lib/menhir/standard.mly"
  


# 2128 "formulaparser.ml"
