Col5 := rec();

Col5.new3Cube := List([1..48], i -> 0);
#Col5.old5Cube := Cube5.GetLayout();
Col5.CornerInd3 := [1,3,6,8,9,11,12,14,15,17,24,26,27,29,30,32,33,35,38,40,41,43,46,48];
Col5.CornerInd5 := [1,5,20,24,25,29,30,34,35,39,82,86,87,91,92,96,97,101,116,120,121,125,140,144];
Col5.EdgeInd3 := [2,4,5,7,10,13,16,18,19,20,21,22,23,25,28,31,34,36,37,39,42,44,45,47];
Col5.EdgeInd5 := [3,11,14,22,27,32,37,55,58,59,62,63,66,84,89,94,99,107,110,118,123,131,134,142];


Col5.Collapse5 := function()
    local old5Cube, currVal, x, i, j;
    old5Cube := Cube5.GetLayout();
    #Corners - direct map
    for i in [1..Length(Col5.CornerInd3)] do
        currVal := old5Cube[Col5.CornerInd5[i]];
        x := Position(Col5.CornerInd5, currVal);
        Col5.new3Cube[Col5.CornerInd3[i]] := Col5.CornerInd3[x];
    od;

    #Edges - direct map of middle edge on 5x5 to edge on 3x3
    for j in [1..Length(Col5.EdgeInd3)] do
        currVal := old5Cube[Col5.EdgeInd5[j]];
        x := Position(Col5.EdgeInd5, currVal);
        Col5.new3Cube[Col5.EdgeInd3[j]] := Col5.EdgeInd3[x];
    od;
end;

Col5.LayoutToPerm := function(layout)
    local perm, i;
    perm := List([1..Length(layout)], i -> 0);
    for i in [1..Length(layout)] do
        perm[layout[i]] := i;
    od;
    #Print(Col5.new3Cube);
    if PermList(perm) = fail then
        Print("Not a valid cube layout");
    else
        Print("Yes, valid cube layout");
    fi;
    return PermList(perm);
end;
