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



\!\(\*
  RowBox[{
    StyleBox[\(Off[General::spell1]\),
      FontSize->9], "\n", 
    RowBox[{
    \(NumOK = 15\), ";", "\n", \(NumOB = 10\), ";", "\n", 
      \(Print[Binomial[NumOK, NumOB], \ 
        "\< m\[ODoubleDot]gliche Bibliotheken\>"]\), ";", "\n", 
      RowBox[{"Print", "[", 
        RowBox[{"\"\<(\!\(\*GridBox[{
{\(1000\)},
{\(623\)}
}]\)) = \>\"", ",", " ", \(Binomial[1000, 623]\), ",", \("\< > 10 hoch\>"\), 
          ",", \(IntegerPart[Log[10, Binomial[1246, 623]]]\), ",", " ", 
          \("\< m\[ODoubleDot]gliche Bibliotheken\>"\)}], "]"}], ";", "\n", 
      \(\(N\_+\) = 50\), ";", "\n", \(\(N\_-\) = 35\), ";", "\n", 
      \(O\_K = Table[i, {i, NumOK}]\), " ", ";", "\n", 
      \(\(Q\_+\) = Table[i + Last[O\_K], {i, \(N\_+\)}]\), " ", ";", "\n", 
      \(\(Q\_-\) = Table[i + Last[\(Q\_+\)], {i, \(N\_-\)}]\), " ", ";", "\n",
       \(SeedRandom[8]\), ";", "\n", 
      StyleBox[\(On[General::spell1]\),
        FontSize->9]}]}]\)





SetDirectory["F:\\gensensorik\\Mathematica\\OligoBib"]



<<OligoFunc01.m

<<GAFunc01.m

ListDensityPlot[match, Mesh -> False,AspectRatio\[Rule]2];



Pop0=Table[Random[Integer],{NPop},{NBib}];
Pop1=Table[Random[Integer],{10},{NBib}];
Pop2=Table[Random[Integer],{20},{NBib}];
Pop3=Table[Random[Integer],{30},{NBib}];
Pop4=Table[Random[Integer],{50},{NBib}];









































