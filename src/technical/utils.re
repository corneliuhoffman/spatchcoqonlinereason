[@bs.val] external setText : string => unit =
  "editor2.setValue";



let getText= ()=>{
 let s= [%bs.raw {|editor2.getValue()|}];
s
};

let  readJson = (string)=>{let json = Js.Json.parseExn(string);
  
  switch (Js.Json.classify(json)) {
  | Js.Json.JSONString(a)=> Js.log("string"++a)
  | Js.Json.JSONObject(a)=>Js.log(Js_dict.get(a, "input"))
  | Js.Json.JSONArray(a) =>Js.log(a)
  
  };};