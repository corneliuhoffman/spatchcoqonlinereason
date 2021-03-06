// Generated by BUCKLESCRIPT VERSION 2.2.3, PLEASE EDIT WITH CARE
'use strict';

var List = require("bs-platform/lib/js/list.js");
var $$String = require("bs-platform/lib/js/string.js");

function to_string(expr) {
  if (typeof expr === "number") {
    if (expr === 0) {
      return "Empty";
    } else {
      return "EmptySet";
    }
  } else {
    switch (expr.tag | 0) {
      case 0 : 
          return "Var(" + (expr[0] + ")");
      case 1 : 
          return "Succ(" + (to_string(expr[0]) + ")");
      case 2 : 
          return "Le(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 3 : 
          return "Pow(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 4 : 
          return "Add(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 5 : 
          return "Div(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 6 : 
          return "Minus(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 7 : 
          return "Times(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 8 : 
          return "Implies(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 9 : 
          return "Iff(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 10 : 
          return "And(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 11 : 
          return "Or(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 12 : 
          return "Union(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 13 : 
          return "Intersection(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 14 : 
          return "In(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 15 : 
          return "Complement(" + (to_string(expr[0]) + ")");
      case 16 : 
          return "Setminus(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 17 : 
          return "Subset(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 18 : 
          return "Equals(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 19 : 
          return "Not(" + (to_string(expr[0]) + ")");
      case 20 : 
          return "Exists(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 21 : 
          return "Forall(" + (to_string(expr[0]) + ("," + (to_string(expr[1]) + ")")));
      case 22 : 
          return "List[" + ($$String.concat(";", List.map(to_string, expr[0])) + "]");
      case 23 : 
          return "Parant(" + (to_string(expr[0]) + ")");
      
    }
  }
}

exports.to_string = to_string;
/* No side effect */
