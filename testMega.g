Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/MegaminxCube.g");

AssertTrue := function(condition, message)
    if not condition then
        Error(message);
    fi;
end;

#test turn and inverse of turn returns solved cube
for i in [CubeM.Af, CubeM.Bf, CubeM.Cf, CubeM.Df, CubeM.Ef, CubeM.Ff, CubeM.Gf, CubeM.Hf, CubeM.If, CubeM.Jf, CubeM.Kf, CubeM.Lf] do
    CubeM.DoTurn(i, 1);
    CubeM.DoTurn(i, -1);
    AssertTrue(CubeM.Cube = (), Concatenation("Inverse turn test failed: ", String(i)));
    CubeM.ResetCube();
od;

#test 5 same turns returns solved cube
for i in [CubeM.Af, CubeM.Bf, CubeM.Cf, CubeM.Df, CubeM.Ef, CubeM.Ff, CubeM.Gf, CubeM.Hf, CubeM.If, CubeM.Jf, CubeM.Kf, CubeM.Lf] do
    CubeM.DoTurn(i, 1);
    CubeM.DoTurn(i, 1);
    CubeM.DoTurn(i, 1);
    CubeM.DoTurn(i, 1);
    CubeM.DoTurn(i, 1);
    AssertTrue(CubeM.Cube = (), Concatenation("360 turn test failed: ", String(i)));
    CubeM.ResetCube();
od;

Print("All tests passed!");
