// Generated by BUCKLESCRIPT VERSION 2.2.3, PLEASE EDIT WITH CARE
'use strict';

var Ast = require("./ast.js");
var List = require("bs-platform/lib/js/list.js");
var Block = require("bs-platform/lib/js/block.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Lexing = require("bs-platform/lib/js/lexing.js");
var Printf = require("bs-platform/lib/js/printf.js");
var $$String = require("bs-platform/lib/js/string.js");
var Pervasives = require("bs-platform/lib/js/pervasives.js");
var Formulalexer = require("./formulalexer.js");
var Formulaparser = require("./formulaparser.js");
var Caml_builtin_exceptions = require("bs-platform/lib/js/caml_builtin_exceptions.js");

function parse(s) {
  var lexbuf = Lexing.from_string(s);
  return Formulaparser.prog(Formulalexer.read, lexbuf);
}

function print(x) {
  if (typeof x === "number") {
    if (x === 0) {
      return "∅";
    } else {
      return " \xe2\x88\x85 ";
    }
  } else {
    switch (x.tag | 0) {
      case 0 : 
          return x[0];
      case 1 : 
          return "(" + (print(x[0]) + " + 1)");
      case 2 : 
          var e2 = x[1];
          var e1 = x[0];
          var a;
          a = typeof e1 === "number" ? "(" + (print(e1) + ")") : (
              e1.tag ? "(" + (print(e1) + ")") : print(e1)
            );
          var b;
          b = typeof e2 === "number" ? "(" + (print(e2) + ")") : (
              e2.tag ? "(" + (print(e2) + ")") : print(e2)
            );
          return a + (" <= " + b);
      case 3 : 
          return print(x[0]) + ("^" + print(x[1]));
      case 4 : 
          var e2$1 = x[1];
          var e1$1 = x[0];
          var a$1;
          a$1 = typeof e1$1 === "number" ? "(" + (print(e1$1) + ")") : (
              e1$1.tag ? "(" + (print(e1$1) + ")") : print(e1$1)
            );
          var b$1;
          b$1 = typeof e2$1 === "number" ? "(" + (print(e2$1) + ")") : (
              e2$1.tag ? "(" + (print(e2$1) + ")") : print(e2$1)
            );
          return a$1 + (" + " + b$1);
      case 5 : 
          var e2$2 = x[1];
          var e1$2 = x[0];
          var a$2;
          a$2 = typeof e1$2 === "number" ? "(" + (print(e1$2) + ")") : (
              e1$2.tag ? "(" + (print(e1$2) + ")") : print(e1$2)
            );
          var b$2;
          b$2 = typeof e2$2 === "number" ? "(" + (print(e2$2) + ")") : (
              e2$2.tag ? "(" + (print(e2$2) + ")") : print(e2$2)
            );
          return a$2 + (" | " + b$2);
      case 6 : 
          var e2$3 = x[1];
          var e1$3 = x[0];
          var a$3;
          a$3 = typeof e1$3 === "number" ? "(" + (print(e1$3) + ")") : (
              e1$3.tag ? "(" + (print(e1$3) + ")") : print(e1$3)
            );
          var b$3;
          b$3 = typeof e2$3 === "number" ? "(" + (print(e2$3) + ")") : (
              e2$3.tag ? "(" + (print(e2$3) + ")") : print(e2$3)
            );
          return a$3 + (" - " + b$3);
      case 7 : 
          var e2$4 = x[1];
          var e1$4 = x[0];
          var a$4;
          a$4 = typeof e1$4 === "number" ? "(" + (print(e1$4) + ")") : (
              e1$4.tag ? "(" + (print(e1$4) + ")") : print(e1$4)
            );
          var b$4;
          b$4 = typeof e2$4 === "number" ? "(" + (print(e2$4) + ")") : (
              e2$4.tag ? "(" + (print(e2$4) + ")") : print(e2$4)
            );
          return a$4 + (" * " + b$4);
      case 8 : 
          var e2$5 = x[1];
          var e1$5 = x[0];
          var a$5;
          a$5 = typeof e1$5 === "number" ? "(" + (print(e1$5) + ")") : (
              e1$5.tag ? "(" + (print(e1$5) + ")") : print(e1$5)
            );
          var b$5;
          b$5 = typeof e2$5 === "number" ? "(" + (print(e2$5) + ")") : (
              e2$5.tag ? "(" + (print(e2$5) + ")") : print(e2$5)
            );
          return "" + (String(a$5) + (" → " + (String(b$5) + "")));
      case 9 : 
          var e2$6 = x[1];
          var e1$6 = x[0];
          var a$6;
          a$6 = typeof e1$6 === "number" ? "(" + (print(e1$6) + ")") : (
              e1$6.tag ? "(" + (print(e1$6) + ")") : print(e1$6)
            );
          var b$6;
          b$6 = typeof e2$6 === "number" ? "(" + (print(e2$6) + ")") : (
              e2$6.tag ? "(" + (print(e2$6) + ")") : print(e2$6)
            );
          return "" + (String(a$6) + (" ↔ " + (String(b$6) + "")));
      case 10 : 
          var e2$7 = x[1];
          var e1$7 = x[0];
          var a$7;
          a$7 = typeof e1$7 === "number" ? "(" + (print(e1$7) + ")") : (
              e1$7.tag ? "(" + (print(e1$7) + ")") : print(e1$7)
            );
          var b$7;
          b$7 = typeof e2$7 === "number" ? "(" + (print(e2$7) + ")") : (
              e2$7.tag ? "(" + (print(e2$7) + ")") : print(e2$7)
            );
          return "" + (String(a$7) + (" ∧ " + (String(b$7) + "")));
      case 11 : 
          var e2$8 = x[1];
          var e1$8 = x[0];
          var a$8;
          a$8 = typeof e1$8 === "number" ? "(" + (print(e1$8) + ")") : (
              e1$8.tag ? "(" + (print(e1$8) + ")") : print(e1$8)
            );
          var b$8;
          b$8 = typeof e2$8 === "number" ? "(" + (print(e2$8) + ")") : (
              e2$8.tag ? "(" + (print(e2$8) + ")") : print(e2$8)
            );
          return "" + (String(a$8) + (" ∨ " + (String(b$8) + "")));
      case 12 : 
          var e2$9 = x[1];
          var e1$9 = x[0];
          var a$9;
          a$9 = typeof e1$9 === "number" ? "(" + (print(e1$9) + ")") : (
              e1$9.tag ? "(" + (print(e1$9) + ")") : print(e1$9)
            );
          var b$9;
          b$9 = typeof e2$9 === "number" ? "(" + (print(e2$9) + ")") : (
              e2$9.tag ? "(" + (print(e2$9) + ")") : print(e2$9)
            );
          return "" + (String(a$9) + (" ∪ " + (String(b$9) + "")));
      case 13 : 
          var e2$10 = x[1];
          var e1$10 = x[0];
          var a$10;
          a$10 = typeof e1$10 === "number" ? "(" + (print(e1$10) + ")") : (
              e1$10.tag ? "(" + (print(e1$10) + ")") : print(e1$10)
            );
          var b$10;
          b$10 = typeof e2$10 === "number" ? "(" + (print(e2$10) + ")") : (
              e2$10.tag ? "(" + (print(e2$10) + ")") : print(e2$10)
            );
          return "" + (String(a$10) + (" ∩ " + (String(b$10) + "")));
      case 14 : 
          var e2$11 = x[1];
          var e1$11 = x[0];
          var a$11;
          a$11 = typeof e1$11 === "number" ? "(" + (print(e1$11) + ")") : (
              e1$11.tag ? "(" + (print(e1$11) + ")") : print(e1$11)
            );
          var b$11;
          b$11 = typeof e2$11 === "number" ? "(" + (print(e2$11) + ")") : (
              e2$11.tag ? "(" + (print(e2$11) + ")") : print(e2$11)
            );
          return "" + (String(a$11) + (" ∈ " + (String(b$11) + "")));
      case 15 : 
          var e = x[0];
          if (typeof e === "number") {
            return "\xe2\x88\x81 (" + (print(e) + ")");
          } else if (e.tag) {
            return "\xe2\x88\x81 (" + (print(e) + ")");
          } else {
            return "\xe2\x88\x81 " + e[0];
          }
      case 16 : 
          var e2$12 = x[1];
          var e1$12 = x[0];
          var a$12;
          a$12 = typeof e1$12 === "number" ? "(" + (print(e1$12) + ")") : (
              e1$12.tag ? "(" + (print(e1$12) + ")") : print(e1$12)
            );
          var b$12;
          b$12 = typeof e2$12 === "number" ? "(" + (print(e2$12) + ")") : (
              e2$12.tag ? "(" + (print(e2$12) + ")") : print(e2$12)
            );
          return a$12 + (" - " + b$12);
      case 17 : 
          var e2$13 = x[1];
          var e1$13 = x[0];
          var a$13;
          a$13 = typeof e1$13 === "number" ? "(" + (print(e1$13) + ")") : (
              e1$13.tag ? "(" + (print(e1$13) + ")") : print(e1$13)
            );
          var b$13;
          b$13 = typeof e2$13 === "number" ? "(" + (print(e2$13) + ")") : (
              e2$13.tag ? "(" + (print(e2$13) + ")") : print(e2$13)
            );
          return "" + (String(a$13) + (" ⊆ " + (String(b$13) + "")));
      case 18 : 
          return print(x[0]) + (" = " + print(x[1]));
      case 19 : 
          var e$1 = x[0];
          if (typeof e$1 === "number") {
            return "not (" + (print(e$1) + ")");
          } else if (e$1.tag) {
            return "not (" + (print(e$1) + ")");
          } else {
            return "not " + e$1[0];
          }
      case 20 : 
          return "∃" + (print(x[0]) + (", " + print(x[1])));
      case 21 : 
          return "∀" + (print(x[0]) + (", " + print(x[1])));
      case 22 : 
          var match = x[0];
          if (match) {
            return print(match[0]) + (" " + $$String.concat(" ", List.map(print, match[1])));
          } else {
            throw [
                  Caml_builtin_exceptions.match_failure,
                  [
                    "formulaparsing.ml",
                    16,
                    18
                  ]
                ];
          }
      case 23 : 
          return "(" + (print(x[0]) + ")");
      
    }
  }
}

function latex(x) {
  if (typeof x === "number") {
    if (x === 0) {
      return "\xe2\x88\x85";
    } else {
      return " \\emptyset ";
    }
  } else {
    switch (x.tag | 0) {
      case 0 : 
          return x[0];
      case 1 : 
          return "(" + (latex(x[0]) + " + 1)");
      case 2 : 
          var e2 = x[1];
          var e1 = x[0];
          var a;
          a = typeof e1 === "number" ? "(" + (latex(e1) + ")") : (
              e1.tag ? "(" + (latex(e1) + ")") : latex(e1)
            );
          var b;
          b = typeof e2 === "number" ? "(" + (latex(e2) + ")") : (
              e2.tag ? "(" + (latex(e2) + ")") : latex(e2)
            );
          return a + (" \\le " + b);
      case 3 : 
          return latex(x[0]) + ("^" + latex(x[1]));
      case 4 : 
          var e2$1 = x[1];
          var e1$1 = x[0];
          var a$1;
          a$1 = typeof e1$1 === "number" ? "(" + (latex(e1$1) + ")") : (
              e1$1.tag ? "(" + (latex(e1$1) + ")") : latex(e1$1)
            );
          var b$1;
          b$1 = typeof e2$1 === "number" ? "(" + (latex(e2$1) + ")") : (
              e2$1.tag ? "(" + (latex(e2$1) + ")") : latex(e2$1)
            );
          return a$1 + (" + " + b$1);
      case 5 : 
          var e2$2 = x[1];
          var e1$2 = x[0];
          var a$2;
          a$2 = typeof e1$2 === "number" ? "(" + (latex(e1$2) + ")") : (
              e1$2.tag ? "(" + (latex(e1$2) + ")") : latex(e1$2)
            );
          var b$2;
          b$2 = typeof e2$2 === "number" ? "(" + (latex(e2$2) + ")") : (
              e2$2.tag ? "(" + (latex(e2$2) + ")") : latex(e2$2)
            );
          return a$2 + (" | " + b$2);
      case 6 : 
          var e2$3 = x[1];
          var e1$3 = x[0];
          var a$3;
          a$3 = typeof e1$3 === "number" ? "(" + (latex(e1$3) + ")") : (
              e1$3.tag ? "(" + (latex(e1$3) + ")") : latex(e1$3)
            );
          var b$3;
          b$3 = typeof e2$3 === "number" ? "(" + (latex(e2$3) + ")") : (
              e2$3.tag ? "(" + (latex(e2$3) + ")") : latex(e2$3)
            );
          return a$3 + (" - " + b$3);
      case 7 : 
          var e2$4 = x[1];
          var e1$4 = x[0];
          var a$4;
          a$4 = typeof e1$4 === "number" ? "(" + (latex(e1$4) + ")") : (
              e1$4.tag ? "(" + (latex(e1$4) + ")") : latex(e1$4)
            );
          var b$4;
          b$4 = typeof e2$4 === "number" ? "(" + (latex(e2$4) + ")") : (
              e2$4.tag ? "(" + (latex(e2$4) + ")") : latex(e2$4)
            );
          return a$4 + (" * " + b$4);
      case 8 : 
          var e2$5 = x[1];
          var e1$5 = x[0];
          var a$5;
          a$5 = typeof e1$5 === "number" ? "(" + (latex(e1$5) + ")") : (
              e1$5.tag ? "(" + (latex(e1$5) + ")") : latex(e1$5)
            );
          var b$5;
          b$5 = typeof e2$5 === "number" ? "(" + (latex(e2$5) + ")") : (
              e2$5.tag ? "(" + (latex(e2$5) + ")") : latex(e2$5)
            );
          return a$5 + (" \\rightarrow " + b$5);
      case 9 : 
          var e2$6 = x[1];
          var e1$6 = x[0];
          var a$6;
          a$6 = typeof e1$6 === "number" ? "(" + (latex(e1$6) + ")") : (
              e1$6.tag ? "(" + (latex(e1$6) + ")") : latex(e1$6)
            );
          var b$6;
          b$6 = typeof e2$6 === "number" ? "(" + (latex(e2$6) + ")") : (
              e2$6.tag ? "(" + (latex(e2$6) + ")") : latex(e2$6)
            );
          return a$6 + (" \\leftrightarrow " + b$6);
      case 10 : 
          var e2$7 = x[1];
          var e1$7 = x[0];
          var a$7;
          a$7 = typeof e1$7 === "number" ? "(" + (latex(e1$7) + ")") : (
              e1$7.tag ? "(" + (latex(e1$7) + ")") : latex(e1$7)
            );
          var b$7;
          b$7 = typeof e2$7 === "number" ? "(" + (latex(e2$7) + ")") : (
              e2$7.tag ? "(" + (latex(e2$7) + ")") : latex(e2$7)
            );
          return a$7 + (" \\land " + b$7);
      case 11 : 
          var e2$8 = x[1];
          var e1$8 = x[0];
          var a$8;
          a$8 = typeof e1$8 === "number" ? "(" + (latex(e1$8) + ")") : (
              e1$8.tag ? "(" + (latex(e1$8) + ")") : latex(e1$8)
            );
          var b$8;
          b$8 = typeof e2$8 === "number" ? "(" + (latex(e2$8) + ")") : (
              e2$8.tag ? "(" + (latex(e2$8) + ")") : latex(e2$8)
            );
          return a$8 + (" \\lor " + b$8);
      case 12 : 
          var e2$9 = x[1];
          var e1$9 = x[0];
          var a$9;
          a$9 = typeof e1$9 === "number" ? "(" + (latex(e1$9) + ")") : (
              e1$9.tag ? "(" + (latex(e1$9) + ")") : latex(e1$9)
            );
          var b$9;
          b$9 = typeof e2$9 === "number" ? "(" + (latex(e2$9) + ")") : (
              e2$9.tag ? "(" + (latex(e2$9) + ")") : latex(e2$9)
            );
          return a$9 + (" \\cup " + b$9);
      case 13 : 
          var e2$10 = x[1];
          var e1$10 = x[0];
          var a$10;
          a$10 = typeof e1$10 === "number" ? "(" + (latex(e1$10) + ")") : (
              e1$10.tag ? "(" + (latex(e1$10) + ")") : latex(e1$10)
            );
          var b$10;
          b$10 = typeof e2$10 === "number" ? "(" + (latex(e2$10) + ")") : (
              e2$10.tag ? "(" + (latex(e2$10) + ")") : latex(e2$10)
            );
          return a$10 + (" \\cap " + b$10);
      case 14 : 
          var e2$11 = x[1];
          var e1$11 = x[0];
          var a$11;
          a$11 = typeof e1$11 === "number" ? "(" + (latex(e1$11) + ")") : (
              e1$11.tag ? "(" + (latex(e1$11) + ")") : latex(e1$11)
            );
          var b$11;
          b$11 = typeof e2$11 === "number" ? "(" + (latex(e2$11) + ")") : (
              e2$11.tag ? "(" + (latex(e2$11) + ")") : latex(e2$11)
            );
          return a$11 + (" \\in " + b$11);
      case 15 : 
          var e = x[0];
          if (typeof e === "number") {
            return "\\complement (" + (latex(e) + ")");
          } else if (e.tag) {
            return "\\complement (" + (latex(e) + ")");
          } else {
            return "\xe2\x88\x81 " + e[0];
          }
      case 16 : 
          var e2$12 = x[1];
          var e1$12 = x[0];
          var a$12;
          a$12 = typeof e1$12 === "number" ? "(" + (latex(e1$12) + ")") : (
              e1$12.tag ? "(" + (latex(e1$12) + ")") : latex(e1$12)
            );
          var b$12;
          b$12 = typeof e2$12 === "number" ? "(" + (latex(e2$12) + ")") : (
              e2$12.tag ? "(" + (latex(e2$12) + ")") : latex(e2$12)
            );
          return a$12 + (" \\setminus " + b$12);
      case 17 : 
          var e2$13 = x[1];
          var e1$13 = x[0];
          var a$13;
          a$13 = typeof e1$13 === "number" ? "(" + (latex(e1$13) + ")") : (
              e1$13.tag ? "(" + (latex(e1$13) + ")") : latex(e1$13)
            );
          var b$13;
          b$13 = typeof e2$13 === "number" ? "(" + (latex(e2$13) + ")") : (
              e2$13.tag ? "(" + (latex(e2$13) + ")") : latex(e2$13)
            );
          return a$13 + (" \\subseteq " + b$13);
      case 18 : 
          return latex(x[0]) + (" = " + latex(x[1]));
      case 19 : 
          var e$1 = x[0];
          if (typeof e$1 === "number") {
            return "\\neg (" + (latex(e$1) + ")");
          } else if (e$1.tag) {
            return "\\neg (" + (latex(e$1) + ")");
          } else {
            return "\\neg " + e$1[0];
          }
      case 20 : 
          return "\\exists " + (latex(x[0]) + (", " + latex(x[1])));
      case 21 : 
          return "\\forall " + (latex(x[0]) + (", " + latex(x[1])));
      case 22 : 
          var match = x[0];
          if (match) {
            return latex(match[0]) + ("\\  " + $$String.concat(" ", List.map(latex, match[1])));
          } else {
            throw [
                  Caml_builtin_exceptions.match_failure,
                  [
                    "formulaparsing.ml",
                    127,
                    18
                  ]
                ];
          }
      case 23 : 
          return "(" + (latex(x[0]) + ")");
      
    }
  }
}

function getlist(x) {
  var unsorted;
  var exit = 0;
  if (typeof x === "number") {
    unsorted = x === 0 ? /* :: */[
        print(x),
        /* [] */0
      ] : /* :: */[
        print(x),
        /* [] */0
      ];
  } else {
    switch (x.tag | 0) {
      case 1 : 
      case 15 : 
      case 19 : 
          exit = 1;
          break;
      case 22 : 
          var match = x[0];
          unsorted = match ? /* :: */[
              print(x),
              Pervasives.$at(getlist(match[0]), List.concat(List.map(getlist, match[1])))
            ] : /* :: */[
              print(x),
              /* [] */0
            ];
          break;
      case 0 : 
      case 2 : 
      case 3 : 
      case 16 : 
      case 23 : 
          unsorted = /* :: */[
            print(x),
            /* [] */0
          ];
          break;
      default:
        unsorted = /* :: */[
          print(x),
          Pervasives.$at(getlist(x[0]), getlist(x[1]))
        ];
    }
  }
  if (exit === 1) {
    unsorted = /* :: */[
      print(x),
      getlist(x[0])
    ];
  }
  return List.sort((function (x, y) {
                return y.length - x.length | 0;
              }), unsorted);
}

function med(string) {
  var re = (/<b>/g);
  var re1 = (/<\/b>/g);
  var st1 = string.replace(re, "");
  return st1.replace(re1, "");
}

function parant(ast) {
  if (typeof ast === "number") {
    return "(" + (print(ast) + ")");
  } else if (ast.tag) {
    return "(" + (print(ast) + ")");
  } else {
    return print(ast);
  }
}

function produce_possible_tactics_goal(ast, name, goal) {
  Curry._1(Printf.printf(/* Format */[
            /* String_literal */Block.__(11, [
                "this is the form ",
                /* String */Block.__(2, [
                    /* No_padding */0,
                    /* String_literal */Block.__(11, [
                        "\n\n",
                        /* End_of_format */0
                      ])
                  ])
              ]),
            "this is the form %s\n\n"
          ]), Ast.to_string(ast));
  Pervasives.flush_all(/* () */0);
  Pervasives.print_string(Pervasives.string_of_bool(goal));
  var exit = 0;
  if (typeof ast === "number") {
    exit = 1;
  } else {
    switch (ast.tag | 0) {
      case 8 : 
          if (goal) {
            return /* :: */[
                    "Assume " + (parant(ast[0]) + (" then prove " + (parant(ast[1]) + "."))),
                    /* :: */[
                      "Rewrite the goal using VAR.",
                      /* :: */[
                        "Apply result VAR.",
                        /* :: */[
                          "Rewrite goal using the definition of VAR.",
                          /* :: */[
                            "This follows from assumptions.",
                            /* :: */[
                              "This is trivial.",
                              /* [] */0
                            ]
                          ]
                        ]
                      ]
                    ]
                  ];
          } else {
            return /* :: */[
                    "Rewrite hypothesis " + (name + " using the definition of VAR."),
                    /* :: */[
                      "Apply result " + (name + "."),
                      /* :: */[
                        "Rewrite the goal using " + (name + "."),
                        /* [] */0
                      ]
                    ]
                  ];
          }
      case 9 : 
          if (goal) {
            return /* :: */[
                    "Prove both directions of " + (parant(ast[0]) + (" iff " + (parant(ast[1]) + "."))),
                    /* :: */[
                      "Rewrite the goal using VAR.",
                      /* :: */[
                        "Apply result VAR.",
                        /* :: */[
                          "Rewrite goal using the definition of VAR.",
                          /* :: */[
                            "This follows from assumptions.",
                            /* :: */[
                              "This is trivial.",
                              /* [] */0
                            ]
                          ]
                        ]
                      ]
                    ]
                  ];
          } else {
            return /* :: */[
                    "Eliminate the conjuction in hypothesis " + (name + "."),
                    /* :: */[
                      "Rewrite hypothesis " + (name + " using the definition of VAR."),
                      /* :: */[
                        "Apply result " + (name + "."),
                        /* :: */[
                          "Rewrite the goal using " + (name + "."),
                          /* [] */0
                        ]
                      ]
                    ]
                  ];
          }
      case 10 : 
          if (goal) {
            return /* :: */[
                    "Prove the conjunction in the goal by first proving " + (parant(ast[0]) + (" then " + (parant(ast[1]) + "."))),
                    /* :: */[
                      "Rewrite the goal using VAR.",
                      /* :: */[
                        "Apply result VAR.",
                        /* :: */[
                          "Rewrite goal using the definition of VAR.",
                          /* :: */[
                            "This follows from assumptions.",
                            /* :: */[
                              "This is trivial.",
                              /* [] */0
                            ]
                          ]
                        ]
                      ]
                    ]
                  ];
          } else {
            return /* :: */[
                    "Eliminate the conjuction in hypothesis " + (name + "."),
                    /* :: */[
                      "Rewrite hypothesis " + (name + " using the definition of VAR."),
                      /* :: */[
                        "Apply result " + (name + "."),
                        /* :: */[
                          "Rewrite the goal using " + (name + "."),
                          /* :: */[
                            "This follows from assumptions.",
                            /* [] */0
                          ]
                        ]
                      ]
                    ]
                  ];
          }
      case 11 : 
          if (goal) {
            return /* :: */[
                    "Prove left hand side.",
                    /* :: */[
                      "Prove right hand side.",
                      /* :: */[
                        "Prove " + (parant(ast[0]) + " in the disjunction."),
                        /* :: */[
                          "Prove " + (parant(ast[1]) + " in the disjunction."),
                          /* :: */[
                            "Rewrite the goal using VAR.",
                            /* :: */[
                              "Apply result VAR.",
                              /* :: */[
                                "Rewrite goal using the definition of VAR.",
                                /* :: */[
                                  "This follows from assumptions.",
                                  /* :: */[
                                    "This is trivial.",
                                    /* [] */0
                                  ]
                                ]
                              ]
                            ]
                          ]
                        ]
                      ]
                    ]
                  ];
          } else {
            return /* :: */[
                    "Consider cases based on disjunction in hypothesis " + (name + "."),
                    /* :: */[
                      "Rewrite hypothesis " + (name + " using the definition of VAR."),
                      /* :: */[
                        "Apply result " + (name + "."),
                        /* :: */[
                          "Rewrite the goal using " + (name + "."),
                          /* [] */0
                        ]
                      ]
                    ]
                  ];
          }
      case 18 : 
          if (goal) {
            return /* :: */[
                    "Rewrite the goal using VAR.",
                    /* :: */[
                      "Apply result VAR.",
                      /* :: */[
                        "Rewrite goal using the definition of VAR.",
                        /* :: */[
                          "This follows from assumptions.",
                          /* [] */0
                        ]
                      ]
                    ]
                  ];
          } else {
            return /* :: */[
                    "Rewrite hypothesis " + (name + " using the definition of VAR."),
                    /* :: */[
                      "Apply result " + (name + "."),
                      /* :: */[
                        "Rewrite the goal using " + (name + "."),
                        /* :: */[
                          "Claim VAR by rewriting " + (name + " using VAR."),
                          /* [] */0
                        ]
                      ]
                    ]
                  ];
          }
      case 20 : 
          if (goal) {
            return /* :: */[
                    "Prove the existential claim is true for VAR.",
                    /* :: */[
                      "Rewrite the goal using VAR.",
                      /* :: */[
                        "Apply result VAR.",
                        /* :: */[
                          "Rewrite goal using the definition of VAR.",
                          /* :: */[
                            "This follows from assumptions.",
                            /* :: */[
                              "This is trivial.",
                              /* [] */0
                            ]
                          ]
                        ]
                      ]
                    ]
                  ];
          } else {
            return /* :: */[
                    "Fix VAR the existentially quantified variable in " + (name + "."),
                    /* :: */[
                      "Rewrite hypothesis " + (name + " using the definition of VAR."),
                      /* :: */[
                        "Apply result " + (name + "."),
                        /* :: */[
                          "Rewrite the goal using " + (name + "."),
                          /* [] */0
                        ]
                      ]
                    ]
                  ];
          }
      case 21 : 
          if (goal) {
            return /* :: */[
                    "Fix an arbitrary element VAR.",
                    /* :: */[
                      "Apply induction on " + (parant(ast[0]) + "."),
                      /* :: */[
                        "Rewrite the goal using VAR.",
                        /* :: */[
                          "Apply result VAR.",
                          /* :: */[
                            "Rewrite goal using the definition of VAR.",
                            /* :: */[
                              "This follows from assumptions.",
                              /* :: */[
                                "This is trivial.",
                                /* [] */0
                              ]
                            ]
                          ]
                        ]
                      ]
                    ]
                  ];
          } else {
            return /* :: */[
                    "Obtain VAR using variable VAR in the universally quantified hypothesis " + (name + "."),
                    /* :: */[
                      "Rewrite hypothesis " + (name + " using the definition of VAR."),
                      /* :: */[
                        "Apply result " + (name + "."),
                        /* :: */[
                          "Rewrite the goal using " + (name + "."),
                          /* [] */0
                        ]
                      ]
                    ]
                  ];
          }
      default:
        exit = 1;
    }
  }
  if (exit === 1) {
    if (goal) {
      return /* :: */[
              "Rewrite the goal using VAR.",
              /* :: */[
                "Apply result VAR.",
                /* :: */[
                  "Rewrite goal using the definition of VAR.",
                  /* :: */[
                    "This follows from assumptions.",
                    /* :: */[
                      "This is trivial.",
                      /* [] */0
                    ]
                  ]
                ]
              ]
            ];
    } else {
      return /* :: */[
              "Rewrite hypothesis " + (name + " using the definition of VAR."),
              /* :: */[
                "Apply result " + (name + "."),
                /* :: */[
                  "Rewrite the goal using " + (name + "."),
                  /* :: */[
                    "This follows from assumptions.",
                    /* [] */0
                  ]
                ]
              ]
            ];
    }
  }
  
}

exports.parse = parse;
exports.print = print;
exports.latex = latex;
exports.getlist = getlist;
exports.med = med;
exports.parant = parant;
exports.produce_possible_tactics_goal = produce_possible_tactics_goal;
/* No side effect */
