PROGRAM Test(INPUT, OUTPUT);
USES Count3;
VAR
  V1, V2, V3: CHAR;
BEGIN
  Start;
  WHILE((V3 <> '9') OR (V2 <> '9') OR (V1 <> '9'))
  DO
    BEGIN
      Bump;
      Value(V3, V2, V1)
    END;
  Value(V3, V2, V1);
  WRITELN(V3, V2, V1);
  Bump;
  Value(V3, V2, V1);
  WRITELN(V3, V2, V1)
END.
