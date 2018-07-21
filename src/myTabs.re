let component = ReasonReact.statelessComponent("MyTabs");

let make = (~text, children) => {
  ...component,
  render: self => {
    let butons = Js.String.split("\n\n", text);
    let tabs =
      Array.mapi(
        (s, x) => (
          <div
            style=(
              ReactDOMRe.Style.make(
                ~textAlign="left",
                ~background="#F5F5F5",
                ~padding="5px",
                (),
              )
            )>
            (
              ReasonReact.stringToElement(
                "  Goal  " ++ string_of_int(s + 1) ++ "   ",
              )
            )
          </div>,
          () => <HypLists name=x />,
        ),
        butons,
      );
    <TabbedView key="w01" tabHeadingPadding="1px 1px" tabs />;
  },
};