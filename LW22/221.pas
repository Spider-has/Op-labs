PROGRAM InseptionSort(INPUT, OUTPUT);
CONST
  Max = 16;
  ListEnd = 0;

TYPE
  MasLimit = 0 .. Max;
  RecElement = RECORD
                 Key: CHAR;
                 NEXT: MasLimit;
               END;
  RecArray = ARRAY[1 .. Max] OF RecElement;

VAR
  Mas: RecArray;
  First, I: MasLimit;
  Prev, Curr: MasLimit;
  Found: BOOLEAN;
  Extra: CHAR;

PROCEDURE PrintArray(Arr: RecArray; First: MasLimit);
VAR
  I: MasLimit;
BEGIN
  I := First;
  WHILE I <> ListEnd
  DO
    BEGIN
      WRITE(OUTPUT, Mas[I].Key, '->', Mas[I].Next, ' ');
      I := Mas[I].Next 
    END;
  WRITELN(OUTPUT)
END;

BEGIN
  First := 0;
  I := 0;
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      IF I <= Max
      THEN
        BEGIN
          I := I + 1;
          READ(Mas[I].Key);
          Prev := 0;
          Curr := First;
          Found := FALSE;
          Mas[I].Next := Curr;
          IF Prev = 0
          THEN
            First := I
          ELSE
            Mas[Prev].Next := I
          //PrintArray(Mas, First)
        END
      ELSE
        BEGIN
          READ(Extra);
          WRITELN('Сообщение содержит: ', Extra, '. игнорируем.');
        END
    END;
  I := First;
  WHILE I <> ListEnd
  DO
    BEGIN
      WRITE(Mas[I].Key, ' ');
      I := Mas[I].Next 
    END;
  WRITELN(OUTPUT)
END.

