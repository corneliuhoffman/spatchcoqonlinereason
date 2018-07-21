// Generated by BUCKLESCRIPT VERSION 2.2.3, PLEASE EDIT WITH CARE
'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var React = require("react");
var HypLists = require("./HypLists.js");
var TabbedView = require("reason-react-primitives/lib/js/src/tabbedView.js");
var ReasonReact = require("reason-react/lib/js/src/ReasonReact.js");

var component = ReasonReact.statelessComponent("MyTabs");

function make(text, _) {
  var newrecord = component.slice();
  newrecord[/* render */9] = (function () {
      var butons = text.split("\n\n");
      var tabs = $$Array.mapi((function (s, x) {
              return /* tuple */[
                      React.createElement("div", {
                            style: {
                              background: "#F5F5F5",
                              padding: "5px",
                              textAlign: "left"
                            }
                          }, "  Goal  " + (String(s + 1 | 0) + "   ")),
                      (function () {
                          return ReasonReact.element(/* None */0, /* None */0, HypLists.make(x, /* array */[]));
                        })
                    ];
            }), butons);
      return ReasonReact.element(/* Some */["w01"], /* None */0, TabbedView.make(/* None */0, /* None */0, tabs, /* None */0, /* Some */["1px 1px"], /* array */[]));
    });
  return newrecord;
}

exports.component = component;
exports.make = make;
/* component Not a pure module */