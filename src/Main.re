let main=ReactDOMRe.renderToElementWithId(
  <Controller>
    /* <textarea
      style=(
        ReactDOMRe.Style.make(
          ~alignSelf="left",
          ~backgroundColor="#444444",
          ~fontSize="12px",
          ~minHeight="100%",
          ~maxHeight="100%",

          (),
        )
      )
      key="0"/>
      
   
    <div
      key="1"
      style=(
        ReactDOMRe.Style.make(
          ~alignSelf="left",
          ~background="green",
          ~fontSize="12px",
          (),
        )
      )>
      <Lists name="" />
    </div>
    {let s1 = ReasonReact.stringToElement("2");
    <div style=(
      ReactDOMRe.Style.make(~background="red",())) key="2">s1</div>}
    {let s = ReasonReact.stringToElement("2");
    <div key="3">s</div>}
    {let s = ReasonReact.stringToElement("2");
    <div key="4">s</div>} */

    

    <textarea 
    style=(
      ReactDOMRe.Style.make(
        ~alignSelf="left",
        ~backgroundColor="white",
        ~fontSize="16px",
        ~minHeight="100%",
        ~maxHeight="100%",

        (),
      )
    )
    key="0"/>
    

  </Controller>,
  "root",
);