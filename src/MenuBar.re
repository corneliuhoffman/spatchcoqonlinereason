/* open BsReactstrap; */
open Webapi.Dom;
open Antd;
type tut('a)={
    ..
    readyState: string,
    result:string
  } as 'a;
  
type state = {
  tutot:tut({
    .
    readyState: string,
    result:string
  }),
  dropdownOpen: bool,
  tacticsOpen:bool};
  type action =
|Toggle(bool) 
| ToggleTac(bool)
| Tut(tut({
.
readyState: string,
result:string
}));

 let loadFile = [%bs.raw {|function(o)
                {
                    var fr = new FileReader();
                    fr.onload = function(e)
                        {
                           editor2.setValue(e.target.result);
                        };
                    fr.readAsText(o);
                }|}];
let loadTutFile = [%bs.raw {|function(o)
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
    
                    
        }|}];
let component = ReasonReact.reducerComponent("TopBar");

/* This is your familiar handleClick from ReactJS. This mandatorily takes the payload,
   then the `self` record, which contains state (none here), `handle`, `send`
   and other utilities */
let handleClick = (_event, self) => ();

let make = (~tutClick, ~saveToggle,~tooltips,  ~onRun, ~onUndo, ~onTree, children) => {
  ...component,
  initialState: () => {
    tutot:{pub readyState="0";
  pub result="noting"},
    dropdownOpen: [%bs.raw "false"],
    tacticsOpen: [%bs.raw "false"] },
reducer: (action, state) =>
    switch (action) {
    | Tut(a) =>ReasonReact.Update({...state, tutot:a })
    | Toggle(a) => ReasonReact.Update({...state, dropdownOpen:a })
    | ToggleTac (a) => ReasonReact.Update({...state, tacticsOpen:a })},
  render: self =>{
  let toggle = event => {
    self.send(Toggle(!self.state.dropdownOpen));
  };
  let toggletac = event => {
    self.send(Toggle(!self.state.tacticsOpen));
  };
  <Menu  mode=`Horizontal>
  <Menu.SubMenu title=(ReasonReact.stringToElement(  "File"))>
  <Menu.Item style=(
    ReactDOMRe.Style.make(
      ~padding="0px",
      ~margin="-12px 5px",
      (),
    )
  )>
  <a onClick=saveToggle>(ReasonReact.stringToElement(  "Save"))</a>
  </Menu.Item>
  
    <Menu.Item style=(
        ReactDOMRe.Style.make(
          ~padding="0px",
          ~margin="-12px 5px",
          (),
        )
      ) >
    <input className="loadFile"  itemID="loader"     style=(ReactDOMRe.Style.make(
        ~width="0.1px",
        ~height= "0.1px",
        ~opacity= "0",
        ~overflow="hidden",
        ~position="absolute",
        
        ~zIndex="-1", ()))
      id="myfile" _type="file"  name="file" onChange={a=>{
        let tar= ReactDOMRe._getElementById("myfile");
        let f=[%bs.raw {|document.getElementById("myfile").files[0]|}];
        Js.log("ha");
        Js.log(f);
        Js.log(loadFile((ReactDOMRe.domElementToObj(ReactEventRe.Form.target(a))##files)[0]));
       self.send(Toggle([%bs.raw "false"]))
        }}
        

                />
      <label style=(ReactDOMRe.Style.make(
      ~color="black",
     
      ~height="20px",
      ~width="100%",
     
      
       (),)) htmlFor="myfile">(ReasonReact.stringToElement("Load"))</label>
    
       </Menu.Item>

       /* <Menu.Item style=(
        ReactDOMRe.Style.make(
          ~padding="0px",
          ~margin="-12px 5px",
          (),
        )
      ) >
    <input className="loadTutFile"  itemID="tutloader"     style=(ReactDOMRe.Style.make(
        ~width="0.1px",
        ~height= "0.1px",
        ~opacity= "0",
        ~overflow="hidden",
        ~position="absolute",
        
        ~zIndex="-1", ()))
      id="myTutfile" _type="file"  name="Tutfile" onChange={a=>{
        /* let tar= ReactDOMRe._getElementById("myTutfile");
        let f=[%bs.raw {|document.getElementById("myTutfile").files[0]|}];
        Js.log("ha");
        Js.log(f); */
        let f=loadTutFile((ReactDOMRe.domElementToObj(ReactEventRe.Form.target(a))##files)[0]);
     
        f|>Js.Promise.then_(a=>{Js.log(a);Js.Promise.resolve()});
       
       self.send(Toggle([%bs.raw "false"]))
        }}
        

                />
      <label style=(ReactDOMRe.Style.make(
      ~color="black",
     
      ~height="20px",
      ~width="100%",
     
      
       (),)) htmlFor="myTutfile">(ReasonReact.stringToElement("Load Tutorial"))</label>
    
       </Menu.Item> */

        

       <Menu.Item style=(
        ReactDOMRe.Style.make(
          ~padding="0px",
          ~margin="-12px 5px",
          (),
        )
      )>
      <a onClick=(_ =>[%bs.raw {|window.location.reload(true)|}])>(ReasonReact.stringToElement(  "reload")) </a>
      </Menu.Item>
  </Menu.SubMenu>
  <Menu.SubMenu title=(ReasonReact.stringToElement("Actions"))>
  <Menu.Item style=(
    ReactDOMRe.Style.make(
      ~padding="0px",
      ~margin="-12px 5px",
      (),
    )
  )>
  <a onClick=onRun>(ReasonReact.stringToElement(  "Run (CTRL r)"))</a>
  </Menu.Item>
  <Menu.Item style=(
    ReactDOMRe.Style.make(
      ~padding="0px",
      ~margin="-12px 5px",
      (),
    )
  )>
  <a onClick=onUndo>(ReasonReact.stringToElement(  "Undo (CTRL u)"))</a>
  </Menu.Item>
  <Menu.Item style=(
    ReactDOMRe.Style.make(
      ~padding="0px",
      ~margin="-12px 5px",
      (),
    )
  )>
  <a onClick=onTree>(ReasonReact.stringToElement(  "Show Tree (CTRL t)"))</a>
  </Menu.Item>
  </Menu.SubMenu>
  <Menu.SubMenu  
  title=(ReasonReact.stringToElement(  "Tactics"))>
  { let comp1 = List.map( (x) => {
    Js.String.replaceByRe(Js_re.fromStringWithFlags("\"|\\\\", "g"), "", Array.of_list(x)[1])
}, Commands.commandstr);
let  comp = Array.of_list(List.map( (x) => {
   let  vv = Js.String.match(Js_re.fromString("Notation(.*?):="),x);
   let v= switch vv {
   |Some(a) => a[1]
   |None => ""
   };
    let ww =Js.String.trim(Js.String.replaceByRe(Js_re.fromStringWithFlags("constr\(.?\)|hyp\(.?\)|reference\(.?\)|ident\(.?\)","g"), " VAR ", v))++".";
   <Menu.Item 
   style=(
    ReactDOMRe.Style.make(
      ~padding="0px",
      ~margin="-12px 5px",
      (),
    )
  )
   key = ww>
   <div onClick={e=>{Utils.setText(ww++"\n"++Utils.getText())}}>
   (ReasonReact.stringToElement(ww))
   </div>
   </Menu.Item>
}, comp1

));
ReasonReact.arrayToElement(comp)}
  
  </Menu.SubMenu>

  <Menu.SubMenu 
  title=(ReasonReact.stringToElement(  "Help"))>
  <Menu.Item style=(
    ReactDOMRe.Style.make(~height="50px",
      ~padding="0px",
      ~margin="5pxpx 5px",
      (),
    )
  )>
  
  <a onClick=(_=> [%bs.raw
  {|window.open("https://www.dropbox.com/s/ttccnqfjs7lerbp/Book.pdf?dl=0")|}
])> (ReasonReact.stringToElement(  "Documentation")) </a>

  </Menu.Item>

  <Menu.SubMenu key="g2" title=(ReasonReact.stringToElement("Tutorials"))>


  <Menu.Item style=(
    ReactDOMRe.Style.make(~height="50px",
      ~padding="0px",
      ~margin="5pxpx 5px",
      (),
    )
  )>
  
  <a onClick= tutClick(0)> (ReasonReact.stringToElement("Introduction")) </a>

  </Menu.Item>
  <Menu.Item style=(
    ReactDOMRe.Style.make(~height="50px",
      ~padding="0px",
      ~margin="5pxpx 5px",
      (),
    )
  )>
  
  <a onClick= tutClick(1)> (ReasonReact.stringToElement("First tutorial.")) </a>

  </Menu.Item>
  <Menu.Item style=(
    ReactDOMRe.Style.make(~height="50px",
      ~padding="0px",
      ~margin="5pxpx 5px",
      (),
    )
  )>
  
  <a onClick= tutClick(2)> (ReasonReact.stringToElement("A puzzle.")) </a>

  </Menu.Item>
  </Menu.SubMenu>
  </Menu.SubMenu>
</Menu>
  
  
     
}};