(***********************************************************************
This file was generated automatically by the Mathematica front end.
It contains Initialization cells from a Notebook file, which typically
will have the same name as this file except ending in ".nb" instead of
".m".

This file is intended to be loaded into the Mathematica kernel using
the package loading commands Get or Needs.  Doing so is equivalent to
using the Evaluate Initialiation Cells menu command in the front end.

DO NOT EDIT THIS FILE.  This entire file is regenerated automatically 
each time the parent Notebook file is saved in the Mathematica front end.
Any changes you make to this file will be overwritten.
***********************************************************************)



(* Initialisierungsparameter *)

NBib=NumOB;
Individuum=Flatten[Table[{_Integer},{NBib}]];(* ein Typ "Array of Integer"  *)
  
NPop=10;(* 50*)
NumGen = 1000;
$IterationLimit=4096*2*2*2
$RecursionLimit=256*2*2*2*2*2
MutatProb = 0.1









Clear[value];
value[c:Individuum]:=Score3[c];
value[c:Flatten[Table[{_},{NBib}]]]:=Print["value: no List of Integers!"];
value[c:_]:=Print["value: wrong argument type!"];

(*
	- nGmn: langsamere aber platzsparende Alternative zu NG
	- Auch sinnvoll, wenn Fitness keine ganzen Zahlen enth\[ADoubleDot]lt
	- kann durch rekursiver Suche auf der sortierten Liste distributionFkt
	  beschleunigt werden
	*)

nGmn[pop_]:=Module[{pos,tmp},
		distributionFkt=Table[Plus@@Take[Fitness[pop],n],{n,0,Length[pop]}];
		Table[
				tmp=Random[Integer,{1,Last[distributionFkt]}];
				For[pos=Length[pop],(* pos\[GreaterEqual]1\[And] *)
													
        distributionFkt\[LeftDoubleBracket]pos
            \[RightDoubleBracket]\[GreaterEqual]tmp,
													pos--,
					];
				pop\[LeftDoubleBracket]pos\[RightDoubleBracket],{Length[pop]}]
		];





Fitness[pop_]:=Map[value,pop];

(* CROSSOVER - 
    Die Listen l1 und l2 werden an einer zuf\[ADoubleDot]lligen Stelle
			\[UDoubleDot]berkreuzt.
	*)
Crossover[l1_,l2_]:=Crossover1[l1,l2,Random[Integer,{1,Length[l1]}]]
Crossover1[l1_,l2_,p_]:=
  List[Flatten[Append[Take[l1,p],Take[l2,p-Length[l1]]]],
		Flatten[Append[Take[l2,p],Take[l1,p-Length[l2]]]]]

(* CROSSALL - 
    Jeweils zwei benachbarte Elemente der Liste l werden mit der Funktion 
      crossover bearbeitet. 
			Bedingung: Anzahl der Elemente der Liste l gerade
	*)
Crossall[l_]:=
  If[l=={},{},
    Join[Crossover[Flatten[Take[l,1]],Flatten[Take[l,{2,2}]]],
      Crossall[Drop[l,2]]]]
		

(* Mutation *)
MutatePop[pop_]:=Map[Mutate,pop]
Mutate[ind_]:=
  If[Random[Real]> MutatProb,
    ReplacePart[ind,Random[Integer],Random[Integer,{1,Length[ind]}]],ind]


SurvivalChance[pop_]:=Map[(# /Plus@@pop)&,Fitness[pop]];
(* n Kopien der Liste list *)
(* Zusammenstellung eines Genpools entsprechend der
			survivalchances s einer Population pop.			*)
GenPool[s_,p_]:=Flatten[GenPool1[s,p],1]
GenPool1[{},pop_]:={}
GenPool1[survivalchances_,pop_]:=
  Join[List[GenPool[Rest[survivalchances],Rest[pop]]],
    List[Dublicate[First[pop],First[survivalchances]]]]

ngfind[pop_,npop_,ngenmax_,mut_]:=Module[{tmpPop},
		tmpPop=pop;
		For[ngen=1,ngen<ngenmax,ngen++,
				tmpPop=If[mut==True,
					ngfind1[MutatePop[Crossall[nGmn[tmpPop]],npop,ngen+1,ngenmax,mut]],
					ngfind1[Crossall[nGmn[tmpPop]],npop,ngen+1,ngenmax,mut]
				];
				If[Mod[ngen ,100]==0,
					PrettyPrint[ngen];
					Print["Hier besten aktuellen Score ausgeben!"];
				];
		];
		Print[StringForm[
        "Termination after `` generations (maximum). NPop=``. mutations=``.",
        ngenmax,npop,mut]];
];






