T4 := rec();

T4.AllMoves := [
    [Cube4.U, 1, "U"], [Cube4.U^2, 2, "U2"], [Cube4.U^-1, -1, "U'"],
    [Cube4.D, 1, "D"], [Cube4.D^2, 2, "D2"], [Cube4.D^-1, -1, "D'"],
    [Cube4.L, 1, "L"], [Cube4.L^2, 2, "L2"], [Cube4.L^-1, -1, "L'"],
    [Cube4.R, 1, "R"], [Cube4.R^2, 2, "R2"], [Cube4.R^-1, -1, "R'"],
    [Cube4.F, 1, "F"], [Cube4.F^2, 2, "F2"], [Cube4.F^-1, -1, "F'"],
    [Cube4.B, 1, "B"], [Cube4.B^2, 2, "B2"], [Cube4.B^-1, -1, "B'"],

    [Cube4.u, 1, "u"], [Cube4.u^2, 2, "u2"], [Cube4.u^-1, -1, "u'"],
    [Cube4.d, 1, "d"], [Cube4.d^2, 2, "d2"], [Cube4.d^-1, -1, "d'"],
    [Cube4.l, 1, "l"], [Cube4.l^2, 2, "l2"], [Cube4.l^-1, -1, "l'"],
    [Cube4.r, 1, "r"], [Cube4.r^2, 2, "r2"], [Cube4.r^-1, -1, "r'"],
    [Cube4.f, 1, "f"], [Cube4.f^2, 2, "f2"], [Cube4.f^-1, -1, "f'"],
    [Cube4.b, 1, "b"], [Cube4.b^2, 2, "b2"], [Cube4.b^-1, -1, "b'"],

    [Cube4.Uu, 1, "Uu"], [Cube4.Uu^2, 2, "Uu2"], [Cube4.Uu^-1, -1, "Uu'"],
    [Cube4.Dd, 1, "Dd"], [Cube4.Dd^2, 2, "Dd2"], [Cube4.Dd^-1, -1, "Dd'"],
    [Cube4.Ll, 1, "Ll"], [Cube4.Ll^2, 2, "Ll2"], [Cube4.Ll^-1, -1, "Ll'"],
    [Cube4.Rr, 1, "Rr"], [Cube4.Rr^2, 2, "Rr2"], [Cube4.Rr^-1, -1, "Rr'"],
    [Cube4.Ff, 1, "Ff"], [Cube4.Ff^2, 2, "Ff2"], [Cube4.Ff^-1, -1, "Ff'"],
    [Cube4.Bb, 1, "Bb"], [Cube4.Bb^2, 2, "Bb2"], [Cube4.Bb^-1, -1, "Bb'"]
];

T4.G0_Inds := [1..54];
T4.G1_Inds := [2,5,7,8,9,10,11,12,13,14,15,16,17,18,20,23,25,26,27,28,29,30,31,32,33,34,35,36,38,41,43,44,45,46,47,48,49,50,51,52,53,54];
T4.G2_Inds := [2,5,7,8,9,10,11,12,14,17,20,23,25,26,27,28,29,30,32,35,38,41,43,44,45,46,47,48,50,53];
T4.G3_Inds := [2,5,8,11,14,17,20,23,26,29,32,35,38,41,44,47,50,53];

T4.Subgroups := [
    Group(List(T4.G1_Inds, i -> T4.AllMoves[i][1])),
    Group(List(T4.G2_Inds, i -> T4.AllMoves[i][1])),
    Group(List(T4.G3_Inds, i -> T4.AllMoves[i][1])),
    Group(()) 
];


#solver
T4.SolveStage := function(tarG, allowedInds, cube)
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
            move := T4.AllMoves[i];
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
T4.Solve := function(cube)
    local path, stageMoves, i;
    path := [];
    
    for i in [1..4] do
        stageMoves := T4.SolveStage(T4.Subgroups[i], [T4.G0_Inds, T4.G1_Inds, T4.G2_Inds, T4.G3_Inds][i], cube);
        Append(path, stageMoves.moves);
        cube := stageMoves.cube;
        Print("G", i-1, " -> G", i, " Moves: ", stageMoves.moves, "\n");
    od;
    
    return path;
end;
