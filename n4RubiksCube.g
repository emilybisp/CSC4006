Cube4:= rec();
#full face turns
Cube4.U := (1,4,16,13)(2,8,15,9)(3,12,14,5)(6,7,11,10) (93,28,24,20)(94,27,23,19)(95,26,22,18)(96,25,21,17);
Cube4.L := (17,20,56,53)(18,32,55,41)(19,44,54,29)(30,31,43,42)(1,21,65,81)(5,33,69,85)(9,45,73,89)(13,57,77,93);
Cube4.F := (21,24,60,57)(22,26,59,45)(23,48,58,33)(34,35,47,46)(13,25,68,56)(14,37,67,44)(15,49,66,32)(16,61,65,20);
Cube4.R := (25,28,64,61)(26,40,63,49)(27,52,62,37)(38,39,51,50)(16,96,80,60)(12,92,76,48)(8,88,72,36)(4,84,68,24);
Cube4.B := (81,84,96,93)(82,88,95,89)(83,92,94,85)(86,87,91,90) (77,64,4,17)(78,52,3,29)(79,40,2,41)(80,28,1,53);
Cube4.D := (65,68,80,77)(66,72,79,73)(67,76,78,69)(70,71,75,74) (57,61,84,53)(58,62,83,54)(59,63,82,55)(60,64,81,56);
#inner layer turns
Cube4.u := (89,40,36,32)(90,39,35,31)(91,38,34,30)(92,37,33,29);
Cube4.l := (2,22,66,82)(6,34,70,86)(10,46,74,90)(14,58,78,94);
Cube4.f := (9,26,72,55)(10,38,71,43)(11,50,70,31)(12,62,69,19);
Cube4.r := (15,95,79,59)(11,91,75,47)(7,87,71,35)(3,83,67,23);
Cube4.b := (73,63,8,18)(74,51,7,30)(75,39,6,42)(76,27,5,54);
Cube4.d := (45,49,88,41)(46,50,87,42)(47,51,86,43)(48,52,85,44);
#half turns
Cube4.Uu := Cube4.u*Cube4.U;
Cube4.Ll := Cube4.l*Cube4.L;
Cube4.Ff := Cube4.f*Cube4.F;
Cube4.Rr := Cube4.r*Cube4.R;
Cube4.Dd := Cube4.d*Cube4.D;
Cube4.Bb := Cube4.b*Cube4.B;

Cube4.G := Group(Cube4.U, Cube4.L, Cube4.F, Cube4.R, Cube4.B, Cube4.D, Cube4.u, Cube4.l, Cube4.f, Cube4.r, Cube4.b, Cube4.d);
Cube4.SetDomain := [1..96];
Cube4.Cube := (); 

Cube4.ResetCube := function()
    Cube4.Cube := ();
end;

Cube4.Faces := [ Cube4.U, Cube4.L, Cube4.F, Cube4.R, Cube4.B, Cube4.D ];
Cube4.InnerFaces := [ Cube4.u, Cube4.l, Cube4.f, Cube4.r, Cube4.b, Cube4.d ];
Cube4.DualFaces := [ Cube4.Uu, Cube4.Ll, Cube4.Ff, Cube4.Rr, Cube4.Bb, Cube4.Dd ];
Cube4.Orientation := [ 1, 2, 3, 4, 5, 6 ];

#full rotations
Cube4.RotX := function()
    local x;
    x := ShallowCopy(Cube4.Orientation);

    Cube4.Orientation[3] := x[2];
    Cube4.Orientation[4] := x[3];
    Cube4.Orientation[5] := x[4];
    Cube4.Orientation[2] := x[5];
end;

Cube4.RotY := function()
    local x;
    x := ShallowCopy(Cube4.Orientation);

    Cube4.Orientation[1] := x[3];
    Cube4.Orientation[3] := x[6];
    Cube4.Orientation[5] := x[1];
    Cube4.Orientation[6] := x[5];
end;

Cube4.RotZ := function()
    local x;
    x := ShallowCopy(Cube4.Orientation);

    Cube4.Orientation[1] := x[2];
    Cube4.Orientation[2] := x[6];
    Cube4.Orientation[4] := x[1];
    Cube4.Orientation[6] := x[4];
end;

Cube4.DoTurn := function(turnFace, dir)
    local i, facePerm;

    i := Position(Cube4.Faces, turnFace);
    if i = fail then
        i := Position(Cube4.InnerFaces, turnFace);
        if i = fail then
            i := Position(Cube4.DualFaces, turnFace);
            if i = fail then
                Error("Unknown face move");
            else
                facePerm := Cube4.DualFaces[Cube4.Orientation[i]];
            fi;
        else
            facePerm := Cube4.InnerFaces[Cube4.Orientation[i]];
        fi;
    else
        facePerm := Cube4.Faces[Cube4.Orientation[i]];
    fi;

    if dir = -1 then
        facePerm := facePerm^ -1;
    fi;
    Cube4.Cube := Cube4.Cube * facePerm;
end;

Cube4.GetLayout := function()
    return Permuted(Cube4.SetDomain, Cube4.Cube);
end;

ActualSize := Size(G);
Print("The size of the group G is: ", ActualSize, "\n");
