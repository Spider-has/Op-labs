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
          WRITE(OUTPUT, 'ќба ћес€ца ');
          WriteMonth(OUTPUT, M1)
        END
      ELSE
        BEGIN
          WriteMonth(OUTPUT, M1);
          IF M1 < M2
          THEN
            WRITE(OUTPUT, ' предшествует за ')
          ELSE
            WRITE(OUTPUT, ' следует за ');
          WriteMonth(OUTPUT, M2)
        END
    END
  ELSE
    WRITE(OUTPUT, '¬ходные данные записаны неверно');
  WRITELN(OUTPUT)  
END.
