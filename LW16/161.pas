 PROGRAM SortMonth(INPUT, OUTPUT);
 USES DateIO;
 
 VAR
   M1, M2: Month;

BEGIN
  ReadMonth(INPUT, M1);
  ReadMonth(INPUT, M2);
  IF (M1 <> NoMonth) AND (M2 <> NoMonth)
  THEN
    BEGIN
      IF M1 = M2
      THEN
        BEGIN
          WRITE(OUTPUT, '��� ������ ');
          WriteMonth(OUTPUT, M1)
        END
      ELSE
        BEGIN
          WriteMonth(OUTPUT, M1);
          IF M1 < M2
          THEN
            WRITE(OUTPUT, ' ������������ �� ')
          ELSE
            WRITE(OUTPUT, ' ������� �� ');
          WriteMonth(OUTPUT, M2)
        END
    END
  ELSE
    WRITE(OUTPUT, '������� ������ �������� �������');
  WRITELN(OUTPUT)  
END.
