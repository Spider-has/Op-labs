PROGRAM ReverseCount(INPUT, OUTPUT);
USES Count3;
VAR
  V1, V10, V100, Ch, Ch2, Ch3: CHAR;
  
BEGIN{ReverseCount}
  Start;
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch);       
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch2);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch3);
      IF ((Ch2 < Ch) AND (Ch2 < Ch3)) OR ((Ch2 > Ch) AND (Ch2 > Ch3))
      THEN
        Bump;
      Ch := Ch2;
      Ch2 := Ch3      
    END;
  Value(V100, V10, V1);
  WRITELN('Reverse Count: ', V100, V10, V1)
END. {ReverseCount}
