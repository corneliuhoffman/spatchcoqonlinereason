(* open Sexp.Traverse *)
open Sexpm
let myprint x =  try (Formulaparsing.print (Formulaparsing.parse (x))) with _ -> x;;
let myast x =  try (Ast.to_string (Formulaparsing.parse (x))) with _ -> x;;
let mylatex x = try (Formulaparsing.latex (Formulaparsing.parse (x))) with _ -> x;;

let makeopt str=Some(str);;
let readopt a= match a with
None ->""
|Some(str)->str;;



let match2_num s1 s2 =
  let len1 = String.length s1
  and len2 = String.length s2 in
  if len1 < len2 then (false, 0) else
    let rec aux i n =
      if i < 0 then (n <> 0, n) else
        let sub = String.sub s1 i len2 in
        if (sub = s2)
        then aux (pred i) (succ n)
        else aux (pred i) (n)
    in
    aux (len1 - len2) 0
 let match1 s1 s2 = 
 let st ="/"^s2^"/g" in
 let re=Js.Re.fromString st in
 
 Js.String.search re s1 >=0 ;;

let rec printalllist (x)= match x with
|`Atom a ->a
|`List l -> String.concat " " (List.map (fun (s) -> printalllist s) l);;

let rec mypars l m  = match m with
| `Atom _ -> l
| `List li -> 
  if List.hd li = `Atom "CoqString" then 
    let tail= List.tl li in
    let str= printalllist (`List tail) in
    (* String.concat "" (List.map (fun (x)-> 
      match x with 
        | `Atom y -> y
        |_-> "") tail ) in *)
      str::l
  else  List.fold_left  mypars l li ;;
let rec coqlist l m  = match m with
| `Atom a -> if a = "Pp_force_newline" then 
("\n")::l else l
| `List li -> Js.log (List.hd li);
if List.hd li = `Atom "Pp_string" then 
    
    let tail= List.tl li in
    let str= printalllist (`List tail) in
    Js.log str;
    (* String.concat "" (List.map (fun (x)-> 
      match x with 
        | `Atom y -> y
        |_-> "") tail ) in *)
      str::l
else 
  List.fold_left  coqlist l li ;;

let rec ncoqstr l m  = match m with
| `Atom _ ->  l;
| `List [(`Atom a); (`List _); `List(c)] -> if a = "Pp_box" then (`List c)::l else l
|`List s -> List.fold_left  ncoqstr l s ;;

let rec coqstr l m  = match m with
| `Atom a -> if a = "Pp_force_newline" then ("\n")::l else l;
| `List [(`Atom a); (`Atom b)] -> if a = "Pp_string" then b::l else l
|`List s -> List.fold_left  coqstr l s ;; 

let rec print_err l s=
let errors =["ExplainErr.EvaluatedError" ; "Pretype_errors.PretypeError";  "CErrors.AlreadyDeclared"; "CErrors.UserError"; "NoSuchState"; "Stream.Error"; "rror"] in
  match s with
| `Atom _ -> l
|`List [] ->l
| `List r -> if  (List.mem  (to_string (List.hd r)) errors ) then  ((printalllist s)::l) 
 else  List.fold_left  print_err l r ;; 


(* let rec error l m  = match m with
| `Atom a -> l
|`List [] ->l
| `List r -> if  (match1 (readopt (to_string (List.hd r))) "rror") then  ((to_string m)::l) 
 else  List.fold_left  error l r ;;  *)

(* let rec error l m  = match m with
| `Atom a -> l
|`List [] ->l
| `List r -> if  (match1 ( (to_string (List.hd r)) )"rror") then  ((to_string m)::l) 
 else  List.fold_left  error l r ;;  *)


let getallgoals ss = List.map (fun x-> Js.String.split  "\n" (String.concat "" (List.rev(coqstr [] x)))) (List.rev (ncoqstr [] ss));;

let pstr xx = 
    let x1=Js.String.replaceByRe (Js_re.fromStringWithFlags "\"" "g")  " \" " xx in
    let x=Js.String.replaceByRe (Js_re.fromStringWithFlags "→" ~flags:"g")  "boo"  x1 in

    let aa=parse_string (x)  in
    match aa with
    |`Ok a -> a
    |`Error s ->`Atom ("Error"^s);;

let geterr x = (print_err [] (pstr x));;
let getgoals x = let xx ="("^x^")"in
      let xxx = Js.String.replace "\"" " \" " xx in 
      
      let c=pstr xxx in
      

      (mypars [] c)
let processgoall x =  
      let goals=getgoals x in
      let goalslist = Js.String.split "\n\n" (List.hd goals) in
      let separate = Array.map (fun (x)-> (Js.String.split "\n============================\n" x)) goalslist in
      separate

let listsofgoals x =  
  let possibleGoals=parse_string  x in
  Js.log possibleGoals;
  let goalorerror= match possibleGoals with
  `Ok s ->s 
  |`Error s ->`Atom ("Error"^s) in

( goalorerror);;


 (* let _ =
  Js.export "myMathLib"
    (object%js
      method pprint x  = Js.string (myprint (Js.to_string x))
      method ast x = myast  (Js.to_string x)
      method latex x  = Js.string (mylatex (Js.to_string x))
	  method parsexp x = List.map Js.string (mypars [] (parse_string (Js.to_string x)))  
	  method getgoals x = List.map (fun x-> List.map Js.string x) (getallgoals (parse_string (Js.to_string x)))
	  method geterr x = List.map Js.string (print_err [] (parse_string (Js.to_string x)))
	  method mmatch x =  (match1 (Js.to_string x) "rror" )
    method tactics x n g = Js.array (Array.of_list (List.map Js.string ( Formulaparsing.produce_possible_tactics_goal ((Formulaparsing.parse (Js.to_string x))) (Js.to_string n) (Js.to_bool g))))

     end) *)