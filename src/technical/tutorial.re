type inputTut = {
    w10: string,
    w11: string,
  };
  type leaveTut =
    | Run
    | Write
    | Undo;
  
  type tut = {
    input: inputTut,
    output: leaveTut,
  };
  
  
  
  
  
  type occupied =
    | Free
    | Busy
    | Tutorial(array(tut), int);



let jsonToinputTut = json=>{
    let w0= Js_dict.get(json, "w10");
    let w1= Js_dict.get(json, "w11");
    switch ((w0,w1)) {
    | (Some(a), Some(b)) => Some({
        w10:a,
        w11: b,
      })
    |_=> None
    };};

   let jsonToleaveTut = str=>
   switch str{
      | "Run"=>Run
      | "Write"=>Write
      | "Undo"=>Undo
   };

/* let strToTuts = str=>
{let json = Js.Json.parseExn(str);
  let array = 
        switch (Js.Json.classify(json)) {
        | Js.Json.JSONArray(a) =>Some(
        Array.map( x=>{
            let inp= Js_dict.get(x, "input");
    let outp= Js_dict.get(json, "outp");
    switch ((inp, outp)) {
    | (Some(a), Some(b)) => switch (jsonToinputTut(a)) {
    | Some (z) => 
    {input:z,
    output:jsonToleaveTut(b) }
    | None=>None
    };
    |_=> None
    }
        },
            a
        ))
        |_ =>None};
    
    
        
        
} ; */
    let  example=
   [| [|{
        input: {
          w10: "",
          w11: "Let us start.\n 
          Click the blue stepForward button.",
        },
        output: Write,
      },
      {
        input: {
          w10: "Lemma a(P:Prop):P->P.",
          w11: "Here is your first lemma.\n
           Note The structure. The general form is: \n 
            Lemma NAME (a:type)...(z:Type): text_of the lemma.\n
            Note the full stop  at the end. All sentences should end with a fullstop.\n
           We should now press run. In the tutorial you do not have access to run and undo so press the blue forward button.",

        },
        output: Run,
      },
      {
        input: {
          w10: "",
          w11: "Note that the text has moved up and that you have now a new goal.\n 
          The green statements are the hypotheses and the pink one the conclusion.\n
          You can click on the hyps and conclusion to get hints.\n 
          Try this for a while to get used with it.\n
          You can also choose tactics from the menu or type CTRL-Space to autocomplete.",
        },
        output: Write,
      },
      {
        input: {
          w10: "Assume  P then prove  P. ",
          w11: "We now choose the first hint and press run.",
        },
        output: Run,
      },
      {
        input: {
          w10: "",
          w11: "Note the change in the goal. The new conclusion is identical to one of the hypotheses.\n ",
        },
        output: Write,
      },
      {
        input: {
          w10: "This follows from assumptions.",
          w11: "We now finish the proof. ",
        },
        output: Run,
      },
      {
        input: {
          w10: "",
          w11: "There are no more goals",
        },
        output: Write,
      }
      |], [|{
        input: {
          w10: "Lemma a: forall P Q:Prop, P\/Q->Q\/P.",
          w11: "This is a lightly more invloved proof and we will see some new tactics.\n Note the structure of the lemma, there are no variables involved, they all appear in the body of the lemma.\n
          A similar (but shorter) form of the lemma would be:\n Lemma a(P Q:Prop):P\\/Q->Q\\/P.\n You can try it yourself. \n Note also the notation \\/ for OR.\n You could also type \\lor for a better looking OR.\n Press next now.",
        },
        output: Run,
      },
      {
        input: {
          w10: "",
          w11: "Note the formating change in the goals.\n Press the pink button to see what tactics you can choose",

        },
        output: Write,
      },
      {
        input: {
          w10: "Fix an arbitrary element L.",
          w11: "Indeed, you need to fix a variable in a \"forall\" claim.\n Note that, as usual, the name of the variable you fix is irrelevant so we will call it L instead of P.",
        },
        output: Run,
      },
      {
        input: {
          w10: "Fix an arbitrary element Q.",
          w11: "Note the substitutions of L for P.\n We use the same tactic for Q as well.",
        },
        output: Run,
      },
      {
        input: {
          w10: "Assume (L \\/ Q) then prove (Q \\/ L).",
          w11: "Note that your claim is now an implication.
          As in the first tutorial, we will assume the left hand side of the implication and prove its right hand side.",
        },
        output: Run,
      },
      {
        input: {
          w10: "",
          w11: "Note that the statement (L \\/ Q) became a hypothesis and (Q \\/ L) is the new conclusion. Click on the green button with Hyp: L \\/ Q,  choose the first suggestion and then click next.",
        },
        output: Write,
      },
      {
        input: {
          w10: "Consider cases based on disjunction in hypothesis  Hyp .",
          w11: "This will indeed be a case by case analysis. Click next to see what happens.",
        },
        output: Run,
      },
      {
        input: {
          w10: "",
          w11: "There are now two different goals: The first one has a hypothesis H:P\n the second one  has the hypothesis H:Q.\n Note that at this point you can only attack the first goal so click on the fist tab.",
        },
        output: Write,
      },
      {
        input: {
          w10: "Prove L in the disjunction.",
          w11: "We choose to prove L in the disjunction.",
        },
        output: Run,
      },
      {
        input: {
          w10: "This follows from assumptions.",
          w11: "This is immediate.",
        },
        output: Run,
      },
      {
        input: {
          w10: "Prove left hand side.",
          w11: "Note that we are left with the second goal, the case when Q is true.\n We choose a slightly different tactic.",
        },
        output: Run,
      },
      {
        input: {
          w10: "This follows from assumptions.",
          w11: "Once again we are left with a trivial task.\n Another proof by assumptions finishes the lemma.",
        },
        output: Run,
      },
      {
        input: {
          w10: "",
          w11: "Once again we are done. Pick the tree view from the Actions menu tab to see the proof tree. ",
        },
        output: Run,
      }
      |],[|{
      input: {
        w10: "",
        w11: "This is a puzzle due to Lewis Carroll. The story is as follows:\n
        (a)  All babies are illogical.\n
(b)  Nobody is despised who can manage a crocodile.\n
(c)  Illogical persons are dispised.\n
We shall deduce that babies cannot manage crocodiles.\n
        This puzzle will introduce notations and Axioms.\n
        Click Next",
      },
      output:Write,
    },
    {
      input: {
        w10: {|
Variable Beings:Set.
Variables Babies Illogical ManageCroc Despised: Beings->Prop.
        |},
        w11: "
        
First  we introduce some variables.\n Note the format:
Variable NAME:type.\n
or
Variables NAME1 NAME2 ... :type.\n
The variable Beings is just a \"Set\". That is a special type which, for the moment can be viewed as a set.\n
 The others are \"predicates\" that is function from the Beings to propositions.\n For example \"Illogical x\" would mean that x is illogical.

",
      },
      output:Run,
    },{
      input: {
        w10: {|
Notation "x 'is' 'a' 'Baby' ":=(Babies x) (at level 10).
Notation "x 'is' 'illogical' ":=(Illogical x) (at level 10).
Notation "x 'is' 'despised' ":=(Despised x) (at level 10).
Notation "x 'can' 'manage' 'crocodiles'":=(ManageCroc x) (at level 10).
        |},
        w11: "In order to write more naturally sounding statements, we use notations.\n
        Note the format of notations. It is:\n
        Notation \" notation\":= FORMULA (at level x).\n

        In the notation, words are separately entered as \'word\' and variables are entered as they look. The level part is a bit more complicated. Keep the level at 10 for now.
",
      },
      output:Run,
    } ,{
      input: {
        w10: {|
Axiom BI: forall x, x is a Baby -> x is illogical.
Axiom MND : forall x, x can manage crocodiles -> not (x is despised).
Axiom ID: forall x, x is illogical  -> x is despised.
        |},
        w11: "(BI)  All babies are illogical.\n
        (MND)  Nobody is despised who can manage a crocodile.\n
        (ID)  Illogical persons are despised.\n

Now we introduce the axioms. Note that they look identical with the lemmas but they produce no output. 
",
      },
      output:Run,
    },
    {
      input: {
        w10: {|
Lemma LcBabies: forall x,  Babies x-> not (x can manage crocodiles).

        |},
        w11: "Finally here is the lemma we want to prove:
",
      },
      output:Run,
    },
    {
      input: {
        w10: {|

        |},
        w11: "Note that even though we intentionally wrote Babies x in the lemma, the notations we introduced ensure that resulting goal is correctly formated as (x is a Baby).
",
      },
      output:Write,
    },
    
    {
      input: {
        w10: {| Fix an arbitrary element B.|},
        w11: "We now fix an arbitrary element B and try to prove that is B is a baby then B cannot manage crocodiles.",
      },
      output:Run,
    },
    {
      input: {
        w10: {| Assume (B is a Baby) then prove (not (B can manage crocodiles)).|},
        w11: "As in the previous tutorials, we will assume B is a baby and prove that it cannot manage crocodiles.",
      },
      output:Run,
    },
    {input: {
      w10: {| Rewrite goal using the definition of not.|},
      w11: "This is a new tactic, what do you think it menans?",
    },
    output:Run,
  },
 { input: {
    w10: {||},
    w11: "Note the new goal! The expression  (¬ P) is a shortcut for P->False.",
  },
  output:Write,
},{input: {
  w10: {| Assume (B can manage crocodiles) then prove False.|},
  w11: "This is again an implication so we use the same tactic.",
},
output:Run,
},
{input: {
  w10: {| Claim (B is illogical).|},
  w11: "This is a forward tactic. We shall first prove the intermediate goals B is illogical. (Hint: Look at the axiom BI)",
},
output:Run,
},
{input: {
  w10: {| 
Apply result BI.|},
  w11: "As mentioned, the result BI will be used.\n More precisely, due to BI  in order to prove that B is illogical it is enough to prove that B is a baby.\n Click next",
},
output:Run,
},{input: {
  w10: {| This follows from assumptions.|},
  w11: "So we now need to prove that B is a baby. This is one of the assumptions.",
},
output:Run,
},
{input: {
  w10: {| Obtain (B is despised) applying (ID B) to H.
    |},
  w11: "This is a shortcut similar with the last two steps.\nWe are executing a forward tactic but we solve the claim directly by applying (ID B) to H.\n Note the two points:\n a) you need to specify (ID B), in the previous tactic B was inffered from the goal \n b) you apply (ID B) to h as if it was a function.",
},
output:Run,
},
{input: {
  w10: {| Obtain (not (B is despised)) applying (MND B) to Hyp0.
    |},
  w11: "This is similar to the above",
},
output:Run,
},{input: {
  w10: {|
    Apply result H1 .
    This follows from assumptions.
    |},
  w11: "Note that we now have both B is despised and not(B is despised). We have two choices. We either directly use tactic \"Apply result (H1 H0).\" or we can do it in three steps as on the left. ",
},
output:Run,
},
{input: {
  w10: {|
    
    |},
  w11: "We are now done ",
},
output:Run,
},|] |]