Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n4Rubikscube.g");
Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n3Rubikscube.g");

Col4 := rec();

Col4.new3Cube := List([1..48], i -> 0);
#Col4.old4Cube := Cube4.GetLayout();
Col4.CornerInd3 := [1,3,6,8,9,11,12,14,15,17,24,26,27,29,30,32,33,35,38,40,41,43,46,48];
Col4.CornerInd4 := [1,4,13,16,17,20,21,24,25,28,53,56,57,60,61,64,65,68,77,80,81,84,93,96];
Col4.EdgeInd3 := [2,4,5,7,10,13,16,18,19,20,21,22,23,25,28,31,34,36,37,39,42,44,45,47];
Col4.EdgePairs4 := [[2,3],[5,9],[8,12],[14,15],[18,19],[22,23],[26,27],[29,41],[32,44],[33,45],[36,48],[37,49],[40,52],[54,55],[58,59],[62,63],[66,67],[69,73],[72,76],[78,79],[82,83],[85,89],[88,92],[94,95]];


Col4.Collapse4 := function()
    local old4Cube, currVal, x, pair, currX, currY, i, j, newPos, newVal;
    old4Cube := Cube4.GetLayout();
    #Corners - direct map
    for i in [1..Length(Col4.CornerInd3)] do
        currVal := old4Cube[Col4.CornerInd4[i]];
        x := Position(Col4.CornerInd4, currVal);
        Col4.new3Cube[Col4.CornerInd3[i]] := Col4.CornerInd3[x];
    od;

    #Edges - direct map if 4x4 edges are a pair else indirect map with 1 of edge pair
    for j in [1..Length(Col4.EdgeInd3)] do
        pair := Col4.EdgePairs4[j];
        currX := old4Cube[pair[1]];
        currY := old4Cube[pair[2]];
        for x in Col4.EdgePairs4 do
            if (currX = x[1] and currY = x[2]) or (currX = x[2] and currY = x[1]) then
                newPos := Col4.EdgeInd3[j];
                newVal := Col4.EdgeInd3[Position(Col4.EdgePairs4, x)];
                Col4.new3Cube[newPos] := newVal;
            elif currX = x[1] or currX = x[2] then
                newPos := Col4.EdgeInd3[j];
                newVal := Col4.EdgeInd3[Position(Col4.EdgePairs4, x)];
                Col4.new3Cube[newPos] := newVal;
            fi;
        od;
    od;
end;

Col4.LayoutToPerm := function(layout)
    local perm, i;
    perm := List([1..Length(layout)], i -> 0);
    for i in [1..Length(layout)] do
        perm[layout[i]] := i;
    od;
    #Print(Col4.new3Cube, "\n");
    if PermList(perm) = fail then
        Print("Not a valid cube layout");
    else
        Print("Yes, valid cube layout");
    fi;
    return PermList(perm);
end;
