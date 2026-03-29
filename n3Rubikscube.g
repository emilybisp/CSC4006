Cube3 := rec();

#full face turns
Cube3.U := (1,3,8,6)(2,5,7,4)(9,48,15,12)(10,47,16,13)(11,46,17,14);
Cube3.L := (1,12,33,41)(4,20,36,44)(6,27,38,46)(9,11,26,24)(10,19,25,18);
Cube3.F := (6,15,35,26)(7,22,34,19)(8,30,33,11)(12,14,29,27)(13,21,28,20);
Cube3.R := (3,43,35,14)(5,45,37,21)(8,48,40,29)(15,17,32,30)(16,23,31,22);
Cube3.B := (1,24,40,17)(2,18,39,23)(3,9,38,32)(41,43,48,46)(42,45,47,44);
Cube3.D := (24,27,30,43)(25,28,31,42)(26,29,32,41)(33,35,40,38)(34,37,39,36);

Cube3.G := Group(Cube3.U, Cube3.L, Cube3.F, Cube3.R, Cube3.B, Cube3.D);
Cube3.SetDomain := [1..48];
Cube3.Cube := (); 

Cube3.ResetCube := function()
    Cube3.Cube := ();
end;

Cube3.Faces := [ Cube3.U, Cube3.L, Cube3.F, Cube3.R, Cube3.B, Cube3.D ];
Cube3.Orientation := [ 1, 2, 3, 4, 5, 6 ];

#full rotations
Cube3.RotX := function()
    local x;
    x := ShallowCopy(Cube3.Orientation);

    Cube3.Orientation[3] := x[2];
    Cube3.Orientation[4] := x[3];
    Cube3.Orientation[5] := x[4];
    Cube3.Orientation[2] := x[5];
end;

Cube3.RotY := function()
    local x;
    x := ShallowCopy(Cube3.Orientation);

    Cube3.Orientation[1] := x[3];
    Cube3.Orientation[3] := x[6];
    Cube3.Orientation[5] := x[1];
    Cube3.Orientation[6] := x[5];
end;

Cube3.RotZ := function()
    local x;
    x := ShallowCopy(Cube3.Orientation);

    Cube3.Orientation[1] := x[2];
    Cube3.Orientation[2] := x[6];
    Cube3.Orientation[4] := x[1];
    Cube3.Orientation[6] := x[4];
end;

Cube3.DoTurn := function(turnFace, dir)
    local i, facePerm;

    i := Position(Cube3.Faces, turnFace);
    if i = fail then
        Error("Unknown face move");
    fi;
    facePerm := Cube3.Faces[ Cube3.Orientation[i] ];
    if dir = -1 then
        facePerm := facePerm^ -1;
    fi;
    Cube3.Cube := Cube3.Cube * facePerm;
end;

Cube3.GetLayout := function()
    return Permuted(Cube3.SetDomain, Cube3.Cube);
end;

#middle layer turns
Cube3.DoM := function()
    Cube3.DoTurn(Cube3.R, -1);
    Cube3.DoTurn(Cube3.L, 1);
    Cube3.RotY();
end;

Cube3.DoE := function()
    Cube3.DoTurn(Cube3.U, -1);
    Cube3.DoTurn(Cube3.D, 1);
    Cube3.RotX();
end;

Cube3.DoS := function()
    Cube3.DoTurn(Cube3.F, -1);
    Cube3.DoTurn(Cube3.B, 1);
    Cube3.RotZ();
end;

# Test law of cubology Group Size
TheoreticalSize := 43252003274489856000;
ActualSize := Size(Cube3.G);
if ActualSize = TheoreticalSize then
    Print("The group size matches the theoretical size: ", TheoreticalSize, " = ", ActualSize, "\n");
else
    Print("Discrepancy in group size! Actual: ", ActualSize, ", Theoretical: ", TheoreticalSize, "\n");
fi;
