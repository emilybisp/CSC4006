CubeP := rec();

CubeP.A := (1,11,36)(3,20,33)(2,10,34)(12,9,35);
CubeP.B := (5,6,7)(3,15,18)(4,16,8)(14,17,9);
CubeP.C := (21,22,28)(12,15,30)(13,23,29)(14,24,33);
CubeP.D := (26,27,32)(24,18,35)(25,19,31)(17,20,30);

CubeP.a := (1,11,36);
CubeP.b := (5,6,7);
CubeP.c := (21,22,28);
CubeP.d := (26,27,32);

CubeP.G := Group(CubeP.A,CubeP.B,CubeP.C,CubeP.D,CubeP.a,CubeP.b,CubeP.c,CubeP.d);
CubeP.SetDomain := [1..36];
CubeP.Cube := ();

CubeP.ResetCube := function()
    CubeP.Cube := ();
end;

CubeP.GetLayout := function()
    return Permuted(CubeP.SetDomain, CubeP.Cube);
end;

CubeP.Faces := [ CubeP.A, CubeP.B, CubeP.C, CubeP.D ];
CubeP.CornerFaces := [ CubeP.a, CubeP.b, CubeP.c, CubeP.d ];
CubeP.Orientation := [ 1, 2, 3, 4 ];

CubeP.DoTurn := function(turnFace, dir)
    local i, facePerm;

    i := Position(CubeP.Faces, turnFace);
    if i = fail then
        i := Position(CubeP.CornerFaces, turnFace);
        if i = fail then
            Error("Unknown face move");
            else
            facePerm := CubeP.CornerFaces[CubeP.Orientation[i]];
        fi;
        else
        facePerm := CubeP.Faces[CubeP.Orientation[i]];
    fi;
    if dir = -1 then
        facePerm := facePerm^ -1;
    fi;
    CubeP.Cube := CubeP.Cube * facePerm;
end;
