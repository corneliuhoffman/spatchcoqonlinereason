/* open BsReactstrap; */
let component = ReasonReact.statelessComponent("HypLists");

/* This is your familiar handleClick from ReactJS. This mandatorily takes the payload,
   then the `self` record, which contains state (none here), `handle`, `send`
   and other utilities */
let handleClick = (_event, self) => ();

let make = (~name, children) => {
  ...component,
  render: self => {
    let goalsplit = Js.String.split("\n============================\n", name);
    if (Array.length(goalsplit) == 2) {
      let hyps = Js.String.split("\n", goalsplit[0]);
      let conc = goalsplit[1];
      let hypButtons =
        Array.mapi(
          (s, x) =>
            <GoalPicker
              key=(string_of_int(s))
              color="lightgreen"
              goal=false
              name=x
            />,
          hyps,
        );
      let concButton = [|
        <GoalPicker
          name=conc
          color="pink"
          goal=true
          key=(string_of_int(Array.length(hyps)))
        />,
      |];
      let goal = Array.append(hypButtons, concButton);
      let ar = ReasonReact.arrayToElement(goal);
      <div style=(ReactDOMRe.Style.make(~width="100%", ()))> ar </div>;
    } else {
      ReasonReact.nullElement;
    };
  },
};