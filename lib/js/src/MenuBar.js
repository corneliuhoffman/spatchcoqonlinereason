// Generated by BUCKLESCRIPT VERSION 2.2.3, PLEASE EDIT WITH CARE
'use strict';

var List = require("bs-platform/lib/js/list.js");
var $$Array = require("bs-platform/lib/js/array.js");
var Block = require("bs-platform/lib/js/block.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Utils = require("./technical/utils.js");
var React = require("react");
var Commands = require("./technical/commands.js");
var Antd_Menu = require("bs-ant-design/lib/js/src/Antd_Menu.js");
var Caml_array = require("bs-platform/lib/js/caml_array.js");
var ReasonReact = require("reason-react/lib/js/src/ReasonReact.js");
var CamlinternalOO = require("bs-platform/lib/js/camlinternalOO.js");

var shared = [
  "result",
  "readyState"
];

var loadFile = (function(o)
                {
                    var fr = new FileReader();
                    fr.onload = function(e)
                        {
                           editor2.setValue(e.target.result);
                        };
                    fr.readAsText(o);
                });

var loadTutFile = (function(o)
                  {
                      
                      var query = new Promise(function(resolve, reject){
                        var fr = new FileReader();
                        fr.readAsText(o);
                      var idnt1=setInterval(function(){
                        if (fr.readyState=="2")
              { 
                
                resolve(fr.result)
                clearInterval(idnt1)
              }


            }, 100 ) 


                 }




                   )
       return query
    
                    
        });

var component = ReasonReact.reducerComponent("TopBar");

function handleClick(_, _$1) {
  return /* () */0;
}

var class_tables = [
  0,
  0,
  0
];

function make(tutClick, saveToggle, _, onRun, onUndo, onTree, _$1) {
  var newrecord = component.slice();
  newrecord[/* render */9] = (function (self) {
      var comp1 = List.map((function (x) {
              return Caml_array.caml_array_get($$Array.of_list(x), 1).replace(new RegExp("\"|\\\\", "g"), "");
            }), Commands.commandstr);
      return ReasonReact.element(/* None */0, /* None */0, Antd_Menu.make(/* None */0, /* Some */[/* Horizontal */208994564], /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* None */0, /* array */[
                      ReasonReact.element(/* None */0, /* None */0, Antd_Menu.SubMenu[/* make */0](/* None */0, /* None */0, /* Some */["File"], /* None */0, /* None */0, /* None */0, /* None */0, /* array */[
                                ReasonReact.element(/* None */0, /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                            margin: "-12px 5px",
                                            padding: "0px"
                                          }], /* array */[React.createElement("a", {
                                                onClick: saveToggle
                                              }, "Save")])),
                                ReasonReact.element(/* None */0, /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                            margin: "-12px 5px",
                                            padding: "0px"
                                          }], /* array */[
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
                                                    document.getElementById("myfile");
                                                    var f = (document.getElementById("myfile").files[0]);
                                                    console.log("ha");
                                                    console.log(f);
                                                    console.log(Curry._1(loadFile, Caml_array.caml_array_get(a.target.files, 0)));
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
                                              }, "Load")
                                        ])),
                                ReasonReact.element(/* None */0, /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                            margin: "-12px 5px",
                                            padding: "0px"
                                          }], /* array */[React.createElement("a", {
                                                onClick: (function () {
                                                    return (window.location.reload(true));
                                                  })
                                              }, "reload")]))
                              ])),
                      ReasonReact.element(/* None */0, /* None */0, Antd_Menu.SubMenu[/* make */0](/* None */0, /* None */0, /* Some */["Actions"], /* None */0, /* None */0, /* None */0, /* None */0, /* array */[
                                ReasonReact.element(/* None */0, /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                            margin: "-12px 5px",
                                            padding: "0px"
                                          }], /* array */[React.createElement("a", {
                                                onClick: onRun
                                              }, "Run (CTRL r)")])),
                                ReasonReact.element(/* None */0, /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                            margin: "-12px 5px",
                                            padding: "0px"
                                          }], /* array */[React.createElement("a", {
                                                onClick: onUndo
                                              }, "Undo (CTRL u)")])),
                                ReasonReact.element(/* None */0, /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                            margin: "-12px 5px",
                                            padding: "0px"
                                          }], /* array */[React.createElement("a", {
                                                onClick: onTree
                                              }, "Show Tree (CTRL t)")]))
                              ])),
                      ReasonReact.element(/* None */0, /* None */0, Antd_Menu.SubMenu[/* make */0](/* None */0, /* None */0, /* Some */["Tactics"], /* None */0, /* None */0, /* None */0, /* None */0, /* array */[$$Array.of_list(List.map((function (x) {
                                            var vv = x.match(new RegExp("Notation(.*?):="));
                                            var v = vv !== null ? Caml_array.caml_array_get(vv, 1) : "";
                                            var ww = v.replace(new RegExp("constr\\(.?\\)|hyp\\(.?\\)|reference\\(.?\\)|ident\\(.?\\)", "g"), " VAR ").trim() + ".";
                                            return ReasonReact.element(/* Some */[ww], /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                                              margin: "-12px 5px",
                                                              padding: "0px"
                                                            }], /* array */[React.createElement("div", {
                                                                  onClick: (function () {
                                                                      editor2.setValue(ww + ("\n" + Utils.getText(/* () */0)));
                                                                      return /* () */0;
                                                                    })
                                                                }, ww)]));
                                          }), comp1))])),
                      ReasonReact.element(/* None */0, /* None */0, Antd_Menu.SubMenu[/* make */0](/* None */0, /* None */0, /* Some */["Help"], /* None */0, /* None */0, /* None */0, /* None */0, /* array */[
                                ReasonReact.element(/* None */0, /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                            height: "50px",
                                            margin: "5pxpx 5px",
                                            padding: "0px"
                                          }], /* array */[React.createElement("a", {
                                                onClick: (function () {
                                                    return (window.open("https://www.dropbox.com/s/ttccnqfjs7lerbp/Book.pdf?dl=0"));
                                                  })
                                              }, "Documentation")])),
                                ReasonReact.element(/* Some */["g2"], /* None */0, Antd_Menu.SubMenu[/* make */0](/* None */0, /* None */0, /* Some */["Tutorials"], /* None */0, /* None */0, /* None */0, /* None */0, /* array */[
                                          ReasonReact.element(/* None */0, /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                                      height: "50px",
                                                      margin: "5pxpx 5px",
                                                      padding: "0px"
                                                    }], /* array */[React.createElement("a", {
                                                          onClick: Curry._1(tutClick, 0)
                                                        }, "Introduction")])),
                                          ReasonReact.element(/* None */0, /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                                      height: "50px",
                                                      margin: "5pxpx 5px",
                                                      padding: "0px"
                                                    }], /* array */[React.createElement("a", {
                                                          onClick: Curry._1(tutClick, 1)
                                                        }, "First tutorial.")])),
                                          ReasonReact.element(/* None */0, /* None */0, Antd_Menu.Item[/* make */0](/* None */0, /* None */0, /* None */0, /* None */0, /* Some */[{
                                                      height: "50px",
                                                      margin: "5pxpx 5px",
                                                      padding: "0px"
                                                    }], /* array */[React.createElement("a", {
                                                          onClick: Curry._1(tutClick, 2)
                                                        }, "A puzzle.")]))
                                        ]))
                              ]))
                    ]));
    });
  newrecord[/* initialState */10] = (function () {
      if (!class_tables[0]) {
        var $$class = CamlinternalOO.create_table(shared);
        var ids = CamlinternalOO.get_method_labels($$class, shared);
        var result = ids[0];
        var readyState = ids[1];
        CamlinternalOO.set_methods($$class, /* array */[
              readyState,
              (function () {
                  return "0";
                }),
              result,
              (function () {
                  return "noting";
                })
            ]);
        var env_init = function () {
          return CamlinternalOO.create_object_opt(0, $$class);
        };
        CamlinternalOO.init_class($$class);
        class_tables[0] = env_init;
      }
      return /* record */[
              /* tutot */Curry._1(class_tables[0], 0),
              /* dropdownOpen */(false),
              /* tacticsOpen */(false)
            ];
    });
  newrecord[/* reducer */12] = (function (action, state) {
      switch (action.tag | 0) {
        case 0 : 
            return /* Update */Block.__(0, [/* record */[
                        /* tutot */state[/* tutot */0],
                        /* dropdownOpen */action[0],
                        /* tacticsOpen */state[/* tacticsOpen */2]
                      ]]);
        case 1 : 
            return /* Update */Block.__(0, [/* record */[
                        /* tutot */state[/* tutot */0],
                        /* dropdownOpen */state[/* dropdownOpen */1],
                        /* tacticsOpen */action[0]
                      ]]);
        case 2 : 
            return /* Update */Block.__(0, [/* record */[
                        /* tutot */action[0],
                        /* dropdownOpen */state[/* dropdownOpen */1],
                        /* tacticsOpen */state[/* tacticsOpen */2]
                      ]]);
        
      }
    });
  return newrecord;
}

exports.loadFile = loadFile;
exports.loadTutFile = loadTutFile;
exports.component = component;
exports.handleClick = handleClick;
exports.make = make;
/* loadFile Not a pure module */