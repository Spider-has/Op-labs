PROGRAM StringToInt(INPUT, OUTPUT);
VAR
  Number: INTEGER;

PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN
  D := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0'
      THEN
        D := 0
      ELSE
        IF Ch = '1'
        THEN
          D := 1
        ELSE
          IF Ch = '2'
          THEN
            D := 2
          ELSE
            IF Ch = '3'
            THEN
              D := 3
            ELSE
              IF Ch = '4'
              THEN
                D := 4
              ELSE
                IF Ch = '5'
                THEN
                  D := 5
                ELSE
                  IF Ch = '6'
                  THEN
                    D := 6
                  ELSE 
                    IF Ch = '7'
                    THEN
                      D := 7
                    ELSE
                      IF Ch = '8'
                      THEN
                        D := 8
                      ELSE
                        IF Ch = '9'
                        THEN
                          D := 9
    END
END;

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR 
  Digit: INTEGER;
BEGIN
  N := 0;
  ReadDigit(F, Digit);
  IF Digit < 0
  THEN
    N := -1;
  WHILE (Digit >= 0) AND (N >= 0)
  DO
    BEGIN
      IF (N <= (MAXINT - Digit) DIV 10)
      THEN
        BEGIN 
          N := N * 10 + Digit;
          ReadDigit(F, Digit)
        END
      ELSE
        N := -2
    END;
  WRITELN(N) 
END;

BEGIN
  ReadNumber(INPUT, Number)
END.
