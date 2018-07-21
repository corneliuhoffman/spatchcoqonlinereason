[@bs.val] external setText : string => unit =
  "editor2.setValue";
let renderOption = (option, value) =>
  <div
    style=(
      ReactDOMRe.Style.make(
        ~background="lightgreen",
              ~width="100%",
        ~padding="0px",
        ~borderBottom="1px solid rgba(0, 0, 0, 0.1)",
        ~backgroundColor=
          switch (value) {
          | Some(value) => value == option ? "red" : ""
          | _ => ""
          },
        ~color=
          switch (value) {
          | Some(value) => value == option ? "#fff" : ""
          | _ => ""
          },
        (),
      )
    )>
    (ReasonReact.stringToElement(option))
  </div>;

  let component = ReasonReact.statelessComponent("GoalPicker");

  /* This is your familiar handleClick from ReactJS. This mandatorily takes the payload,
     then the `self` record, which contains state (none here), `handle`, `send`
     and other utilities */
  let handleClick = (_event, self) => ();
  
  let make = (~name,~color,~goal, children) => {
    ...component,
    didUpdate:  _ => {
      [%bs.raw {|MathJax.Hub.Queue(["Typeset",MathJax.Hub,root])|}];
    },
    render: self => {
      let tacts=try (Coqmanager.maketab(name,goal)) { |_ => []};
   
      <Picker padding="0px"
        value={ let nname=Js.String.replace("\n", " ", name);
          let z= 
          if (goal){                let text=try (Index.mylatex(nname)) { |_ => name};

            let s= "$"++Index.mylatex(nname)++"$";
        s}
          else{let li= Js.String.split(":", nname);
          if (Array.length(li)>1)
          {let h = li[0];
            let tl1=String.concat(":", Array.to_list(Array.sub(li, 1,Array.length(li)-1)));
           let tl=try (Index.mylatex(tl1)) { |_ => tl1};
          {j|\$ \\mathbf{$h :\\ } $tl \$ |j};}
          else{li[0]}
        };
    
       Some({j|$z|j})}

        disabled=false
        renderPicker=(
          value =>
            switch (value) {
            | Some(v) =>{
              let t = ReasonReact.stringToElement(v);<div style=(
            ReactDOMRe.Style.make(~background=color,~borderBottom="1px solid black",~padding="5px",~fontSize="14px",~width="100%",()))> t </div>}
            | None => ReasonReact.stringToElement({js|Select a value …|js})
            }
        )
        renderOption
        options= tacts
       
        onValueChange= ((a)=>{ switch a {
        | Some(b) => {Utils.setText(b++"\n"++Utils.getText())}
        | None=> ()
        }})
        
      />
     },
  };

