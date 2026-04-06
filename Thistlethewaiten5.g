T5 := rec();

T5.AllMoves := [
    [Cube5.U, 1, "U"], [Cube5.U^2, 2, "U2"], [Cube5.U^-1, -1, "U'"],
    [Cube5.D, 1, "D"], [Cube5.D^2, 2, "D2"], [Cube5.D^-1, -1, "D'"],
    [Cube5.L, 1, "L"], [Cube5.L^2, 2, "L2"], [Cube5.L^-1, -1, "L'"],
    [Cube5.R, 1, "R"], [Cube5.R^2, 2, "R2"], [Cube5.R^-1, -1, "R'"],
    [Cube5.F, 1, "F"], [Cube5.F^2, 2, "F2"], [Cube5.F^-1, -1, "F'"],
    [Cube5.B, 1, "B"], [Cube5.B^2, 2, "B2"], [Cube5.B^-1, -1, "B'"],

    [Cube5.u, 1, "u"], [Cube5.u^2, 2, "u2"], [Cube5.u^-1, -1, "u'"],
    [Cube5.d, 1, "d"], [Cube5.d^2, 2, "d2"], [Cube5.d^-1, -1, "d'"],
    [Cube5.l, 1, "l"], [Cube5.l^2, 2, "l2"], [Cube5.l^-1, -1, "l'"],
    [Cube5.r, 1, "r"], [Cube5.r^2, 2, "r2"], [Cube5.r^-1, -1, "r'"],
    [Cube5.f, 1, "f"], [Cube5.f^2, 2, "f2"], [Cube5.f^-1, -1, "f'"],
    [Cube5.b, 1, "b"], [Cube5.b^2, 2, "b2"], [Cube5.b^-1, -1, "b'"],

    [Cube5.Uu, 1, "Uu"], [Cube5.Uu^2, 2, "Uu2"], [Cube5.Uu^-1, -1, "Uu'"],
    [Cube5.Dd, 1, "Dd"], [Cube5.Dd^2, 2, "Dd2"], [Cube5.Dd^-1, -1, "Dd'"],
    [Cube5.Ll, 1, "Ll"], [Cube5.Ll^2, 2, "Ll2"], [Cube5.Ll^-1, -1, "Ll'"],
    [Cube5.Rr, 1, "Rr"], [Cube5.Rr^2, 2, "Rr2"], [Cube5.Rr^-1, -1, "Rr'"],
    [Cube5.Ff, 1, "Ff"], [Cube5.Ff^2, 2, "Ff2"], [Cube5.Ff^-1, -1, "Ff'"],
    [Cube5.Bb, 1, "Bb"], [Cube5.Bb^2, 2, "Bb2"], [Cube5.Bb^-1, -1, "Bb'"]
];

T5.G0_Inds := [1..54];
T5.G1_Inds := [2,5,7,8,9,10,11,12,13,14,15,16,17,18,20,23,25,26,27,28,29,30,31,32,33,34,35,36,38,41,43,44,45,46,47,48,49,50,51,52,53,54];
T5.G2_Inds := [2,5,7,8,9,10,11,12,14,17,20,23,25,26,27,28,29,30,32,35,38,41,43,44,45,46,47,48,50,53];
T5.G3_Inds := [2,5,8,11,14,17,20,23,26,29,32,35,38,41,44,47,50,53];

T5.Subgroups := [
    Group(List(T5.G1_Inds, i -> T5.AllMoves[i][1])),
    Group(List(T5.G2_Inds, i -> T5.AllMoves[i][1])),
    Group(List(T5.G3_Inds, i -> T5.AllMoves[i][1])),
    Group(()) 
];


#solver
T5.SolveStage := function(tarG, allowedInds, cube)
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
            move := T5.AllMoves[i];
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
T5.Solve := function(cube)
    local path, stageMoves, i;
    path := [];
    
    for i in [1..4] do
        stageMoves := T5.SolveStage(T5.Subgroups[i], [T5.G0_Inds, T5.G1_Inds, T5.G2_Inds, T5.G3_Inds][i], cube);
        Append(path, stageMoves.moves);
        cube := stageMoves.cube;
        Print("G", i-1, " -> G", i, " Moves: ", stageMoves.moves, "\n");
    od;
    
    return path;
end;
