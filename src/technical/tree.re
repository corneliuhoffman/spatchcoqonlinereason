/*this breaks a list via another*/
let rec bl = (v, w)=>{
	let s = switch (w) /* recall tha match is switch in reasom */
	{ 
		|[]=>[v]
		|[h,...tl]=> 
		{
			switch (v)
			{
				|[]=>[]
				| [x,...t]=>{if(x==h){[[],...bl(v,tl)];}else{
					
					let r= bl(t,w);
					
					if (r==[]){[[x]]}else{[[x,...List.hd(r)],...List.tl(r)];};};};  /* recall that the form for list constructor is [h,...tl] */
				};
	};
	};
s;};

let rec breakval = (li:list(string), str:string)=>{
	let s = switch (li) /* recall tha match is switch in reasom */
	{
		|[]=>[]
		| [x,...t] =>
		{if(String.trim(x)==String.trim(str)){[[],...breakval(t,str)];}
		else{
			let r= breakval(t,str);
			if (r==[]){[[x]]}
			else
			{[[x,...List.hd(r)],...List.tl(r)];};};};  /* recall that the form for list constructor is [h,...tl] */
				};
	s};
	



/* this translates array to lists and so on  this is an issue since bucklescript makes lists into this weird looing arrays */
let breaklist =(arr,pats)=>{
	let list=Array.to_list(arr);
	let lpats=Array.to_list(pats);
	Array.of_list(List.map ((a)=>Array.of_list(a),bl(list,lpats)));
};
let stclean = (x)=> {
	let re=Js_re.fromStringWithFlags( "\n","g"); /* nonstandard way to introduce a regexp*/
	String.trim(x)|>(Js.String.replaceByRe(re, "<br>")); /* cannot use Str and so replace it by Js.String resp Js.Re*/
};

let union =(l, f)=>List.fold_left((a,b)=>
a@List.filter((x)=>(!(List.mem(f(x),List.map(f,a)))),b),[],l);/*takes a list and a function on elements and taes the union (two things are equal if the function has the same value)*/

let position= (listofids) => {/*takes a list of strings, breaks it into pieces via double return and prosuces a list of goals each with its own parent*/
	let levelGoals=List.map((x)=>List.map((x)=>{"parent":"", "txt":stclean(x), "leavingtactic":""},Array.to_list(Js.String.split("\n\n", x))), listofids);/*spltting the ids */
	let allgoals=union(levelGoals, (x)=>x##txt );
	let pretree = List.fold_left(
		((newhead,updatedgoals),newgoals)
			=>
			{(
					List.hd(newgoals)##txt,
					List.map((x)=>{
						/* =>{vv##txt},newgoals)); */
						{
						"parent":if(List.mem(x##txt,List.map((vv)=>{vv##txt}, newgoals)) && (x##parent=="")){newhead;}else{x##parent;},
						"txt":x##txt, 
						"leavingtactic":"" };}, updatedgoals)
				)
			} ,("-1",allgoals),levelGoals
	);
	pretree;
};	 
let rec modtreemap= (t,l)=>{ /*takkes a tree ans a list and produces a tree by appending stuff from the list */
	if (Array.length(t##children) >0){
		let chi=Array.map ((x)=>modtreemap(x,l),t##children );
		{"innerHTML":stclean(t##innerHTML),"leavingtactic":t##leavingtactic, "children":chi};}
	else{
		let s= List.filter((x)=>x##parent==t##innerHTML, l);

		if (List.length(s)==0){
		 {"innerHTML":stclean(t##innerHTML),"leavingtactic":t##leavingtactic, "children":[||]};}

		else{
			let li=List.map((x)=>{{"innerHTML":stclean(x##txt),"leavingtactic":x##leavingtactic, "children":[||]}}, s);
			let newt={"innerHTML":stclean(t##innerHTML),"leavingtactic":t##leavingtactic, "children":Array.of_list(li)};
			modtreemap(newt,l)};	
		}
}; 
let makejsontree=(listofids)=>{/* makes a tree from the list of goals */
   let l=snd(position(listofids));
	let head=List.hd(List.filter((x)=>x##parent=="-1", l));
	let tree={"innerHTML":stclean(head##txt), "leavingtactic":head##leavingtactic, "children":[||]};	
	let t= 	modtreemap(tree,l);
	t;
};

let decode=(str)=>{
	let li= Js.String.split("<br>", str);
	let modar= Array.map(x=>Index.myprint(x),li);
	let modli=Array.to_list(modar);
	String.concat("<br>", modli)

};

let rec cleantree=(t)=>{
	let txt=(t##innerHTML);
	let t1=
		{"innerHTML":decode(txt), "leavingtactic":"", "children":Array.map(cleantree, t##children)};
		t1

	};

let rec makelongertree=(t)=>{/* makes a longer tree with tactics as intermediate nodes*/
	if (t##leavingtactic!=""){ t;}
	else{
		let t1={"innerHTML":"<p style='background-color:#ccffff;'>"++t##leavingtactic++"</p>", "leavingtactic":"", "children":Array.map(makelongertree, t##children)};
		 {"innerHTML":t##innerHTML, "leavingtactic":"", "children":[|t1|]};
	}
};

