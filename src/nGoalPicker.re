open BsReactstrap;
[@bs.val] external setText : string => unit =
  "editor2.setValue";
  type state = {
    dropdownOpen: bool};
    type action =
  |Toggle ;

  let component = ReasonReact.reducerComponent("NGoalPicker");

  /* This is your familiar handleClick from ReactJS. This mandatorily takes the payload,
     then the `self` record, which contains state (none here), `handle`, `send`
     and other utilities */
  let handleClick = (_event, self) => ();
  
  let make = (~name,~color,~goal, children) => {
    ...component,
    initialState: () => {
        dropdownOpen: [%bs.raw "false"] },
    reducer: (action, state) =>
        switch (action) {
        | Toggle => ReasonReact.Update({...state, dropdownOpen: !state.dropdownOpen})},
    didUpdate:  _ => {
      [%bs.raw {|MathJax.Hub.Queue(["Typeset",MathJax.Hub,root])|}];
    },
    
    render: self => {
        let toggle = event => {
           
            self.send(Toggle);
          };
        <Dropdown isOpen={self.state.dropdownOpen} size="sm" toggle={toggle}>
        <DropdownToggle color >
        {let z= 
            if (goal){let s= "$"++Index.mylatex(name)++"$";
          s}
            else{let li= Js.String.split(":", name);
            if (Array.length(li)>1)
            {let h = li[0];
            let tl = Index.mylatex(String.concat(":", Array.to_list(Array.sub(li, 1,Array.length(li)-1))));
            {j|\$ \\mathbf{$h :\\ } $tl \$ |j};}
            else{li[0]}
          };
         ( ReasonReact.stringToElement({j|$z|j}))}
        </DropdownToggle>
        <DropdownMenu >
        {let options=Array.of_list(Coqmanager.maketab(name,goal));
        Array.map(x => <DropdownItem  key=x
        onClick={()=>Utils.setText(x++"\n"++Utils.getText())}>( ReasonReact.stringToElement(x) )</DropdownItem>, options)}
          
        </DropdownMenu>
      </Dropdown>

/*    
      <Picker 
        value={let z= 
          if (goal){let s= "$"++Index.mylatex(name)++"$";
        ;s}
          else{let li= Js.String.split(":", name);
          if (Array.length(li)>1)
          {let h = li[0];
          let tl = Index.mylatex(String.concat(":", Array.to_list(Array.sub(li, 1,Array.length(li)-1))));
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
        options=Coqmanager.maketab(name,goal)
        onValueChange= ((a)=>{; switch a {
        | Some(b) => {;setText(b)}
        | None=>
        }})
        
      /> */
     },
  };

