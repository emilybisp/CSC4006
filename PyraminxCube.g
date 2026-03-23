A := (1,11,36)(3,20,33)(2,10,34)(12,9,35);
B := (5,6,7)(3,15,18)(4,16,8)(14,17,9);
C := (21,22,28)(12,15,30)(13,23,29)(14,24,33);
D := (26,27,32)(24,18,35)(25,19,31)(17,20,30);

a := (1,11,36);
b := (5,6,7);
c := (21,22,28);
d := (26,27,32);

G := Group(A,B,C,D,a,b,c,d);
SetDomain := [1..36];
Cube := ();

ResetCube := function()
    Cube := ();
end;

GetLayout := function()
    return Permuted(SetDomain, Cube);
end;

Faces := [ A, B, C, D ];
CornerFaces := [ a, b, c, d ];
Orientation := [ 1, 2, 3, 4 ];

DoTurn := function(turnFace, dir)
    local i, facePerm;

    i := Position(Faces, turnFace);
    if i = fail then
        i := Position(CornerFaces, turnFace);
        if i = fail then
            Error("Unknown face move");
            else
            facePerm := CornerFaces[Orientation[i]];
        fi;
        else
        facePerm := Faces[Orientation[i]];
    fi;
    if dir = -1 then
        facePerm := facePerm^ -1;
    fi;
    Cube := facePerm * Cube;
end;
