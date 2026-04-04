T3.AllMoves := [
    [Cube3.U, 1, "U"], [Cube3.U^2, 2, "U2"], [Cube3.U^-1, -1, "U'"],
    [Cube3.D, 1, "D"], [Cube3.D^2, 2, "D2"], [Cube3.D^-1, -1, "D'"],
    [Cube3.L, 1, "L"], [Cube3.L^2, 2, "L2"], [Cube3.L^-1, -1, "L'"],
    [Cube3.R, 1, "R"], [Cube3.R^2, 2, "R2"], [Cube3.R^-1, -1, "R'"],
    [Cube3.F, 1, "F"], [Cube3.F^2, 2, "F2"], [Cube3.F^-1, -1, "F'"],
    [Cube3.B, 1, "B"], [Cube3.B^2, 2, "B2"], [Cube3.B^-1, -1, "B'"]
];


T3.G0_Inds := [1..18]; 
T3.G1_Inds := [2,5,7,8,9,10,11,12,13,14,15,16,17];
T3.G2_Inds := [2,5,7,8,9,10,11,12,14,17];
T3.G3_Inds := [2,5,8,11,14,17];

T3.Subgroups := [
    Group(List(T3.G1_Inds, i -> T3.AllMoves[i][1])),
    Group(List(T3.G2_Inds, i -> T3.AllMoves[i][1])),
    Group(List(T3.G3_Inds, i -> T3.AllMoves[i][1])),
    Group(()) 
];

#solver
T3.SolveStage := function(tarG, allowedInds, cube)
    local queue, visited, x, i, nextPerm, rep, move;

    queue := [[cube, []]];
    visited := rec();

    rep := CanonicalRightCosetElement(tarG, cube);
    visited.(String(rep)) := true;

    while Size(queue) > 0 do
        x := Remove(queue, 1);
        if x[1] in tarG then
            cube := x[1]; 
            return rec(moves := x[2], cube := x[1]);
        fi;

        for i in allowedInds do
            move := T3.AllMoves[i];
            nextPerm := x[1] * move[1];
            rep := CanonicalRightCosetElement(tarG, nextPerm);
            
            if not IsBound(visited.(String(rep))) then
                visited.(String(rep)) := true;
                Add(queue, [nextPerm, Concatenation(x[2], [move[3]])]);
            fi;
        od;
    od;
end;

#controller
T3.Solve := function(cube)
    local path, stageMoves, i;
    path := [];
    
    for i in [1..4] do
        stageMoves := T3.SolveStage(T3.Subgroups[i], [T3.G0_Inds, T3.G1_Inds, T3.G2_Inds, T3.G3_Inds][i], cube);
        Append(path, stageMoves.moves);
        cube := stageMoves.cube;
        Print("G", i-1, " -> G", i, " Moves: ", stageMoves.moves, "\n");
    od;
    
    return path;
end;
