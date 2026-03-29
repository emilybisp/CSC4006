Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n3Rubikscube.g");

AssertTrue := function(condition, message)
    if not condition then
        Error(message);
    fi;
end;

#test turn and inverse of turn returns solved cube
for i in [Cube3.U, Cube3.L, Cube3.F, Cube3.R, Cube3.B, Cube3.D] do
    Cube3.DoTurn(i, 1);
    Cube3.DoTurn(i, -1);
    AssertTrue(Cube3.Cube = (), Concatenation("Inverse turn test failed: ", String(i)));
    Cube3.ResetCube();
od;

#test 4 same turns returns solved cube
for i in [Cube3.U, Cube3.L, Cube3.F, Cube3.R, Cube3.B, Cube3.D] do
    Cube3.DoTurn(i, 1);
    Cube3.DoTurn(i, 1);
    Cube3.DoTurn(i, 1);
    Cube3.DoTurn(i, 1);
    AssertTrue(Cube3.Cube = (), Concatenation("360 turn test failed: ", String(i)));
    Cube3.ResetCube();
od;

#test 4 middle slice turns returns solved cube
for i in [Cube3.DoM, Cube3.DoE, Cube3.DoS] do
    i();
    i();
    i();
    i();
    AssertTrue(Cube3.Cube = (), Concatenation("360 middle slice test failed: ", String(i)));
    Cube3.ResetCube();
od;

#test single rotation of cube turns correct face
list := [Cube3.L, Cube3.F, Cube3.R, Cube3.B];
for i in [1..Length(list)] do
    Cube3.DoTurn(list[i], 1);
    cube1 := Cube3.GetLayout();
    Cube3.ResetCube();
    Cube3.RotX();
    j := (i mod 4) + 1;
    Cube3.DoTurn(list[j], 1);
    cube2 := Cube3.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("X single rotation test failed: ", String(i), " vs ", String(j)));
    Cube3.ResetCube();
od;

list := [Cube3.F, Cube3.U, Cube3.B, Cube3.D];
for i in [1..Length(list)] do
    Cube3.DoTurn(list[i], 1);
    cube1 := Cube3.GetLayout();
    Cube3.ResetCube();
    Cube3.RotY();
    j := (i mod 4) + 1;
    Cube3.DoTurn(list[j], 1);
    cube2 := Cube3.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Y single rotation test failed: ", String(i), " vs ", String(j)));
    Cube3.ResetCube();
od;

list := [Cube3.L, Cube3.U, Cube3.R, Cube3.D];
for i in [1..Length(list)] do
    Cube3.DoTurn(list[i], 1);
    cube1 := Cube3.GetLayout();
    Cube3.ResetCube();
    Cube3.RotZ();
    j := (i mod 4) + 1;
    Cube3.DoTurn(list[j], 1);
    cube2 := Cube3.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Z single rotation test failed: ", String(i), " vs ", String(j)));
    Cube3.ResetCube();
od;

#test 4 rotations returns same face layout
list := [Cube3.L, Cube3.F, Cube3.R, Cube3.B];
for i in [1..Length(list)] do
    Cube3.DoTurn(list[i], 1);
    cube1 := Cube3.GetLayout();
    Cube3.ResetCube();
    Cube3.RotX();
    Cube3.RotX();
    Cube3.RotX();
    Cube3.RotX();
    Cube3.DoTurn(list[i], 1);
    cube2 := Cube3.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("X full rotation test failed: ", String(i), " vs ", String(j)));
    Cube3.ResetCube();
od;

list := [Cube3.F, Cube3.U, Cube3.B, Cube3.D];
for i in [1..Length(list)] do
    Cube3.DoTurn(list[i], 1);
    cube1 := Cube3.GetLayout();
    Cube3.ResetCube();
    Cube3.RotY();
    Cube3.RotY();
    Cube3.RotY();
    Cube3.RotY();
    Cube3.DoTurn(list[i], 1);
    cube2 := Cube3.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Y full rotation test failed: ", String(i), " vs ", String(j)));
    Cube3.ResetCube();
od;

list := [Cube3.L, Cube3.U, Cube3.R, Cube3.D];
for i in [1..Length(list)] do
    Cube3.DoTurn(list[i], 1);
    cube1 := Cube3.GetLayout();
    Cube3.ResetCube();
    Cube3.RotZ();
    Cube3.RotZ();
    Cube3.RotZ();
    Cube3.RotZ();
    Cube3.DoTurn(list[i], 1);
    cube2 := Cube3.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Z full rotation test failed: ", String(i), " vs ", String(j)));
    Cube3.ResetCube();
od;

Print("All tests passed!");
