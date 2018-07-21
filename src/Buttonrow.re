/* open BsReactstrap; */
open Antd;
open Tutorial;


let loadFile = [%bs.raw
  {|function(o)
                {
                    var fr = new FileReader(o);
                    fr.onload = function(e)
                        {
                           editor2.setValue(e.target.result);
                        };
                    fr.readAsText(o.files[0]);
                }|}
];

let component = ReasonReact.statelessComponent("ButtonRow");

/* This is your familiar handleClick from ReactJS. This mandatorily takes the payload,
   then the `self` record, which contains state (none here), `handle`, `send`
   and other utilities */
let handleClick = (_event, self) => ();

let make =
    ( ~forwardTut,
      ~occupied,
      ~tooltips,
      ~onRun,
      ~onUndo,
      ~onTree,
      ~saveToggle,
      ~onLoad,
      children,
    ) => {
  ...component,
  render: self =>
    /* {let func = [%bs.raw {|
           function(a){
           var fr = new FileReader(a);
           fr.onload = function(e)
               {
                   function(e, o){editor2.setValue(e.target.result)}
               };
           fr.readAsText(o.files[0])}
       |}]; */
    <div
      key="box"
      style=(
        ReactDOMRe.Style.make(
          ~display="inline-grid",
          ~gridTemplateColumns="25% 25% 25% 25%",
          ~width="100%",
          ~height="100%",
          (),
        )
      )>
      <button
        style=(
          ReactDOMRe.Style.make(
            ~background=
              switch (occupied) {
              | Free => "lightblue"
              | Busy => "red"
              | Tutorial(_, _) => "orange"
              },
            ~borderStyle="solid",
            ~borderColor="black",
            ~width="100%",
            ~height="100%",
            ~color="black",
            (),
          )
        )
        key="run"
        onClick=
        {switch (occupied) {
        | Free => onRun
        | Busy =>(_=>()) 
        | Tutorial(_, _) =>( _=>())
        }}>
        {
          let s = ReasonReact.stringToElement("run");
          s;
        }
      </button>
      <button
        style=(
          ReactDOMRe.Style.make(
            ~background=
              switch (occupied) {
              | Free => "lightblue"
              | Busy => "red"
              | Tutorial(_, _) => "orange"
              },
            ~width="100%",
            ~borderStyle="solid",
            ~borderColor="black",
            ~height="100%",
            ~color="black",
            (),
          )
        )
        key="undo"
        onClick=onUndo>
        {
          let s = ReasonReact.stringToElement("undo");
          s;
        }
      </button>
      <a onClick=forwardTut>
      <Icon style=(
        ReactDOMRe.Style.make(
          ~background=
            switch (occupied) {
            | Free => "red"
            | Busy => "red"
            | Tutorial(_, _) => "lightblue"
            },
          ~fontSize="30px",
          ~width="100%",
          ~borderStyle="solid",
          ~borderColor="black",
          ~height="100%",
          ~color="black",
          (),
        )
      ) type_=Antd.IconName.stepForward />
      </a>
     <a onClick={_=>{Js.log("click"); let j=  Utils.readJson({|{
      "input": {
        "w10": "string",
        "w11": "hhh"
      }, "output": "Write"}
      |});
    Js.log(j);
    }}>
     <Icon style=(
        ReactDOMRe.Style.make(
          ~background=
            switch (occupied) {
            | Free => "red"
            | Busy => "red"
            | Tutorial(_, _) => "lightblue"
            },
          ~fontSize="30px",
          ~width="100%",
          ~borderStyle="solid",
          ~borderColor="black",
          ~height="100%",
          ~color="black",
          (),
        )
      ) type_=Antd.IconName.stepBackward />
      </a>
    </div>,
  /* <button
       style=(ReactDOMRe.Style.make(~background="blue", ~color="white", ()))
       key="tree"
       onClick=onTree>
       {
         let s = ReasonReact.stringToElement("tree");
         s;
       }
     </button> */
  /* <button
       style=(ReactDOMRe.Style.make(~background="blue", ~color="white", ()))
       key="save"
       onClick=saveToggle>
       {
         let s = ReasonReact.stringToElement("save");


               s;}
     </button> */
  /* <input        style=(ReactDOMRe.Style.make(
             ~width="0.1px",
             ~height= "0.1px",
             ~opacity= "0",
             ~overflow="hidden",
             ~position="absolute",
             ~zIndex="-1", ()))
           id="myfile1" _type="file"  name="file" onChange={a=>{
             Js.log([%bs.raw

               {|document.getElementById("myfile").addEventListener('change',
               function(e) {
                 var file = document.getElementById("myfile").files[0];
                 console.log("the file is now", file)
               var reader = new FileReader();

                     reader.onload = function(e) {
                         editor2.setValue(reader.result);
                     }

                     reader.readAsText(file);

             })|}
     ]);

     }}

                     />
           <label style=(ReactDOMRe.Style.make(
           ~color="white",

           ~height="100%",
           ~display="flex",
           ~alignItems="center",
           ~justifyContent="center",

           ~background="blue", (),)) htmlFor="myfile">(ReasonReact.stringToElement("load"))</label> */
  /* <button
       style=(ReactDOMRe.Style.make(~background="blue", ~color="white", ()))
       key="load"
       onClick=onLoad>
       {
         let s = ReasonReact.stringToElement("load");
         s;
       }
     </button> */
};