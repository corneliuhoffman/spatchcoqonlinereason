open BsReactstrap;
type state = {
    activeTab: string};
    type action =
  |Toggle(string) ;
let component = ReasonReact.reducerComponent("MyNTabs");

let make = (~text, children) => {
  ...component,
  initialState: () => {
    activeTab: "1" },
reducer: (action, state) =>
    switch (action) {
    | Toggle(a) => ReasonReact.Update({...state, activeTab: a})},

  render: self => {

    let toggle=(tab)=> {
        if (self.state.activeTab !== tab) {
            
          self.send(Toggle(tab))
          };
        };
    
    let butons = Js.String.split("\n\n", text);
    {<Nav key="Aaa" tabs=[%bs.raw "true"] >
    {Array.mapi(
        (s, x) => {
               let ss= string_of_int(s+1);
            <NavItem key=string_of_int(s+1)>
            <NavLink innerRef={j|#$ss|j} className={if (s==0){"active"}else {""}}
              onClick={() => { toggle(string_of_int(s)); }}
            >
           ( ReasonReact.stringToElement(
                "  Goal  " ++ string_of_int(s+1) ++ "   ",
              ))
            </NavLink>
          </NavItem>},
        butons
      )}
      </Nav>};
      {<TabContent activeTab={self.state.activeTab}>
          
          {Array.mapi(
            (s, x) => (
                <TabPane key =x tabId=string_of_int(s+1)>
                <Row>
                <Col  sm="12">
                <HypLists name=x />
                </Col>
                </Row>
                </TabPane>  
            
            ), butons)}
 </TabContent>}
  },
};