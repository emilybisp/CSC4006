Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/PyraminxCube.g");

AssertTrue := function(condition, message)
    if not condition then
        Error(message);
    fi;
end;

#test turn and inverse of turn returns solved cube
for i in [A, B, C, D, a, b, c, d] do
    DoTurn(i, 1);
    DoTurn(i, -1);
    AssertTrue(Cube = (), Concatenation("Inverse turn test failed: ", String(i)));
    ResetCube();
od;

#test 3 same turns returns solved cube
for i in [A, B, C, D, a, b, c, d] do
    DoTurn(i, 1);
    DoTurn(i, 1);
    DoTurn(i, 1);
    AssertTrue(Cube = (), Concatenation("360 turn test failed: ", String(i)));
    ResetCube();
od;

Print("All tests passed!");