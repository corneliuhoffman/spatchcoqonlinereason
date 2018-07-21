[@bs.deriving jsConverter]
type goalstuff = {
  id: string,
  goals: string,
  exitTactic: string,
};

type result =
  | Correct(string)
  | Err(string)
  | Final(goalstuff);

let coq = WebWorkers.create_webworker("./sertop_js.js");

let response = ref("");

let listofids = ref([]);

exception CoqErr(string);

let completedRe = Js_re.fromStringWithFlags("Completed", "g");

let canceledRe = Js_re.fromStringWithFlags("Canceled", "g");

let processeddRe = Js_re.fromStringWithFlags("Processed", "g");

let addedRe = Js_re.fromStringWithFlags("Added (\\d*)", "g");

let errorRe = Js_re.fromStringWithFlags("rror|CoqExp", "g");

let idRe = Js_re.fromStringWithFlags("id (\\d*)", "g");

let interval = ref(Js.Nullable.null);

let clearint = () =>
  Js.Nullable.iter(interval^, (. intervalId) =>
    Js.Global.clearInterval(intervalId)
  );

let msgBackHandler = (e: WebWorkers.MessageEvent.t) => {
  let d = WebWorkers.MessageEvent.data(e);
  Js.log(d);
  response := response^ ++ "\n" ++ d;
};

WebWorkers.onMessage(coq, msgBackHandler);

let com = " \"From Coq Require Import Prelude.\"";

let initial = "(Add () " ++ com ++ ")";

let comm = [];

let getmax = (name: string, str, i) => {
  let stre = name ++ " (\\d*)";
  let reg = Js_re.fromStringWithFlags(stre, "g");
  let res = Js_re.fromString(stre);
  let marr = Js.String.match(reg, str);
  let numberlist =
    switch (marr) {
    | None => [|"-1"|]
    | Some(l) =>
      Array.map(
        x => {
          let a = Js.String.match(res, x);
          switch (a) {
          | Some(r) => r[1]
          | None => "-1"
          };
        },
        l,
      )
    };
  Array.sort((a, b) => int_of_string(b) - int_of_string(a), numberlist);
  numberlist[i];
};

let getmax1 = (list, i) => {
  let numberlist =
    Array.map(
      a => {
        let reg = Js_re.fromString("/Added (\\d*)/g");
        let poss = Js.String.match(reg, a);
        switch (poss) {
        | Some(l) => l[1]
        | None => "-1"
        };
      },
      list,
    );
  Array.sort((a, b) => int_of_string(b) - int_of_string(a), numberlist);
  numberlist[i];
};

let clean = x => {
  let s1 = String.trim(x);
  let s2 = Js.String.replaceByRe(Js_re.fromString("/ +/g"), " ", s1);
  Js.String.replaceByRe(Js_re.fromString("/ *\\./g"), "\\.", s2);
};

let checktactic = (x, comp) => true;

/* {

     let re=Js_re.fromString("Lemma|Proposition|Definition|Axiom|Notation|Theorem|Require");

     if (Js.String.match(re, x)!=None) {
        true;
     } else {

       let cc = List.map(com => Js_re.fromString("/"++(Js.String.replaceByRe(Js_re.fromString("/VAR/g"), ".*?", clean(com)))++"/g"), comp);
       ;
       let fil = List.filter(a => Js.String.match(a,x)!=None, cc);
       fil!=[];
     }


   }; */
let init = mess => {
  let x = clean(mess);
  let message =
    Js.Promise.make((~resolve, ~reject) => {
      WebWorkers.postMessage(coq, x);
      interval :=
        Js.Nullable.return(
          Js.Global.setInterval(
            () =>
              if (Js.String.match(processeddRe, response^) != None) {
                clearint();
                resolve(. x);
              },
            100,
          ),
        );
    });
  message;
};

let sentmessage = mess => {
  let x = clean(mess);
  let message =
    Js.Promise.make((~resolve, ~reject) => {
      response := "";
      if (checktactic(x, comm)) {
        WebWorkers.postMessage(coq, x);
        interval :=
          Js.Nullable.return(
            Js.Global.setInterval(
              () => {
                let s = Js.String.match(completedRe, response^);
                if (Js.String.match(completedRe, response^) != None) {
                  let z = Js.String.match(addedRe, response^);
                  switch (z) {
                  | Some(zz) =>
                    let ansid = getmax("Added", response^, 0);
                    clearint();
                    resolve(. Correct(ansid));
                  | None =>
                    if (Js.String.match(errorRe, response^) != None) {
                      let err = Index.geterr("(" ++ response^ ++ ")");
                      let error = String.concat("\n", err);
                      resolve(. Err(error));
                      clearint();
                    }
                  };
                };
              },
              100,
            ),
          );
      } else {
        resolve(. Err("bad tactic"));
        clearint();
      };
    });
  message;
};

let execute = addedResponse => {
  let exec =
    Js.Promise.make((~resolve, ~reject) =>
      switch (addedResponse) {
      | Correct(id) =>
        let ex = "(Exec " ++ id ++ ")";
        response := "";
        WebWorkers.postMessage(coq, ex);
        interval :=
          Js.Nullable.return(
            Js.Global.setInterval(
              () =>
                if (Js.String.match(completedRe, response^) != None) {
                  let sid = getmax("id", response^, 0);
                  /* currentid = sid; */
                  clearint();
                  resolve(. Correct(sid));
                }
                else{  
                if (Js.String.match(errorRe, response^)!=None) {
                  let z = Js.String.match(idRe, response^);
                  switch (z) {
                  | Some(zz) =>
                    let err = Index.geterr("(" ++ response^ ++ ")");
                    let error = String.concat("\n", err);
                    let sid = getmax("id", response^, 0);

                    Js.log(
                      "this is the main thing " ++ response^ ++ "\n and this",
                    );
                    WebWorkers.postMessage(coq, "(Cancel (" ++ sid ++ "))");
                    clearint();
                    resolve(. Err(error));
                  | None => ()
                  /* {reject(. CoqErr("stangeerror in exec"));
                     }; */
                  };
                }},
              100,
            ),
          );
      | Err(id) => resolve(. Err(id))
      }
    );
  exec;
};

let cancel = addedResponse => {
  let cancelit =
    Js.Promise.make((~resolve, ~reject) => {
      let ex = "(Cancel (" ++ addedResponse ++ "))";
      response := "";
      WebWorkers.postMessage(coq, ex);
      interval :=
        Js.Nullable.return(
          Js.Global.setInterval(
            () =>
              if (Js.String.match(canceledRe, response^) != None) {
                let sid = getmax("id", response^, 0);
                /* currentid = sid; */
                clearint();
                resolve(. Correct(sid));
              } else {
                let z = Js.String.match(idRe, response^);
                switch (z) {
                | Some(zz) =>
                  let err = Index.geterr("(" ++ response^ ++ ")");
                  let error = String.concat("\n", err);
                  let sid = getmax("id", response^, 0);
                  clearint();
                  resolve(. Err(error));
                | None => ()
                /* {reject(. CoqErr("stangeerror in exec"));
                   }; */
                };
              },
            100,
          ),
        );
    });
  cancelit;
};

let process_string = x => {
  let list = Js.String.split("============================", x);
  let list1 = List.filter(a => a != "none" && a != "", Array.to_list(list));
  let c = List.hd(List.tl(list1));
  let h = Js.String.split("\n", List.hd(list1));
  let conc = "$$" ++ Index.mylatex(c) ++ "$$";
  let hyps =
    List.map(
      x => {
        let y = Array.to_list(Js.String.split(":", x));
        "$$"
        ++ "\\textbf{"
        ++ List.hd(y)
        ++ " : } "
        ++ Index.mylatex(String.concat(":", List.tl(y)))
        ++ "$$";
      },
      Array.to_list(h),
    );
  {"hyps": hyps, "conc": conc};
};

let qquery = obtainedId => {
  let query =
    Js.Promise.make((~resolve, ~reject) =>
      switch (obtainedId) {
      | Correct(a) =>
        response := "";
        let qe = "(Query ((sid " ++ a ++ ")(pp ((pp_format PpStr))))  Goals)";
        WebWorkers.postMessage(coq, qe);
        interval :=
          Js.Nullable.return(
            Js.Global.setInterval(
              () =>
                if (Js.String.match(completedRe, response^) != None) {
                  let text =
                    try (List.hd(Index.getgoals(response^))) {
                    | _ => ""
                    };
                  listofids := listofids^ @ [[a, text]];
                  resolve(. Final({id: a, goals: text, exitTactic: ""}));
                  clearint();
                },
              100,
            ),
          );
      | Err(id) => resolve(. Err(id))
      }
    );
  query;
};

let pdeal = x =>
  init(x) |> Js.Promise.then_(sentmessage) |> Js.Promise.then_(execute);

let deal = x =>
  Js.Promise.then_(qquery, Js.Promise.then_(execute, sentmessage(x)));

let canceldeal = x => Js.Promise.then_(qquery, cancel(x));

let initiate = () => {
  let com = "(Add () \"From Coq Require Import Utf8.\")";
  pdeal(initial) |> Js.Promise.then_(x => pdeal(com))|>Js.Promise.then_(x => pdeal("(Add () \"Axiom classic : forall P:Prop, P \\/ not P.\")"));
};

/* pdeal(com); */
let maketab = (string, goal) =>
  if (! goal) {
    let y = Array.to_list(Js.String.split(":", string));
    if (List.length(y) > 1) {
      let name = List.hd(y);
      let expression = String.concat(":", List.tl(y));
      Formulaparsing.produce_possible_tactics_goal(
        Formulaparsing.parse(expression),
        name,
        false,
      );
    } else {
      [];
    };
  } else {
    Formulaparsing.produce_possible_tactics_goal(
      Formulaparsing.parse(string),
      "",
      true,
    );
  };

let lisofproms = (list, agg) =>
  List.fold_left(
    (a, b) =>
      a
      |> Js.Promise.then_(x => {
           Js.log("here\n\n");
           Js.log(b);
           Js.log("now\n\n");
           pdeal({j|(Add () "$b ")|j});
         }),
    agg,
    list,
  );
/*














       function unsafemessage(x) {
         x = clean(x)
         var message = new Promise(function (resolve, reject) {
             response = ""

             coq.postMessage(x)

             // ("(Add () ".concat(x, ")"));
             var idnt1 = setInterval(function () {
               if ((/Completed/g.exec(response))) {
                 var z = response.match(/Added (\d*)/g);
                 if (z) {
                   ansid = getmax1(z, 0);
                   //console.log("gor it");
                   resolve(ansid);
                   clearInterval(idnt1);
                 }

               } {
                 if (/rror/g.exec(response) || /CoqExp/g.exec(response)) {
                   var error = myMathLib.geterr("(".concat(response, ")"));
                   var strong = document.createTextNode(error);
                   var button = document.createElement("button")
                   button.appendChild(strong);
                   document.getElementById("w11").appendChild(button);
                   response = "";
                   reject(error);
                   clearInterval(idnt1);
                 }

               }
             }, 100)
           }


         )
         //console.log(message);
         return message


       }











       function print() {
         var r = "(".concat(response, ")");

         var foo = myMathLib.parsexp(r)[1]

         //console.log(["here is",myMathLib.parsexp(r)[1]]);
         if (foo || (foo = "")) {
           $("#w01").empty()

           goals = foo.split("\n\n");
           var g = document.createElement('div');
           g.id = 'tabs';
           var ul = document.createElement('ul')
           g.append(ul)
           for (let i = 0, length = goals.length; i < length; i++) {
             var sep = goals[i].split("\n============================\n")
             var c = sep.pop()
             var straightlist = sep[0].split("\n")
             straightlist = straightlist.filter(function (a) {
               return ((a != "============================") && a != "none" && a != "")
             })


             //console.log([c])
             //console.log(straightlist)

             var list = process_string(goals[i])
             //console.log(list);


             maketab(straightlist, list, g, ul, c, i)
           }
           $("#tabs").tabs();
           $("#tabs").tabs("refresh");


         } else {
           //console.log(["empty"]);

           $("#w01").empty();
           var strong = document.createTextNode("no more goals");
           var button = document.createElement("button")
           button.appendChild(strong);
           document.getElementById("w01").appendChild(button);


         }
         reRenderMath()

         // MathJax.Hub.Queue(["Reprocess",MathJax.Hub ]);

       }



       function oldquery(a) {
         response = ""
         //console.log(["the a is ", a])
         var query = new Promise(function (resolve, reject) {
             var qe = "(Query ((sid ".concat(currentid, ")(pp ((pp_format PpStr))))  Goals)");
             //console.log(["the qquery is ", qe])
             coq.postMessage(qe);
             var idn1 = setInterval(function () {
               if (/Completed/g.exec(response)) {

                 //console.log(["oldsuccess", response])
                 print();
                 resolve("done")
                 clearInterval(idn1)
               }


             }, 100)


           }




         )

         //console.log(query);
         return query
       }




       function qquery(a) {
         response = ""
         //console.log(["the a is ", a])
         var query = new Promise(function (resolve, reject) {
             var qe = "(Query ((sid ".concat(currentid, ")(pp ((pp_format PpStr))))  Goals)");
             //console.log(["the qquery is ", qe])
             coq.postMessage(qe);
             var idnt1 = setInterval(function () {
               if (/Completed/g.exec(response)) {
                 succesful();
                 //console.log(["success", response])
                 print();
                 resolve("done")
                 clearInterval(idnt1)
               }


             }, 100)


           }




         )

         //console.log(query);
         return query
       }




       function exec() {

         var id = setInterval(frame, 10);

         function frame() {
           if (/Completed/g.exec(response) || /rror/g.exec(response) || /CoqExp/g.exec(response)) {

             aexec();

             clearInterval(id);


           }
         }
       }



       function initpost(x) {

         var id1 = setInterval(frame, 10);

         function frame() {
           if (/Processed/g.exec(response)) {
             response = "";
             coq.postMessage(x);
             //console.log(["I am sending", x]);
             clearInterval(id1);
           }
         }
       }

       function mypost(x) {

         var id1 = setInterval(frame, 10);

         function frame() {
           if (/Completed/g.exec(response)) {
             response = "";
             coq.postMessage(x);
             //console.log(["I am sending", x]);
             clearInterval(id1);
           }
         }
       }


       initpost(x);

       exec();
       var com = " \"From Coq Require Import Utf8.\"";
       var x = "(Add () ".concat(com, ")");
       mypost(x)
       execute("");

       //console.log(response)

       var queue = [];
       var busy = false;

       function send() {
         var sending = commandstr.map(function (x) {
           return x[1].replace(/\'/g, "\\\"")
         })
         sending.map(function (c) {
           var x = "(Add () ".concat("\"", c, "\")");
           mypost(x)
           exec();

           //console.log(response)

         })
       }

       send()


       /* EG: Is there a race condition here? */
       coq.onmessage = e => {
         var d = e.data;
         console.log(e.data);
         response = response.concat("\n", d);
       }
     </script>
     <script>
       const flatten = function (arr, result = []) {
         for (let i = 0, length = arr.length; i < length; i++) {
           const value = arr[i];
           if (Array.isArray(value)) {
             flatten(value, result);
           } else {
             result.push(value);
           }
         }
         return result;
       };

       // function aquery() {
       // var z =  response.match(/id (\d*)/g);
       // //console.log(["the isd is ", z]);
       // if (z!= null) {
       //   sid=getmax(z, 0);
       //   // var t = myMathLib.geterr("(".concat(response, ")"))[1];
       //   if (/rror/g.exec(response) || /CoqExp/g.exec(response))
       //          {var error = myMathLib.geterr("(".concat(response, ")"));
       //       var strong=document.createTextNode(error);
       //     var button = document.createElement("button")
       //     button.appendChild(strong);
       //     document.getElementById("w11").appendChild(button);
       //     response="";
       //     //console.log(["the sid is", sid])
       //     coq.postMessage("(Cancel (".concat(sid, "))"))
       //   //console.log(["(Cancel (".concat(sid, "))")])
       //   exec ()
       //   //console.log([currentid])
       //   var query ="(Query ((sid ".concat(currentid,")(pp ((pp_format PpStr))))  Goals)");
       //   //console.log(["an error new query", query])
       //   coq.postMessage(query);
       //   print();
       //   }

       // else{ currentid=sid;
       //   var query ="(Query ((sid ".concat(sid,")(pp ((pp_format PpStr))))  Goals)");
       //   //console.log("the query is")
       //   //console.log([query]);
       //   coq.postMessage(query);}
       // }
       // }

       //  function query() {
       //   var id1 = setInterval(frame, 10);
       //   function frame() {
       //     if (/Completed/g.exec(response) || (/rror/g.exec(response))) {
       //       //console.log(["it worked"])
       //       aquery();
       //       response="";
       //       clearInterval(id1);
       //     }

       //   }
       // }




       function unbusy() {
         var un = new Promise(function (resolve, reject) {
           var idn1 = setInterval(function () {
             if (currentid = 29) {
               busy = false
               resolve("")

               clearInterval(idn1)
               console.log("FINISHED", currentid)
             }


           }, 200)
         });
         return un
       }

       unbusy().then(function (a) {
         listofids.push(["29", ""])
       })




       function myFunction() {

         var listofcommands = editor2.getValue().trim().split("\n");
         var command = listofcommands[0]


         //document.getElementById("addnC").value;
         var x = ("(Add () ".concat("\"", command, "\")"))
         response = "";
         busy = true;
         $("#w11").empty();

         sentmessage(x).then(execute).then(qquery).catch(function (x) {
           oldquery(x)
         })




         // exec();
         // print();
         // query();
         // print();



       }

       function search(x) {
         var cc = ("(Add () ".concat("\" SearchPattern", x, ".\")"))
         $("#w11").empty();
         var resultsodsearch;
         var s = unsafemessage(cc).then(execute).then(function (a) {
           var r = "(".concat(response, ")");
           var foo = myMathLib.getgoals(r);
           return flatten(foo).filter(x => x != 0)
         });
         s.then(function (rez) {
           rez.map(a => {
             var strong = document.createTextNode(a);
             var button = document.createElement("button");
             button.appendChild(strong);
             document.getElementById("w11").appendChild(button);
           })
         });
         return s
       }


       function undo() {
         if (listofids.length > 1) {
           listofids.pop()

           response = ""
           coq.postMessage("(\"Cancel\"  (".concat(currentid, "))"))
           console.log("\"(Cancel  (".concat(currentid, "))\""))
           var id1 = setInterval(function () {
             if (/Completed/g.exec(response)) {
               //succesful();
               ////console.log(["success", response])
               oldquery(currentid)
               print();
               var str = $("#w00").children().last().text() + "\n"
               $("#w00").contents().last().remove()
               var doc = editor2.getDoc();
               doc.replaceRange(str, CodeMirror.Pos(0, 0))
               clearInterval(id1);

             }
           }, 200)

           currentid = listofids[listofids.length - 1][0];

         }

       }

       $("#save").click(function () {

         var textfilename = $("#filename").val() + ".v"

         var txt = jQuery.makeArray($("#w00").contents().map(function () {
           return this.textContent
         })).join("\n")
         var blob = new Blob([txt.trim()], {
           type: "text/plain;charset=utf-8"
         });
         saveAs(blob, textfilename);
         savewindow.style.display = "none";
       })

       function save() {
         savewindow.style.display = "block";

       }


       function loadFile(o) {
         var fr = new FileReader(o);
         fr.onload = function (e) {
           showDataFile(e, o);
         };
         fr.readAsText(o.files[0]);
       }

       function showDataFile(e, o) {
         editor2.setValue(e.target.result);
       }
     </script>
     <article>
       <!-- <script type="text/x-mathjax-config">
 MathJax.Hub.Config({
     extensions: ["tex2jax.js"],
     jax: ["input/TeX","output/HTML-CSS"],
     tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
   });
 }); -->
       </script>

     </article>

     <script>
       var chart_config;
       var allpretrees;

       function tree() {

         allpretrees = breaklist(listofids).filter(x => x.length > 0).map(
           aa => {
             var list = pretree(aa[0].slice(1));
             console.log(list)
             var ch = {
               chart: {
                 container: "#collapsable-example",

                 animateOnInit: true,

                 node: {
                   collapsable: true
                 },
                 animation: {
                   nodeAnimation: "easeOutBounce",
                   nodeSpeed: 700,
                   connectorsAnimation: "bounce",
                   connectorsSpeed: 700
                 }
               },
               nodeStructure: makelongertree(makejsontree(list))
             };
             return ch
           });

         var w = window.open("external/treant/examples/collapsable/", "treewindow")
         console.log(allpretrees)
         w.chart_config = allpretrees[0];

         // chart_config = allpretrees[0];

         //var s= new Treant( chart_config ,true, $);



       };
     </script>

     <div class="panes-container">
       <button class="buttonrun" onclick="myFunction()">run</button>
       <button class="buttonrun" onclick="undo()">undo</button>
       <button class="buttonrun" onclick="save()">save</button>
       <input type="file" name="file" id="file" class="inputfile" onchange="loadFile(this)" />
       <label for="file">load</label>
       <button class="buttonrun" onclick="tree()">tree</button>

     </div> */