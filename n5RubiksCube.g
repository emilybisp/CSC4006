#full face turns
U := (1,5,24,20)(2,10,23,15)(3,14,22,11)(4,19,21,6)(7,9,18,16)(8,13,17,12)(140,39,34,29)(141,38,33,28)(142,37,32,27)(143,36,31,26)(144,35,30,25);
L := (25,29,86,82)(26,44,85,67)(27,58,84,55)(28,71,83,40)(41,43,70,68)(42,57,69,56)(1,30,97,121)(6,45,102,126)(11,59,107,131)(15,72,111,135)(20,87,116,140);
F := (30,34,91,87)(31,49,90,72)(32,62,89,59)(33,76,88,45)(46,48,75,73)(47,61,74,60)(20,35,101,86)(21,50,100,71)(22,63,99,58)(23,77,98,44)(24,92,97,29);
R := (35,39,96,92)(36,54,95,77)(37,66,94,63)(38,81,93,50)(51,53,80,78)(52,65,79,64)(24,114,120,91)(19,139,115,76)(14,134,110,62)(10,130,106,49)(5,125,101,34);
D := (97,101,120,116)(98,106,119,111)(99,110,118,107)(100,115,117,102)(103,105,114,112)(104,109,113,108)(87,92,125,82)(88,93,124,83)(89,94,123,84)(90,95,122,85)(91,96,121,86);
B := (121,125,144,140)(122,130,143,135)(123,134,142,131)(124,139,141,126)(127,129,138,136)(128,133,137,132)(116,96,5,25)(117,81,4,40)(118,66,3,55)(119,54,2,67)(120,39,1,82);
#inner layer turns
u := (135,54,49,44)(136,53,48,43)(137,52,47,42)(138,51,46,41)(139,50,45,40);
l := (2,31,98,122)(7,46,103,127)(12,60,108,132)(16,73,112,136)(21,88,117,141);
f := (15,36,106,85)(16,51,105,70)(17,64,104,57)(18,78,103,43)(19,93,102,28);
r := (23,143,119,90)(18,138,114,75)(13,133,109,61)(9,129,105,48)(4,124,100,33);
d := (72,77,130,67)(73,78,129,68)(74,79,128,69)(75,80,127,70)(76,81,126,71);
b := (111,95,10,26)(112,80,9,41)(113,65,8,56)(114,53,7,68)(115,38,6,83);
#2 layer turns
Uu := U*u;
Ll := L*l;
Ff := F*f;
Rr := R*r;
Dd := D*d;
Bb := B*b; 

G := Group(U,L,F,R,B,D,u,l,f,r,b,d);
SetDomain := [1..144];
Cube := (); 

Faces := [ U, L, F, R, B, D ];
Orientation := [ 1, 2, 3, 4, 5, 6 ];

#full rotations
RotX := function()
    local x;
    x := ShallowCopy(Orientation);

    Orientation[3] := x[2];
    Orientation[4] := x[3];
    Orientation[5] := x[4];
    Orientation[2] := x[5];
end;

RotY := function()
    local x;
    x := ShallowCopy(Orientation);

    Orientation[1] := x[3];
    Orientation[3] := x[6];
    Orientation[5] := x[1];
    Orientation[6] := x[5];
end;

RotZ := function()
    local x;
    x := ShallowCopy(Orientation);

    Orientation[1] := x[2];
    Orientation[2] := x[6];
    Orientation[4] := x[1];
    Orientation[6] := x[4];
end;

DoTurn := function(turnFace, dir)
    local i, facePerm;

    i := Position(Faces, turnFace);
    if i = fail then
        i := Position(InnerFaces, turnFace);
        if i = fail then
            i := Position(DualFaces, turnFace);
            if i = fail then
                Error("Unknown face move");
            else
                facePerm := DualFaces[Orientation[i]];
            fi;
        else
            facePerm := InnerFaces[Orientation[i]];
        fi;
    else
        facePerm := Faces[ Orientation[i] ];
    fi;
    if dir = -1 then
        facePerm := facePerm^ -1;
    fi;
    Cube := facePerm * Cube;
end;

GetLayout := function()
    return Permuted(SetDomain, Cube);
end;

#middle layer turns
DoM := function()
    DoTurn(Rr, -1);
    DoTurn(Ll, 1);
    RotY();
end;

DoE := function()
    DoTurn(Uu, -1);
    DoTurn(Dd, 1);
    RotY();
end;

DoS := function()
    DoTurn(Ff, -1);
    DoTurn(Bb, 1);
    RotZ();
end;

ActualSize := Size(G);
Print("The size of the group G is: ", ActualSize, "\n");
