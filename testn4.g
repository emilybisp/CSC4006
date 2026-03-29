Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n4Rubikscube.g");

AssertTrue := function(condition, message)
    if not condition then
        Error(message);
    fi;
end;

#test turn and inverse of turn returns solved cube
for i in [Cube4.U, Cube4.L, Cube4.F, Cube4.R, Cube4.B, Cube4.D, Cube4.u, Cube4.l, Cube4.f, Cube4.r, Cube4.b, Cube4.d] do
    Cube4.DoTurn(i, 1);
    Cube4.DoTurn(i, -1);
    AssertTrue(Cube4.Cube = (), Concatenation("Inverse turn test failed: ", String(i)));
    Cube4.ResetCube();
od;

#test 4 same turns returns solved cube
for i in [Cube4.U, Cube4.L, Cube4.F, Cube4.R, Cube4.B, Cube4.D, Cube4.u, Cube4.l, Cube4.f, Cube4.r, Cube4.b, Cube4.d] do
    Cube4.DoTurn(i, 1);
    Cube4.DoTurn(i, 1);
    Cube4.DoTurn(i, 1);
    Cube4.DoTurn(i, 1);
    AssertTrue(Cube4.Cube = (), Concatenation("360 turn test failed: ", String(i)));
    Cube4.ResetCube();
od;

#test single rotation of cube turns correct face
list := [Cube4.L, Cube4.F, Cube4.R, Cube4.B];
for i in [1..Length(list)] do
    Cube4.DoTurn(list[i], 1);
    cube1 := Cube4.GetLayout();
    Cube4.ResetCube();
    Cube4.RotX();
    j := (i mod 4) + 1;
    Cube4.DoTurn(list[j], 1);
    cube2 := Cube4.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("X single rotation test failed: ", String(i), " vs ", String(j)));
    Cube4.ResetCube();
od;

list := [Cube4.F, Cube4.U, Cube4.B, Cube4.D];
for i in [1..Length(list)] do
    Cube4.DoTurn(list[i], 1);
    cube1 := Cube4.GetLayout();
    Cube4.ResetCube();
    Cube4.RotY();
    j := (i mod 4) + 1;
    Cube4.DoTurn(list[j], 1);
    cube2 := Cube4.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Y single rotation test failed: ", String(i), " vs ", String(j)));
    Cube4.ResetCube();
od;

list := [Cube4.L, Cube4.U, Cube4.R, Cube4.D];
for i in [1..Length(list)] do
    Cube4.DoTurn(list[i], 1);
    cube1 := Cube4.GetLayout();
    Cube4.ResetCube();
    Cube4.RotZ();
    j := (i mod 4) + 1;
    Cube4.DoTurn(list[j], 1);
    cube2 := Cube4.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Z single rotation test failed: ", String(i), " vs ", String(j)));
    Cube4.ResetCube();
od;

#test 4 rotations returns same face layout
list := [Cube4.L, Cube4.F, Cube4.R, Cube4.B];
for i in [1..Length(list)] do
    Cube4.DoTurn(list[i], 1);
    cube1 := Cube4.GetLayout();
    Cube4.ResetCube();
    Cube4.RotX();
    Cube4.RotX();
    Cube4.RotX();
    Cube4.RotX();
    Cube4.DoTurn(list[i], 1);
    cube2 := Cube4.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("X full rotation test failed: ", String(i), " vs ", String(j)));
    Cube4.ResetCube();
od;

list := [Cube4.F, Cube4.U, Cube4.B, Cube4.D];
for i in [1..Length(list)] do
    Cube4.DoTurn(list[i], 1);
    cube1 := Cube4.GetLayout();
    Cube4.ResetCube();
    Cube4.RotY();
    Cube4.RotY();
    Cube4.RotY();
    Cube4.RotY();
    Cube4.DoTurn(list[i], 1);
    cube2 := Cube4.GetLayout();
    AssertTrue(cube1 = cube2, Concatenation("Y full rotation test failed: ", String(i), " vs ", String(j)));
    Cube4.ResetCube();
od;

list := [Cube4.L, Cube4.U, Cube4.R, Cube4.D];
for i in [1..Length(list)] do
    Cube4.DoTurn(list[i], 1);
    cube1 := Cube4.GetLayout();
    Cube4.ResetCube();
    Cube4.RotZ();
    Cube4.RotZ();
    Cube4.RotZ();
    Cube4.RotZ();
    Cube4.DoTurn(list[i], 1);
    cube2 := Cube4.GetLayout();
    AssertTrue(cube1 = cube2, "Z full rotation test failed");
    Cube4.ResetCube();
od;

OuterList := [Cube4.U, Cube4.L, Cube4.F, Cube4.R, Cube4.B, Cube4.D];
InnerList := [Cube4.u, Cube4.l, Cube4.f, Cube4.r, Cube4.b, Cube4.d];
DualList := [Cube4.Uu, Cube4.Ll, Cube4.Ff, Cube4.Rr, Cube4.Bb, Cube4.Dd];
for i in [1..Length(OuterList)] do
    Cube4.DoTurn(DualList[i], 1);
    cube1 := Cube4.GetLayout();
    Cube4.ResetCube();
    Cube4.DoTurn(InnerList[i], 1);
    Cube4.DoTurn(OuterList[i], 1);
    cube2 := Cube4.GetLayout();
    AssertTrue(cube1 = cube2, "Dual turn test failed: ");
    Cube4.ResetCube();
od;

Print("All tests passed!");
