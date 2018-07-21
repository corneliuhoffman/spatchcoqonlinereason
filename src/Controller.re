open Webapi.Dom;
open Buttonrow;
open Tutorial;
open BsReactstrap;

/* open BsReactstrap; */

type state = {
  tooltip:bool,
  loadRef:option(ReasonReact.reactRef),
  save:bool,
  busy: occupied,
  w00: string,
  w01: string,
  w10: string,
  w11: string,
  response: string,
  listofids: list(list(string)),
};

type rr = ReasonReact.reactRef;
let setSectionRef = (theRef, {ReasonReact.state}) => {
  ReasonReact.Update({...state, loadRef: Js.Nullable.to_opt(theRef)});()
  /* wondering about Js.Nullable.to_opt? See the note below */
};

/* Action declaration */
type action =
  | Run(string, occupied)
  | Undo
  | Tree
  | Save
  | Load
  | W00(string)
  | W01(string)
  | W10(string)
  | W11(string)
  | ListofId(list(list(string)))
  | Ocupate(occupied)
  |FileName(string)
|UpdateTuts(array(tut), int);

/* This is the basic component. */
let component = ReasonReact.reducerComponent("Controller");

/* This is your familiar handleClick from ReactJS. This mandatorily takes the payload,
   then the `self` record, which contains state (none here), `handle`, `send`
   and other utilities */
let make = children => {
  ...component,
  initialState: () => {
    loadRef:None,
    tooltip:[%bs.raw "false"],
    save:[%bs.raw "false"],
    busy: Busy,
    /* Tutorial([||], 2), */
    w00: "",
    w01: "",
    w10: "",
    w11: "",
    response: "$$\\lambda \\lor$$",
    listofids: [],
  },
  reducer: (action, state) =>
    switch (action) {
    | Run(a, b) => ReasonReact.Update({...state,busy: b, response: a})
    | Undo => ReasonReact.Update({...state, response: "uno"})
    | Tree => ReasonReact.Update({...state, response: "$$\\lambda \\mu$$"})
    | Save =>{ ReasonReact.Update({...state, save: !state.save})}
    | Load => ReasonReact.Update({...state, response: "load"})
    | W00(a) => ReasonReact.Update({...state, w00: a})
    | W01(a) => ReasonReact.Update({...state, w01: a})
    | W10(a) => ReasonReact.Update({...state, w10: a})
    | W11(a) => ReasonReact.Update({...state, w11: a})
    | ListofId(li) => ReasonReact.Update({...state, listofids: li})
    | Ocupate(a) => ReasonReact.Update({...state, busy: a})
    | FileName(a)=>ReasonReact.Update({...state, response: a})
    | UpdateTuts(a, b) =>{ ReasonReact.Update({...state, busy:Tutorial(a, b)})}
    },
    
  didMount: self => {
    let commands = List.map(x => List.hd(List.tl(x)), Commands.commandstr);
    let in1 = Coqmanager.initiate();
    let prom = Coqmanager.lisofproms(commands, in1);

    prom
    |> Js.Promise.then_(x => {
         self.send(Ocupate(Free));
         Js.Promise.resolve("done");
       });
    ReasonReact.Update({...self.state, w00: ""});
    
  },
  /* didUpdate:  _ => {
       [%bs.raw {|MathJax.Hub.Queue(["Typeset",MathJax.Hub,root])|}];
     }, */
  render: self => {
    let handleChange = event => {
      let ww = ReactDOMRe.domElementToObj(ReactEventRe.Form.target(event))##value;
      self.send(FileName(ww));
    };
    let onRun = _event => {
      let str = Js.String.trim(Utils.getText());
      /* self.state.w10; */
      let comms = Js.String.split("\n", str);
      let command0 = Js.String.replaceByRe(Js_re.fromStringWithFlags("\"", "g"), "\\\"", comms[0]);
      let command1 = Js.String.replaceByRe(Js_re.fromStringWithFlags("\'", "g"), "\\\'", command0);
      Js.log("(Add () \"" ++ command1 ++ "\" )");
      self.send(Run("busy", Busy));
      let v =
        Coqmanager.deal("(Add () \"" ++ command1 ++ "\" )")
        |> Js.Promise.then_(re => {
             switch (re) {
             | Coqmanager.Final(x) =>
               
               self.send(W01(x.goals));

               self.send(W00(self.state.w00 ++ "\n" ++ comms[0]));
               let rest = Array.sub(comms, 1, Array.length(comms) - 1);
               let newtext = String.concat("\n", Array.to_list(rest));
               
               Utils.setText(newtext);
               let newids = [
                 [x.id, x.goals, command1],
                 ...self.state.listofids,
               ];
               self.send(Run("free", Free));
               self.send(ListofId(newids));
               [%bs.raw
               {|MathJax.Hub.Queue(["Reprocess",MathJax.Hub ])|}];
             | Err(x) =>
            { self.send(Run("free", Free));
               self.send(W11(x));}
             | Correct(x) =>
             { self.send(Run("free", Free));
             self.send(W11(x));}
             };
             Js.Promise.resolve();
           });
      ();
    };
    
    let tutRun =_event=>{
      switch (self.state.busy){
      | Free =>()
      | Busy=> ()
      | Tutorial(tuts, pos)=>
      {let str =tuts[pos].input.w10;
        let comms = Js.String.split("\n", str);
        let command0 = Js.String.replaceByRe(Js_re.fromStringWithFlags("\"", "g"), "\\\"", str);
        let command1 = Js.String.replaceByRe(Js_re.fromStringWithFlags("\'", "g"), "\\\'", command0);
        Js.log("(Add () \"" ++ command1 ++ "\" )");
        let v=
        Coqmanager.deal("(Add () \"" ++ command1 ++ "\" )")
        |>Js.Promise.then_(re => {
             switch (re) {
             | Coqmanager.Final(x) =>
            
               
               self.send(W01(x.goals));

               self.send(W00(self.state.w00 ++ "\n" ++ String.trim(str)));
               let newids = [
                 [x.id, x.goals, command1],
                 ...self.state.listofids,
               ];
              
               self.send(ListofId(newids));
               
               self.send(UpdateTuts(tuts, pos+1));
               [%bs.raw {|MathJax.Hub.Queue(["Reprocess",MathJax.Hub ])|}];
              
             | Err(x) =>
               
               self.send(W11(x));
             | Correct(x) =>
               
               self.send(W11(x));
             };
             Js.Promise.resolve();
           })}
      
    }

    };


let  tutClick= (st,_)=>
    { if (self.state.listofids!=[])
      {Js.log(self.state.listofids);
        let c= List.hd(List.hd(List.rev(self.state.listofids)));
        let v =
        Coqmanager.canceldeal(c)
        |> Js.Promise.then_(re => {
             
             switch (re) {
             | Coqmanager.Final(x) =>
               self.send(W01(""));
               self.send(W00(""));
               
               Utils.setText("");

               self.send(ListofId([]));
             | Err(x) =>
               
               self.send(W11(x));
             | Correct(x) =>
               
               self.send(W11(x));
             };
             Js.Promise.resolve();
           })};
      self.send(UpdateTuts(Tutorial.example[st], 0));
      Utils.setText(Tutorial.example[st][0].input.w10);
    };




    /* this moves forward in the tutorial, it reads the position of the tut from the state and executes the move */

    let forwardTut =_event=>{
      switch (self.state.busy){
      | Free =>()
      | Busy=> ()
      | Tutorial(tuts, pos)=>
      {
        if (pos < Array.length(tuts)-1)
        { switch tuts[pos].output {
        | Run => {Utils.setText(tuts[pos].input.w10); 
         tutRun();
         self.send(W11(tuts[pos+1].input.w11));
         Utils.setText(tuts[pos+1].input.w10);
         self.send(UpdateTuts(tuts, pos+1))}
        | Write => {self.send(W11(tuts[pos+1].input.w11)); Utils.setText(tuts[pos+1].input.w10); self.send(UpdateTuts(tuts, pos+1))}
        | Undo => ()
        };
          
        }
      }
      }

    };





    let onUndo = _event => {if (List.length(self.state.listofids)>0){
      let str = Utils.getText();
      /* self.state.w10; */
      let currentid = List.hd(self.state.listofids);
      Js.log(currentid);
      let comms = Js.String.split("\n", self.state.w00);
      let command1 = comms[Array.length(comms) - 1];
      let olds =
        String.concat(
          "\n",
          Array.to_list(Array.sub(comms, 0, Array.length(comms) - 1)),
        );
      let v =
        Coqmanager.canceldeal(List.hd(currentid))
        |> Js.Promise.then_(re => {
             
             switch (re) {
             | Coqmanager.Final(x) =>
               self.send(W01(x.goals));
               self.send(W00(olds));
               let rest = Array.sub(comms, 1, Array.length(comms) - 1);
               let newtext = String.concat("\n", Array.to_list(rest));
               
               Utils.setText(command1 ++ "\n"++Utils.getText());
               self.send(ListofId(List.tl(self.state.listofids)));
             | Err(x) =>
               
               self.send(W11(x));
             | Correct(x) =>
               
               self.send(W11(x));
             };
             Js.Promise.resolve();
           });
      self.send(Undo);}
    };
    let onTree = _event => {
      let l =
        List.map(x => List.hd(List.tl(x)), List.rev(self.state.listofids));
      let lemmas = Tree.breakval(l, "");
      let trees =
        List.map(
          a => Tree.cleantree(Tree.makelongertree(Tree.makejsontree(a))),
          lemmas,
        );
      let pt =
        Array.of_list(
          List.map(
            a => {
              "chart": {
                "container": "#collapsable-example",
                "animateOnInit": true,
                "node": {
                  "collapsable": true,
                },
                "animation": {
                  "nodeAnimation": "easeOutBounce",
                  "nodeSpeed": 700,
                  "connectorsAnimation": "bounce",
                  "connectorsSpeed": 700,
                },
              },
              "nodeStructure": a,
            },
            trees,
          ),
        );
      let arroftrees =
        switch (Js.Json.stringifyAny(pt)) {
        | Some(x) => x
        | None => ""
        };
      let update = [%bs.raw {|
 function (a) {allpretrees=a;

 }
|}];
      update(pt);
      /* window##allpretrees:= arroftrees; */
      let w = [%bs.raw
        {|window.open("../external/treant/examples/collapsable/index.html?alltrees=`ha`")|}
      ];
      ();
    };
    let saveToggle = _event => {

      self.send(Save);
    };
    
    
    
    let onLoad = _event => self.send(Load);

/* this is the large container called box */
    <div
      key="box"
      onKeyDown={
        (evt) =>{
        if ((ReactEventRe.Keyboard.getModifierState("Control", evt))&&(ReactEventRe.Keyboard.key(evt)=="r"))
        {onRun()};
        if ((ReactEventRe.Keyboard.getModifierState("Control", evt))&&(ReactEventRe.Keyboard.key(evt)=="u"))
        {onUndo()};
        if ((ReactEventRe.Keyboard.getModifierState("Control", evt))&&(ReactEventRe.Keyboard.key(evt)=="t"))
        {onTree()};
      }
           
  }
      style=(
        ReactDOMRe.Style.make(
          ~display="inline-grid",
          ~gridTemplateColumns="auto",
          ~gridTemplateRows="5% 45% 45% 5%",
          ~width="100%",
          ~height="100%",
          (),
        )
      )>

/* this is the save modal */
      <Save content=self.state.w00 see=self.state.save  toggle=(_=>self.send(Save))/>
    
    <MenuBar tutClick saveToggle=saveToggle tooltips=self.state.tooltip   onRun onUndo onTree />
    /* This is the second row, containig w00 and w01 */
      <div
        key="row0"
        style=(
          ReactDOMRe.Style.make(
            ~display="inline-grid",
            ~gridTemplateColumns="50% 50%",
            ~gridTemplateRows="100%",

            ~width="100%",
            ~height="docment.height",
            (),
          )
        )>
   
        <Lists key="w00" name=self.state.w00 color="#e6ffe6" />
      
      
       
        <div style=(
          ReactDOMRe.Style.make( ~borderStyle= "solid",~display="inline-block", ~margin="0px", ())
        )>
      <MyTabs  key="w01" text=self.state.w01 />
         </div>
      </div>
      <div
        key="row1"
        style=(
          ReactDOMRe.Style.make(
            ~display="inline-grid",
            ~gridTemplateColumns="50% 50%",
            ~width="100%",
            ~gridTemplateRows="100%",
            ~height="inherit",
            (),
          )
        )>
        
        <textarea
        id="haha"
        className="w10"
        value=self.state.w10
        
        style=(
          ReactDOMRe.Style.make(
            ~alignSelf="left",
            ~backgroundColor="white",
            ~fontSize="12px",
            
            
            (),
          )
        )
        key="0"
      />

        { let w11=      
        switch (self.state.busy)
        { | Busy=> {
            <div>
              <ActivityIndicator size=32.0 color=(200, 200, 200) />
              (ReasonReact.stringToElement("loading please wait"))
            </div>;
          } 
          |Free => {
           
         
          <Lists key="w11" name=self.state.w11 color="lightgrey" /> }
          | Tutorial(tuts, pos)=>{
            <Lists key="w11" name=tuts[pos].input.w11 color="lightgrey" /> }
           
        };
          w11}
      </div>
      
      <Buttonrow forwardTut occupied=self.state.busy tooltips=self.state.tooltip onRun onUndo saveToggle onLoad onTree />
    </div>;
    
  },
};