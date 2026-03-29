Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n5Rubikscube.g");
Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n3Rubikscube.g");

new3Cube := List([1..48], i -> 0);
old5Cube := Cube5.GetLayout();

#Corners - direct map
CornerInd3 := [1,3,6,8,9,11,12,14,15,17,24,26,27,29,30,32,33,35,38,40,41,43,46,48];
CornerInd5 := [1,5,20,24,25,29,30,34,35,39,82,86,87,91,92,96,97,101,116,120,121,125,140,144];

for i in [1..Length(CornerInd3)] do
    currVal := old5Cube[CornerInd5[i]];
    x := Position(CornerInd5, currVal);
    new3Cube[CornerInd3[i]] := CornerInd3[x];
od;

#Edges - direct map of middle edge on 5x5 to edge on 3x3
EdgeInd3 := [2,4,5,7,10,13,16,18,19,20,21,22,23,25,28,31,34,36,37,39,42,44,45,47];
EdgeInd5 := [3,11,14,22,27,32,37,55,58,59,62,63,66,84,89,94,99,107,110,118,123,131,134,142];

for i in [1..Length(EdgeInd3)] do
    currVal := old5Cube[EdgeInd5[i]];
    x := Position(EdgeInd5, currVal);
    new3Cube[EdgeInd3[i]] := EdgeInd3[x];
od;


Print(new3Cube);
