Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/PyraminxCube.g");

AssertTrue := function(condition, message)
    if not condition then
        Error(message);
    fi;
end;

#test turn and inverse of turn returns solved cube
for i in [CubeP.A, CubeP.B, CubeP.C, CubeP.D, CubeP.a, CubeP.b, CubeP.c, CubeP.d] do
    CubeP.DoTurn(i, 1);
    CubeP.DoTurn(i, -1);
    AssertTrue(CubeP.Cube = (), Concatenation("Inverse turn test failed: ", String(i)));
    CubeP.ResetCube();
od;

#test 3 same turns returns solved cube
for i in [CubeP.A, CubeP.B, CubeP.C, CubeP.D, CubeP.a, CubeP.b, CubeP.c, CubeP.d] do
    CubeP.DoTurn(i, 1);
    CubeP.DoTurn(i, 1);
    CubeP.DoTurn(i, 1);
    AssertTrue(CubeP.Cube = (), Concatenation("360 turn test failed: ", String(i)));
    CubeP.ResetCube();
od;

Print("All tests passed!");
