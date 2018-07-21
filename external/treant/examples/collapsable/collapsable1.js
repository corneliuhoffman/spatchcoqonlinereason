
    var chart_config = {
        chart: {
            container: "#collapsable-example",

            animateOnInit: true,
            
            node: {
                collapsable: true
            },
            animation: {
                nodeAnimation: "easeOutBounce",
                nodeSpeed: 700,
                connectorsAnimation: "bounce",
                connectorsSpeed: 700
            }
        },
         nodeStructure:

{innerHTML:"none<br>============================<br>∀ P Q : Prop, P ∨ Q → Q ∨ P",children:[{innerHTML:"P : Prop<br>============================<br>∀ Q : Prop, P ∨ Q → Q ∨ P",children:[{innerHTML:"P, Q : Prop<br>============================<br>P ∨ Q → Q ∨ P",children:[{innerHTML:"Hyp : P ∨ Q<br>  P, Q : Prop<br>============================<br>Q ∨ P",children:[{innerHTML:"Hyp0 : P<br>  P, Q : Prop<br>============================<br>Q ∨ P",children:[{innerHTML:"Hyp0 : P<br>  P, Q : Prop<br>============================<br>P",children:[{innerHTML:"Hyp1 : Q<br>  P, Q : Prop<br>============================<br>Q ∨ P",children:[{innerHTML:"Hyp1 : Q<br>  P, Q : Prop<br>============================<br>Q",children:[{innerHTML:"",children:[]}]}]}]}]},{innerHTML:"Hyp1 : Q<br>  P, Q : Prop<br>============================<br>Q ∨ P",children:[{innerHTML:"Hyp1 : Q<br>  P, Q : Prop<br>============================<br>Q",children:[{innerHTML:"",children:[]}]}]}]}]}]}]}//                     ]
//                 },
//                 {
//                     image: "img/sterling.png",
//                     childrenDropLevel: 1,
//                     children: [
//                         {
// text: { name: "First child" },                        }
//                     ]
//                 },
//                 {
//                     pseudo: true,
//                     children: [
                        
//                         {
//                             image: "img/pam.png"
//                         }
//                     ]
//                 }
//             ]
//         }
    };

/* Array approach
    var config = {
        container: "#collapsable-example",

        animateOnInit: true,
        
        node: {
            collapsable: true
        },
        animation: {
            nodeAnimation: "easeOutBounce",
            nodeSpeed: 700,
            connectorsAnimation: "bounce",
            connectorsSpeed: 700
        }
    },
    malory = {
        image: "img/malory.png"
    },

    lana = {
        parent: malory,
        image: "img/lana.png"
    }

    figgs = {
        parent: lana,
        image: "img/figgs.png"
    }

    sterling = {
        parent: malory,
        childrenDropLevel: 1,
        image: "img/sterling.png"
    },

    woodhouse = {
        parent: sterling,
        image: "img/woodhouse.png"
    },

    pseudo = {
        parent: malory,
        pseudo: true
    },

    cheryl = {
        parent: pseudo,
        image: "img/cheryl.png"
    },

    pam = {
        parent: pseudo,
        image: "img/pam.png"
    },

    chart_config = [config, malory, lana, figgs, sterling, woodhouse, pseudo, pam, cheryl];

*/