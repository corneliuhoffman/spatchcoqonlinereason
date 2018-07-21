open Antd;

let component = ReasonReact.statelessComponent("Lists");

/* This is your familiar handleClick from ReactJS. This mandatorily takes the payload,
   then the `self` record, which contains state (none here), `handle`, `send`
   and other utilities */
let handleClick = (_event, self) => ();

let make = (~name, ~color, children) => {
  ...component,
  render: self => {
    let ss =
      if (name != "") {
        let butons = Js.String.split("\n", String.trim(name));
        Array.mapi(
          (s, x) => {
            let nr =
              if (Js.String.match(Js_re.fromString("Lemma"), x) != None) {
                "20px";
              } else {
                "15px";
              };
            let dec =
              if (Js.String.match(Js_re.fromString("Lemma"), x) != None) {
                "underline";
              } else {
                "none";
              };
            <div
              style=(
                ReactDOMRe.Style.make(
                  ~background=color,
                  ~textAlign="left",
                  ~padding="0px",
                  ~height="25px",
                  ~width="100%",
                  ~fontSize=nr,
                  ~textDecoration=dec,
                  (),
                )
              )
              key=(string_of_int(s))>
              (ReasonReact.stringToElement(x))
            </div>;
          },
          butons,
        );
      } else {
        [||];
      };
    let ar = ReasonReact.arrayToElement(ss);
    <div
      style=(
        ReactDOMRe.Style.make(
          ~background=color,
          ~overflow="auto",
          ~width="100%",
          ~height="100%",
          ~maxHeight="100%",
          ~display="block",
          ~borderStyle="solid",
          (),
        )
      )>
      ar
    </div>;
  },
};