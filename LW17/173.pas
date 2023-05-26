PROGRAM Stat(INPUT, OUTPUT);
VAR
  Number, Max, Min, Middle, Count, Fractional: INTEGER;

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
  IF Digit = -1 
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
    END
END;

BEGIN
  WRITELN(MaxINT);
  Min := MAXINT;
  Max := -1;
  Middle := 0;
  Count := 0;
  ReadNumber(INPUT, Number);
  WHILE (Number >= 0) AND (Middle >= 0)
  DO
    BEGIN
      Count := Count + 1;
      IF Number > Max
      THEN
        Max := Number;
      IF Number < Min 
      THEN
        Min := Number;
      IF (Middle <= MAXINT - Number)
      THEN
        Middle := Middle + Number
      ELSE
        Middle := -1;
      ReadNumber(INPUT, Number)
    END;

  IF (Middle > 0) AND (Count > 0) AND (Number >= -1)
  THEN
    BEGIN
      WRITELN('Максимальное число: ', Max);
      WRITELN('Минимальное число: ', Min);
      WRITE('Среднее арифметическое: ', Middle DIV Count);
      Fractional := ((Middle MOD Count) * 100) DIV Count;
      IF (Fractional >= 10)
      THEN
        WRITELN('.', Fractional)
      ELSE
        WRITELN('.0', Fractional)
    END
  ELSE
    IF (Middle < 0) OR (Number = -2) 
    THEN
      WRITELN('Переполнение!')   
END.
