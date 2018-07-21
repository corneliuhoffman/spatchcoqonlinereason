open BsReactstrap;

let component = ReasonReact.statelessComponent("Save");

let make = (~content, ~see, ~toggle, children) => {
  ...component,
  render: self => {
    let ssave: (string, string) => unit = [%bs.raw
      {|
        function (text, file)
        {let blob= new Blob([text], {type: "text/plain;charset=utf-8"});
        saveAs(blob, file)}|}
    ];
    <Modal isOpen=see toggle>
      <ModalHeader toggle>
        (ReasonReact.stringToElement({|Save file:|}))
      </ModalHeader>
      <ModalBody>
        <div>
          (ReasonReact.stringToElement({|File Name:|}))
          <input className="saveText" />
        </div>
      </ModalBody>
      <ModalFooter>
        <Button
          color="primary"
          onClick=(
            e => {
              let aa = ReactDOMRe._getElementsByClassName("saveText")[0];
              let fileName = ReactDOMRe.domElementToObj(aa)##value;
              ssave(content, fileName);
            }
          )>
          (ReasonReact.stringToElement("Save"))
        </Button>
      </ModalFooter>
    </Modal>;
  },
};