Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n3Rubikscube.g");
Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n4Rubikscube.g");
Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/n5Rubikscube.g");
Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/PyraminxCube.g");
Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/MegaminxCube.g");

Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/Thistlethwaiten3.g");
Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/Thistlethwaiten5.g");

Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/CollapseCube4.g");
Read("C:/Users/emily/OneDrive/Documents/Fifth year/4006/CollapseCube5.g");

CleanInput := function(str)
    if Length(str) = 0 then
        return "";
    fi;
    return str{[1..Length(str)-1]};
end;

cubeChoice3 := function()
    local input, moves, move, face, power, solution;
    Print("Enter moves (eg R R' R2 X Y Z): \n");
    input := CleanInput(ReadLine(InputTextUser()));
    moves := SplitString(input, " ");
    for move in moves do
        if Length(move) = 1 then
            if move[1] = 'X' then
                Cube3.RotX();
                continue;
            elif move[1] = 'Y' then
                Cube3.RotY();
                continue;
            elif move[1] = 'Z' then
                Cube3.RotZ();
                continue;
            else
                power := 1;
            fi;
        elif move[2] = '\'' then
            power := -1;
        elif move[2] = '2' then
            power := 2;
        else
            Error("Invalid move: ", move);
        fi;

        if move[1] = 'R' then
            face := Cube3.R;
        elif move[1] = 'L' then
            face := Cube3.L;
        elif move[1] = 'U' then
            face := Cube3.U;
        elif move[1] = 'D' then
            face := Cube3.D;
        elif move[1] = 'F' then
            face := Cube3.F;
        elif move[1] = 'B' then
            face := Cube3.B;
        else
            Error("Invalid move: ", move);
        fi;
    
        Cube3.DoTurn(face, power);
    od;
    Print("Shuffled cube: ", Cube3.GetLayout(), "\n");
    Print("Total permutations: ", Cube3.Cube, "\n");
    Print("Solving cube...\n");
    solution := T3.Solve(Cube3.Cube);
    Print("Solution: ", solution, "\n");
end;


cubeChoice4 := function()
    local input, moves, move, face, power, solution, Col4Perm;
    Print("Enter moves (eg R R' R2 r r' r2 X Y Z): \n");
    input := CleanInput(ReadLine(InputTextUser()));
    moves := SplitString(input, " ");
    for move in moves do
        if Length(move) = 1 then
            if move[1] = 'X' then
                Cube4.RotX();
                continue;
            elif move[1] = 'Y' then
                Cube4.RotY();
                continue;
            elif move[1] = 'Z' then
                Cube4.RotZ();
                continue;
            else
                power := 1;
            fi;
        elif move[2] = '\'' then
            power := -1;
        elif move[2] = '2' then
            power := 2;
        else
            Error("Invalid move: ", move);
        fi;

        if move[1] = 'R' then
            face := Cube4.R;
        elif move[1] = 'L' then
            face := Cube4.L;
        elif move[1] = 'U' then
            face := Cube4.U;
        elif move[1] = 'D' then
            face := Cube4.D;
        elif move[1] = 'F' then
            face := Cube4.F;
        elif move[1] = 'B' then
            face := Cube4.B;
        elif move[1] = 'r' then
            face := Cube4.r;
        elif move[1] = 'l' then
            face := Cube4.l;
        elif move[1] = 'u' then
            face := Cube4.u;
        elif move[1] = 'd' then
            face := Cube4.d;
        elif move[1] = 'f' then
            face := Cube4.f;
        elif move[1] = 'b' then
            face := Cube4.b;
        else
            Error("Invalid move: ", move);
        fi;
    od;
    Cube4.DoTurn(face, power);
    Print("Shuffled cube: ", Cube4.GetLayout(), "\n");
    Print("Total permutations: ", Cube4.Cube, "\n");
    Print("Collapsing cube...\n");
    Col4.Collapse4();
    Print("Collapsed cube: ", Col4.new3Cube, "\n");
    Print("Is collapsed cube valid?\n");
    Col4Perm := Col4.LayoutToPerm(Col4.new3Cube);
end;

cubeChoice5 := function()
    local input, moves, move, face, power, solution1, solution2, Col5Perm;
    Print("Enter moves (eg R R' R2 X Y Z): \n");
    input := CleanInput(ReadLine(InputTextUser()));
    moves := SplitString(input, " ");
    for move in moves do
        if Length(move) = 1 then
            if move[1] = 'X' then
                Cube5.RotX();
                continue;
            elif move[1] = 'Y' then
                Cube5.RotY();
                continue;
            elif move[1] = 'Z' then
                Cube5.RotZ();
                continue;
            else
                power := 1;
            fi;
        elif move[2] = '\'' then
            power := -1;
        elif move[2] = '2' then
            power := 2;
        else
            Error("Invalid move: ", move);
        fi;

        if move[1] = 'R' then
            face := Cube5.R;
        elif move[1] = 'L' then
            face := Cube5.L;
        elif move[1] = 'U' then
            face := Cube5.U;
        elif move[1] = 'D' then
            face := Cube5.D;
        elif move[1] = 'F' then
            face := Cube5.F;
        elif move[1] = 'B' then
            face := Cube5.B;
        elif move[1] = 'r' then
            face := Cube5.r;
        elif move[1] = 'l' then
            face := Cube5.l;
        elif move[1] = 'u' then
            face := Cube5.u;
        elif move[1] = 'd' then
            face := Cube5.d;
        elif move[1] = 'f' then
            face := Cube5.f;
        elif move[1] = 'b' then
            face := Cube5.b;
        else
            Error("Invalid move: ", move);
        fi;

        Cube5.DoTurn(face, power);
    od;

    Print("Shuffled cube: ", Cube5.GetLayout(), "\n");
    Print("Total permutations: ", Cube5.Cube, "\n");
    Print("Solving cube...\n");
    solution1 := T5.Solve(Cube5.Cube);
    Print("Solution: ", solution1, "\n");

    Print("Collapsing cube...\n");
    Col5.Collapse5();
    Print("Collapsed cube: ", Col5.new3Cube, "\n");
    Print("Is collapsed cube valid?\n");
    Col5Perm := Col5.LayoutToPerm(Col5.new3Cube);
    #Print(Col5.LayoutToPerm(Col5.new3Cube), "\n");

    Print("\nSolving collapsed cube...\n");
    solution2 := T3.Solve(Col5Perm);
    Print("Solution: ", solution2, "\n");
end;

cubeChoiceP := function()
    local input, moves, move, face, power;
    Print("Enter moves (eg A A' A2 (A-D,a-d)): \n");
    input := CleanInput(ReadLine(InputTextUser()));
    moves := SplitString(input, " ");
    for move in moves do
        if Length(move) = 1 then
            power := 1;
        elif move[2] = '\'' then
            power := -1;
        elif move[2] = '2' then
            power := 2;
        else
            Error("Invalid move: ", move);
        fi;

        if move[1] = 'A' then
            face := CubeP.A;
        elif move[1] = 'B' then
            face := CubeP.B;
        elif move[1] = 'C' then
            face := CubeP.C;
        elif move[1] = 'D' then
            face := CubeP.D;
        elif move[1] = 'a' then
            face := CubeP.a;
        elif move[1] = 'b' then
            face := CubeP.b;
        elif move[1] = 'c' then
            face := CubeP.c;
        elif move[1] = 'd' then
            face := CubeP.d;
        else
            Error("Invalid move: ", move);
        fi;

        CubeP.DoTurn(face, power);
    od;
    Print("Shuffled cube: ", CubeP.GetLayout(), "\n");
    Print("Total permutations: ", CubeP.Cube, "\n");
end;

cubeChoiceM := function()
    local input, moves, move, face, power;
    Print("Enter moves (eg A A' A2 (A-L,)): \n");
    input := CleanInput(ReadLine(InputTextUser()));
    moves := SplitString(input, " ");
    for move in moves do
        if Length(move) = 1 then
            power := 1;
        elif move[2] = '\'' then
            power := -1;
        elif move[2] = '2' then
            power := 2;
        else
            Error("Invalid move: ", move);
        fi;

        if move[1] = 'A' then
            face := CubeM.Af;
        elif move[1] = 'B' then
            face := CubeM.Bf;
        elif move[1] = 'C' then
            face := CubeM.Cf;
        elif move[1] = 'D' then
            face := CubeM.Df;
        elif move[1] = 'E' then
            face := CubeM.Ef;
        elif move[1] = 'F' then
            face := CubeM.Ff;
        elif move[1] = 'G' then
            face := CubeM.Gf;
        elif move[1] = 'H' then
            face := CubeM.Hf;
        elif move[1] = 'I' then
            face := CubeM.If;
        elif move[1] = 'J' then
            face := CubeM.Jf;
        elif move[1] = 'K' then
            face := CubeM.Kf;
        elif move[1] = 'L' then
            face := CubeM.Lf;
        else
            Error("Invalid move: ", move);
        fi;

        CubeM.DoTurn(face, power);
    od;
    Print("Shuffled cube: ", CubeM.GetLayout(), "\n");
    Print("Total permutations: ", CubeM.Cube, "\n");
end;

Print("1. 3x3\n2. 4x4\n3. 5x5\n4. Pyraminx\n5. Megaminx\n Select a cube: \n");
str := ReadLine(InputTextUser());
cubeChoice := CleanInput(str);

if cubeChoice = "1" then
    cubeChoice3();
elif cubeChoice = "2" then
    cubeChoice4();
elif cubeChoice = "3" then
    cubeChoice5();
elif cubeChoice = "4" then
    cubeChoiceP();
elif cubeChoice = "5" then
    cubeChoiceM();
else
    Error("Invalid cube choice");
fi;


