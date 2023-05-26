PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. (NumberOfScores + 1);
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  StudentSurname: CHAR;
  MarksFile: TEXT;
  
BEGIN {AverageScore}
  ClassTotal := 0;
  ASSIGN(MarksFile, 'Surname.txt');
  WRITELN('Student averages:');
  RESET(MarksFile);
  Student := 1;
  WHILE (Student <= ClassSize) AND (NOT EOF(MarksFile))
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      READ(MarksFile, StudentSurname);
      WHILE StudentSurname <> ' '
      DO
        BEGIN
          WRITE(StudentSurname);
          READ(MarksFile, StudentSurname)
        END;
      WRITE(' ');
      WHILE WhichScore <= NumberOfScores
      DO
        BEGIN
          READ(MarksFile, NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN(MarksFile);
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1
    END;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', (ClassTotal MOD 10): 1)
END.  {AverageScore}

