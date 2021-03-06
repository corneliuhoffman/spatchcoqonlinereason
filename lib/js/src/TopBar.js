// Generated by BUCKLESCRIPT VERSION 2.2.3, PLEASE EDIT WITH CARE
'use strict';

var Block = require("bs-platform/lib/js/block.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Utils = require("./technical/utils.js");
var React = require("react");
var Caml_array = require("bs-platform/lib/js/caml_array.js");
var ReasonReact = require("reason-react/lib/js/src/ReasonReact.js");
var Navbar$BsReactstrap = require("bs-reactstrap/lib/js/src/Navbar.bs.js");
var Dropdown$BsReactstrap = require("bs-reactstrap/lib/js/src/Dropdown.bs.js");
var DropdownItem$BsReactstrap = require("bs-reactstrap/lib/js/src/DropdownItem.bs.js");
var DropdownMenu$BsReactstrap = require("bs-reactstrap/lib/js/src/DropdownMenu.bs.js");
var NavbarToggler$BsReactstrap = require("bs-reactstrap/lib/js/src/NavbarToggler.bs.js");
var DropdownToggle$BsReactstrap = require("bs-reactstrap/lib/js/src/DropdownToggle.bs.js");

var loadFile = (function(o)
                {
                    var fr = new FileReader();
                    fr.onload = function(e)
                        {
                           editor2.setValue(e.target.result);
                        };
                    fr.readAsText(o);
                });

var component = ReasonReact.reducerComponent("TopBar");

function handleClick(_, _$1) {
  return /* () */0;
}

function make(saveToggle, _) {
  var newrecord = component.slice();
  newrecord[/* render */9] = (function (self) {
      var toggle = function () {
        return Curry._1(self[/* send */4], /* Toggle */Block.__(0, [1 - self[/* state */2][/* dropdownOpen */0]]));
      };
      var toggletac = function () {
        return Curry._1(self[/* send */4], /* Toggle */Block.__(0, [1 - self[/* state */2][/* tacticsOpen */1]]));
      };
      return ReasonReact.element(/* None */0, /* None */0, Navbar$BsReactstrap.make(/* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* Some */["white"], /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* Some */["md"], /* array */[
                      ReasonReact.element(/* None */0, /* None */0, NavbarToggler$BsReactstrap.make(/* None */0, /* None */0, /* None */0, /* None */0, /* array */[])),
                      ReasonReact.element(/* None */0, /* None */0, Dropdown$BsReactstrap.make(/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[(false)], /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* Some */[toggle], /* None */0, /* None */0, /* Some */[(true)], /* array */[
                                ReasonReact.element(/* None */0, /* None */0, DropdownToggle$BsReactstrap.make(/* Some */[(false)], /* Some */["red"], /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* array */["File"])),
                                ReasonReact.element(/* None */0, /* None */0, DropdownMenu$BsReactstrap.make(/* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* array */[
                                          ReasonReact.element(/* None */0, /* None */0, DropdownItem$BsReactstrap.make(/* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* Some */[(function () {
                                                        return Curry._1(saveToggle, /* () */0);
                                                      })], /* None */0, /* None */0, /* None */0, /* array */["Save"])),
                                          ReasonReact.element(/* None */0, /* None */0, DropdownItem$BsReactstrap.make(/* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* Some */[(function () {
                                                        var a = Caml_array.caml_array_get(document.getElementsByClassName("loadFile"), 0);
                                                        return a.submit();
                                                      })], /* None */0, /* None */0, /* None */0, /* array */[
                                                    React.createElement("input", {
                                                          className: "loadFile",
                                                          id: "myfile",
                                                          style: {
                                                            height: "0.1px",
                                                            overflow: "hidden",
                                                            position: "absolute",
                                                            width: "0.1px",
                                                            zIndex: "-1",
                                                            opacity: "0"
                                                          },
                                                          itemID: "loader",
                                                          name: "file",
                                                          type: "file",
                                                          onChange: (function (a) {
                                                              Curry._1(loadFile, a.target.files(0));
                                                              return Curry._1(self[/* send */4], /* Toggle */Block.__(0, [(false)]));
                                                            })
                                                        }),
                                                    React.createElement("label", {
                                                          style: {
                                                            color: "black",
                                                            height: "20px",
                                                            width: "100%"
                                                          },
                                                          htmlFor: "myfile"
                                                        }, "load")
                                                  ]))
                                        ]))
                              ])),
                      ReasonReact.element(/* None */0, /* None */0, Dropdown$BsReactstrap.make(/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[self[/* state */2][/* tacticsOpen */1]], /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* Some */[toggletac], /* None */0, /* None */0, /* Some */[(false)], /* array */[
                                ReasonReact.element(/* None */0, /* None */0, DropdownToggle$BsReactstrap.make(/* Some */[(true)], /* Some */["red"], /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* array */["Tactics"])),
                                ReasonReact.element(/* None */0, /* None */0, DropdownMenu$BsReactstrap.make(/* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* array */[ReasonReact.element(/* Some */["ha"], /* None */0, DropdownItem$BsReactstrap.make(/* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* Some */[(function () {
                                                        editor2.setValue("ha\n" + Utils.getText(/* () */0));
                                                        return /* () */0;
                                                      })], /* None */0, /* None */0, /* None */0, /* array */["ha"]))]))
                              ]))
                    ]));
    });
  newrecord[/* initialState */10] = (function () {
      return /* record */[
              /* dropdownOpen */(false),
              /* tacticsOpen */(false)
            ];
    });
  newrecord[/* reducer */12] = (function (action, state) {
      if (action.tag) {
        return /* Update */Block.__(0, [/* record */[
                    /* dropdownOpen */state[/* dropdownOpen */0],
                    /* tacticsOpen */action[0]
                  ]]);
      } else {
        return /* Update */Block.__(0, [/* record */[
                    /* dropdownOpen */action[0],
                    /* tacticsOpen */state[/* tacticsOpen */1]
                  ]]);
      }
    });
  return newrecord;
}

exports.loadFile = loadFile;
exports.component = component;
exports.handleClick = handleClick;
exports.make = make;
/* loadFile Not a pure module */
