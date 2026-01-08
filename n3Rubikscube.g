U := (1,3,8,6)(2,5,7,4)(9,48,15,12)(10,47,16,13)(11,46,17,14);
L := (1,12,33,41)(4,20,36,44)(6,27,38,46)(9,11,26,24)(10,19,25,18);
F := (6,15,35,26)(7,22,34,19)(8,30,33,11)(12,14,29,27)(13,21,28,20);
R := (3,43,35,14)(5,45,37,21)(8,48,40,29)(15,17,32,30)(16,23,31,22);
B := (1,24,40,17)(2,18,39,23)(3,9,38,32)(41,43,48,46)(42,45,47,44);
D := (24,27,30,43)(25,28,31,42)(26,29,32,41)(33,35,40,38)(34,37,39,36);
#full rotations
X := 
Y := 
Z := 
#middle layer turns
M := #between R&L -- can implement manually or R*L and rotation
E := #between U&D
S := #between F&B

G := Group(U,L,F,R,B,D);
SetDomain := [1..48];

Corners := [
    [1,9,46], [3,17,48], [6,11,12], [8,14,15],
    [26,27,33], [24,38,41], [32,40,43], [29,30,35]
];
Edges := [
    [2,47], [4,10], [5,16], [7,13], [19,20], [21,22],
    [23,45], [18,44], [25,36], [28,34], [31,37], [39,42]
];

# Test law of cubology Group Size
TheoreticalSize := 43252003274489856000;
ActualSize := Size(G);
if ActualSize = TheoreticalSize then
    Print("The group size matches the theoretical size: ", TheoreticalSize, " = ", ActualSize, "\n");
else
    Print("Discrepancy in group size! Actual: ", ActualSize, ", Theoretical: ", TheoreticalSize, "\n");
fi;

# Test each move executes as expected
Print("The solved cube is: ", SetDomain, "\n");
UCube := Permuted(SetDomain, U);
Print("Cube after applying U move: ", UCube, "\n");
LCube := Permuted(SetDomain, L);
Print("Cube after applying L move: ", LCube, "\n");
FCube := Permuted(SetDomain, F);
Print("Cube after applying F move: ", FCube, "\n");
RCube := Permuted(SetDomain, R);
Print("Cube after applying R move: ", RCube, "\n");
BCube := Permuted(SetDomain, B);
Print("Cube after applying B move: ", BCube, "\n");
DCube := Permuted(SetDomain, D);
Print("Cube after applying D move: ", DCube, "\n");

# Test commutator [R,U] sequence of turns
Commutator := R*U*R^-1*U^-1;
Print("The order of the commutator [R,U] is: ", Order(Commutator), "\n");
CommutedCube := Permuted(SetDomain, Commutator);
Print("Cube state after Commutator: ", CommutedCube, "\n");

# Test conjugate R U R^-1
Conjugate := R*U*R^-1;
Print("The order of the conjugate R U R^-1 is: ", Order(Conjugate), "\n");
ConjugatedCube := Permuted(SetDomain, Conjugate);
Print("Cube state after Conjugate: ", ConjugatedCube, "\n");

# Test conservation of piece types
FlatCorners := Set(Flat(Corners));
FlatEdges := Set(Flat(Edges));
StabCorners := Stabilizer(G, FlatCorners, OnSets);
StabEdges := Stabilizer(G, FlatEdges, OnSets);
if Size(StabCorners) = ActualSize then
    Print("Corner pieces are conserved correctly.\n");
else
    Print("Discrepancy in corner piece conservation!\n");
fi;

# Test subgroup structure (Thistlethwaite G1)
SquareGroup := Group(U^2, L^2, F^2, R^2, B^2, D^2);
if Size(SquareGroup) = 663552 then
    Print("Thistlethwaite G1 subgroup size is correct: 663552\n");
else
    Print("Discrepancy in Thistlethwaite G1 subgroup size!\n");
fi;




