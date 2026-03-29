Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n5Rubikscube.g");

AssertTrue := function(condition, message)
    if not condition then
        Error(message);
    fi;
end;

#test turn and inverse of turn returns solved cube
for i in [Cube5.U, Cube5.L, Cube5.F, Cube5.R, Cube5.B, Cube5.D, Cube5.u, Cube5.l, Cube5.f, Cube5.r, Cube5.b, Cube5.d] do
    Cube5.DoTurn(i, 1);
    Cube5.DoTurn(i, -1);
    AssertTrue(Cube5.Cube = (), Concatenation("Inverse turn test failed: ", String(i)));
    Cube5.ResetCube();
od;

#test 4 same turns returns solved cube
for i in [Cube5.U, Cube5.L, Cube5.F, Cube5.R, Cube5.B, Cube5.D, Cube5.u, Cube5.l, Cube5.f, Cube5.r, Cube5.b, Cube5.d] do
    Cube5.DoTurn(i, 1);
    Cube5.DoTurn(i, 1);
    Cube5.DoTurn(i, 1);
    Cube5.DoTurn(i, 1);
    AssertTrue(Cube5.Cube = (), Concatenation("360 turn test failed: ", String(i)));
    Cube5.ResetCube();
od;

#test single rotation of cube turns correct face
list := [Cube5.L, Cube5.F, Cube5.R, Cube5.B];
for i in [1..Length(list)] do
    Cube5.DoTurn(list[i], 1);
    cube1 := Cube5.GetLayout();
    Cube5.ResetCube();
    Cube5.RotX();
    j := (i mod 4) + 1;
    Cube5.DoTurn(list[j], 1);
    cube2 := Cube5.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("X single rotation test failed: ", String(i), " vs ", String(j)));
    Cube5.ResetCube();
od;

list := [Cube5.F, Cube5.U, Cube5.B, Cube5.D];
for i in [1..Length(list)] do
    Cube5.DoTurn(list[i], 1);
    cube1 := Cube5.GetLayout();
    Cube5.ResetCube();
    Cube5.RotY();
    j := (i mod 4) + 1;
    Cube5.DoTurn(list[j], 1);
    cube2 := Cube5.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Y single rotation test failed: ", String(i), " vs ", String(j)));
    Cube5.ResetCube();
od;

list := [Cube5.L, Cube5.U, Cube5.R, Cube5.D];
for i in [1..Length(list)] do
    Cube5.DoTurn(list[i], 1);
    cube1 := Cube5.GetLayout();
    Cube5.ResetCube();
    Cube5.RotZ();
    j := (i mod 4) + 1;
    Cube5.DoTurn(list[j], 1);
    cube2 := Cube5.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Z single rotation test failed: ", String(i), " vs ", String(j)));
    Cube5.ResetCube();
od;

#test 4 rotations returns same face layout
list := [Cube5.L, Cube5.F, Cube5.R, Cube5.B];
for i in [1..Length(list)] do
    Cube5.DoTurn(list[i], 1);
    cube1 := Cube5.GetLayout();
    Cube5.ResetCube();
    Cube5.RotX();
    Cube5.RotX();
    Cube5.RotX();
    Cube5.RotX();
    Cube5.DoTurn(list[i], 1);
    cube2 := Cube5.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("X full rotation test failed: ", String(i), " vs ", String(j)));
    Cube5.ResetCube();
od;

list := [Cube5.F, Cube5.U, Cube5.B, Cube5.D];
for i in [1..Length(list)] do
    Cube5.DoTurn(list[i], 1);
    cube1 := Cube5.GetLayout();
    Cube5.ResetCube();
    Cube5.RotY();
    Cube5.RotY();
    Cube5.RotY();
    Cube5.RotY();
    Cube5.DoTurn(list[i], 1);
    cube2 := Cube5.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Y full rotation test failed: ", String(i), " vs ", String(j)));
    Cube5.ResetCube();
od;

list := [Cube5.L, Cube5.U, Cube5.R, Cube5.D];
for i in [1..Length(list)] do
    Cube5.DoTurn(list[i], 1);
    cube1 := Cube5.GetLayout();
    Cube5.ResetCube();
    Cube5.RotZ();
    Cube5.RotZ();
    Cube5.RotZ();
    Cube5.RotZ();
    Cube5.DoTurn(list[i], 1);
    cube2 := Cube5.GetLayout();
    AssertTrue(cube1 = cube2, "Z full rotation test failed");
    Cube5.ResetCube();
od;

OuterList := [Cube5.U, Cube5.L, Cube5.F, Cube5.R, Cube5.B, Cube5.D];
InnerList := [Cube5.u, Cube5.l, Cube5.f, Cube5.r, Cube5.b, Cube5.d];
DualList := [Cube5.Uu, Cube5.Ll, Cube5.Ff, Cube5.Rr, Cube5.Bb, Cube5.Dd];
for i in [1..Length(OuterList)] do
    Cube5.DoTurn(DualList[i], 1);
    cube1 := Cube5.GetLayout();
    Cube5.ResetCube();
    Cube5.DoTurn(InnerList[i], 1);
    Cube5.DoTurn(OuterList[i], 1);
    cube2 := Cube5.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Dual turn test failed: ", String(cube1), " vs ", String(cube2)));
    Cube5.ResetCube();
od;

Print("All tests passed!");
