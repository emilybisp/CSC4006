Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n3Rubikscube.g");

AssertTrue := function(condition, message)
    if not condition then
        Error(message);
    fi;
end;

#test turn and inverse of turn returns solved cube
for i in [U, L, F, R, B, D] do
    DoTurn(i, 1);
    DoTurn(i, -1);
    AssertTrue(Cube = (), Concatenation("Inverse turn test failed: ", String(i)));
    ResetCube();
od;

#test 4 same turns returns solved cube
for i in [U, L, F, R, B, D] do
    DoTurn(i, 1);
    DoTurn(i, 1);
    DoTurn(i, 1);
    DoTurn(i, 1);
    AssertTrue(Cube = (), Concatenation("360 turn test failed: ", String(i)));
    ResetCube();
od;

#test 4 middle slice turns returns solved cube
for i in [DoM, DoE, DoS] do
    i();
    i();
    i();
    i();
    AssertTrue(Cube = (), Concatenation("360 middle slice test failed: ", String(i)));
    ResetCube();
od;

#test single rotation of cube turns correct face
list := [L, F, R, B];
for i in [1..Length(list)] do
    DoTurn(list[i], 1);
    cube1 := GetLayout();
    ResetCube();
    RotX();
    j := (i mod 4) + 1;
    DoTurn(list[j], 1);
    cube2 := GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("X single rotation test failed: ", String(i), " vs ", String(j)));
    ResetCube();
od;

list := [F, U, B, D];
for i in [1..Length(list)] do
    DoTurn(list[i], 1);
    cube1 := GetLayout();
    ResetCube();
    RotY();
    j := (i mod 4) + 1;
    DoTurn(list[j], 1);
    cube2 := GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Y single rotation test failed: ", String(i), " vs ", String(j)));
    ResetCube();
od;

list := [L, U, R, D];
for i in [1..Length(list)] do
    DoTurn(list[i], 1);
    cube1 := GetLayout();
    ResetCube();
    RotZ();
    j := (i mod 4) + 1;
    DoTurn(list[j], 1);
    cube2 := GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Z single rotation test failed: ", String(i), " vs ", String(j)));
    ResetCube();
od;

#test 4 rotations returns same face layout
list := [L, F, R, B];
for i in [1..Length(list)] do
    DoTurn(list[i], 1);
    cube1 := GetLayout();
    ResetCube();
    RotX();
    RotX();
    RotX();
    RotX();
    DoTurn(list[i], 1);
    cube2 := GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("X full rotation test failed: ", String(i), " vs ", String(j)));
    ResetCube();
od;

list := [F, U, B, D];
for i in [1..Length(list)] do
    DoTurn(list[i], 1);
    cube1 := GetLayout();
    ResetCube();
    RotY();
    RotY();
    RotY();
    RotY();
    DoTurn(list[i], 1);
    cube2 := GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Y full rotation test failed: ", String(i), " vs ", String(j)));
    ResetCube();
od;

list := [L, U, R, D];
for i in [1..Length(list)] do
    DoTurn(list[i], 1);
    cube1 := GetLayout();
    ResetCube();
    RotZ();
    RotZ();
    RotZ();
    RotZ();
    DoTurn(list[i], 1);
    cube2 := GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Z full rotation test failed: ", String(i), " vs ", String(j)));
    ResetCube();
od;

Print("All tests passed!\n");
