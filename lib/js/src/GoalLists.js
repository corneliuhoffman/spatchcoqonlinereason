// Generated by BUCKLESCRIPT VERSION 2.2.3, PLEASE EDIT WITH CARE
'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var React = require("react");
var ReasonReact = require("reason-react/lib/js/src/ReasonReact.js");

var component = ReasonReact.statelessComponent("GoalLists");

function handleClick(_, _$1) {
  return /* () */0;
}

function make(name, color, _) {
  var newrecord = component.slice();
  newrecord[/* render */9] = (function () {
      var butons = name.split("\n");
      var ss = $$Array.mapi((function (s, x) {
              return React.createElement("button", {
                          key: String(s),
                          style: {
                            background: color,
                            width: "100%"
                          }
                        }, x);
            }), butons);
      return React.createElement("div", {
                  style: {
                    background: color,
                    width: "100%"
                  }
                }, ss);
    });
  return newrecord;
}

exports.component = component;
exports.handleClick = handleClick;
exports.make = make;
/* component Not a pure module */
