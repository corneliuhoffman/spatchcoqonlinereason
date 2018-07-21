open BsReactstrap;

open Webapi.Dom;

type state = {
  dropdownOpen: bool,
  tacticsOpen: bool,
};

type action =
  | Toggle(bool)
  | ToggleTac(bool);

let loadFile = [%bs.raw
  {|function(o)
                {
                    var fr = new FileReader();
                    fr.onload = function(e)
                        {
                           editor2.setValue(e.target.result);
                        };
                    fr.readAsText(o);
                }|}
];

let component = ReasonReact.reducerComponent("TopBar");

/* This is your familiar handleClick from ReactJS. This mandatorily takes the payload,
   then the `self` record, which contains state (none here), `handle`, `send`
   and other utilities */
let handleClick = (_event, self) => ();

let make = (~saveToggle, children) => {
  ...component,
  initialState: () => {
    dropdownOpen: [%bs.raw "false"],
    tacticsOpen: [%bs.raw "false"],
  },
  reducer: (action, state) =>
    switch (action) {
    | Toggle(a) => ReasonReact.Update({...state, dropdownOpen: a})
    | ToggleTac(a) => ReasonReact.Update({...state, tacticsOpen: a})
    },
  render: self => {
    let toggle = event => self.send(Toggle(! self.state.dropdownOpen));
    let toggletac = event => self.send(Toggle(! self.state.tacticsOpen));
    <Navbar color="white" expand="md">
      <NavbarToggler />
      /* <Collapse isOpen=[%bs.raw "true"] > */
      <Dropdown isOpen=[%bs.raw "false"] toggle inNavbar=[%bs.raw "true"]>
        <DropdownToggle color="red" caret=[%bs.raw "false"]>
          (ReasonReact.stringToElement("File"))
        </DropdownToggle>
        <DropdownMenu>
          <DropdownItem onClick=(e => saveToggle())>
            (ReasonReact.stringToElement("Save"))
          </DropdownItem>
          <DropdownItem
            onClick=(
              e => {
                let a = ReactDOMRe._getElementsByClassName("loadFile")[0];
                ReactDOMRe.domElementToObj(a)##submit();
                /* e##target##submit() */
              }
            )>
            <input
              className="loadFile"
              itemID="loader"
              style=(
                ReactDOMRe.Style.make(
                  ~width="0.1px",
                  ~height="0.1px",
                  ~opacity="0",
                  ~overflow="hidden",
                  ~position="absolute",
                  ~zIndex="-1",
                  (),
                )
              )
              id="myfile"
              _type="file"
              name="file"
              onChange=(
                a => {
                  /* Js.log([%bs.raw

                       {|document.getElementById("myfile").addEventListener('change',
                       function(e) {
                         var file = document.getElementById("myfile").files[0];
                         console.log(file.name)
                       var reader = new FileReader();

                             reader.onload = function(e) {
                                 editor2.setValue(reader.result);
                             }

                             reader.readAsText(file);

                     })|}]); */
                  /* )##files)[0]); */
                  loadFile(
                    ReactDOMRe.domElementToObj(ReactEventRe.Form.target(a))##files(
                      0,
                    ),
                  );
                  self.send(Toggle([%bs.raw "false"]));
                }
              )
            />
            <label
              style=(
                ReactDOMRe.Style.make(
                  ~color="black",
                  ~height="20px",
                  ~width="100%",
                  /* ~display="flex",
                     ~alignItems="center", */
                  /* ~justifyContent="center", */
                  (),
                )
              )
              htmlFor="myfile">
              (ReasonReact.stringToElement("load"))
            </label>
          </DropdownItem>
        </DropdownMenu>
      </Dropdown>
      /* </Collapse> */
      /* <Collapse isOpen=[%bs.raw "true"] > */
      <Dropdown
        isOpen=self.state.tacticsOpen
        toggle=toggletac
        inNavbar=[%bs.raw "false"]>
        <DropdownToggle color="red" caret=[%bs.raw "true"]>
          (ReasonReact.stringToElement("Tactics"))
        </DropdownToggle>
        <DropdownMenu>
          <DropdownItem
            key="ha"
            onClick=(() => Utils.setText("ha" ++ "\n" ++ Utils.getText()))>
            (ReasonReact.stringToElement("ha"))
          </DropdownItem>
        </DropdownMenu>
      </Dropdown>
    </Navbar>;
  },
};