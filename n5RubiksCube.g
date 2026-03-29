Cube5 := rec();
#full face turns
Cube5.U := (1,5,24,20)(2,10,23,15)(3,14,22,11)(4,19,21,6)(7,9,18,16)(8,13,17,12)(140,39,34,29)(141,38,33,28)(142,37,32,27)(143,36,31,26)(144,35,30,25);
Cube5.L := (25,29,86,82)(26,44,85,67)(27,58,84,55)(28,71,83,40)(41,43,70,68)(42,57,69,56)(1,30,97,121)(6,45,102,126)(11,59,107,131)(15,72,111,135)(20,87,116,140);
Cube5.F := (30,34,91,87)(31,49,90,72)(32,62,89,59)(33,76,88,45)(46,48,75,73)(47,61,74,60)(20,35,101,86)(21,50,100,71)(22,63,99,58)(23,77,98,44)(24,92,97,29);
Cube5.R := (35,39,96,92)(36,54,95,77)(37,66,94,63)(38,81,93,50)(51,53,80,78)(52,65,79,64)(24,144,120,91)(19,139,115,76)(14,134,110,62)(10,130,106,49)(5,125,101,34);
Cube5.D := (97,101,120,116)(98,106,119,111)(99,110,118,107)(100,115,117,102)(103,105,114,112)(104,109,113,108)(87,92,125,82)(88,93,124,83)(89,94,123,84)(90,95,122,85)(91,96,121,86);
Cube5.B := (121,125,144,140)(122,130,143,135)(123,134,142,131)(124,139,141,126)(127,129,138,136)(128,133,137,132)(116,96,5,25)(117,81,4,40)(118,66,3,55)(119,54,2,67)(120,39,1,82);
#inner layer turns
Cube5.u := (135,54,49,44)(136,53,48,43)(137,52,47,42)(138,51,46,41)(139,50,45,40);
Cube5.l := (2,31,98,122)(7,46,103,127)(12,60,108,132)(16,73,112,136)(21,88,117,141);
Cube5.f := (15,36,106,85)(16,51,105,70)(17,64,104,57)(18,78,103,43)(19,93,102,28);
Cube5.r := (23,143,119,90)(18,138,114,75)(13,133,109,61)(9,129,105,48)(4,124,100,33);
Cube5.d := (72,77,130,67)(73,78,129,68)(74,79,128,69)(75,80,127,70)(76,81,126,71);
Cube5.b := (111,95,10,26)(112,80,9,41)(113,65,8,56)(114,53,7,68)(115,38,6,83);
#2 layer turns
Cube5.Uu := Cube5.u*Cube5.U;
Cube5.Ll := Cube5.l*Cube5.L;
Cube5.Ff := Cube5.f*Cube5.F;
Cube5.Rr := Cube5.r*Cube5.R;
Cube5.Dd := Cube5.d*Cube5.D;
Cube5.Bb := Cube5.b*Cube5.B;

Cube5.G := Group(Cube5.U, Cube5.L, Cube5.F, Cube5.R, Cube5.B, Cube5.D, Cube5.u, Cube5.l, Cube5.f, Cube5.r, Cube5.b, Cube5.d);
Cube5.SetDomain := [1..144];
Cube5.Cube := (); 

Cube5.ResetCube := function()
    Cube5.Cube := ();
end;

Cube5.Faces := [ Cube5.U, Cube5.L, Cube5.F, Cube5.R, Cube5.B, Cube5.D ];
Cube5.InnerFaces := [ Cube5.u, Cube5.l, Cube5.f, Cube5.r, Cube5.b, Cube5.d ];
Cube5.DualFaces := [ Cube5.Uu, Cube5.Ll, Cube5.Ff, Cube5.Rr, Cube5.Bb, Cube5.Dd ];
Cube5.Orientation := [ 1, 2, 3, 4, 5, 6 ];

#full rotations
Cube5.RotX := function()
    local x;
    x := ShallowCopy(Cube5.Orientation);

    Cube5.Orientation[3] := x[2];
    Cube5.Orientation[4] := x[3];
    Cube5.Orientation[5] := x[4];
    Cube5.Orientation[2] := x[5];
end;

Cube5.RotY := function()
    local x;
    x := ShallowCopy(Cube5.Orientation);

    Cube5.Orientation[1] := x[3];
    Cube5.Orientation[3] := x[6];
    Cube5.Orientation[5] := x[1];
    Cube5.Orientation[6] := x[5];
end;

Cube5.RotZ := function()
    local x;
    x := ShallowCopy(Cube5.Orientation);

    Cube5.Orientation[1] := x[2];
    Cube5.Orientation[2] := x[6];
    Cube5.Orientation[4] := x[1];
    Cube5.Orientation[6] := x[4];
end;

Cube5.DoTurn := function(turnFace, dir)
    local i, facePerm;

    i := Position(Cube5.Faces, turnFace);
    if i = fail then
        i := Position(Cube5.InnerFaces, turnFace);
        if i = fail then
            i := Position(Cube5.DualFaces, turnFace);
            if i = fail then
                Error("Unknown face move");
            else
                facePerm := Cube5.DualFaces[Cube5.Orientation[i]];
            fi;
        else
            facePerm := Cube5.InnerFaces[Cube5.Orientation[i]];
        fi;
    else
        facePerm := Cube5.Faces[Cube5.Orientation[i]];
    fi;
    if dir = -1 then
        facePerm := facePerm^ -1;
    fi;
    Cube5.Cube := Cube5.Cube * facePerm;
end;

Cube5.GetLayout := function()
    return Permuted(Cube5.SetDomain, Cube5.Cube);
end;

#middle layer turns
Cube5.DoM := function()
    Cube5.DoTurn(Cube5.Rr, -1);
    Cube5.DoTurn(Cube5.Ll, 1);
    Cube5.RotY();
end;

Cube5.DoE := function()
    Cube5.DoTurn(Cube5.Uu, -1);
    Cube5.DoTurn(Cube5.Dd, 1);
    Cube5.RotY();
end;

Cube5.DoS := function()
    Cube5.DoTurn(Cube5.Ff, -1);
    Cube5.DoTurn(Cube5.Bb, 1);
    Cube5.RotZ();
end;

ActualSize := Size(G);
Print("The size of the group G is: ", ActualSize, "\n");
