PROGRAM Prime(INPUT, OUTPUT);
CONST
  MaxNum = 100;
  MinNum = 2;
  MinPrimeNumber = 2;
  
TYPE
  SieveRange = SET OF MinNum..MaxNum;

VAR
  Sieve: SieveRange;
  MinPrime, MaxInRange: INTEGER;

PROCEDURE WriteSet(Sieve: SieveRange; Min, Max: INTEGER);
VAR
  SetNum: INTEGER;
BEGIN
  SetNum := Min;
  WHILE SetNum <= Max
  DO
    BEGIN
      IF SetNum IN Sieve
      THEN
        WRITE(SetNum, ' ');
      SetNum := SetNum + 1
    END
END;

PROCEDURE DeleteMultipleFromSet(VAR Sieve: SieveRange; MultipleNum, Max, Min: INTEGER);
VAR
  SetNum: INTEGER;
BEGIN
  SetNum := MultipleNum * 2;
  WHILE SetNum <= Max
  DO
    BEGIN
      Sieve := Sieve - [SetNum];
      SetNum := SetNum + MultipleNum    
    END
END;

FUNCTION FindMinInSet(Sieve: SieveRange; Min, Max, MinPrime: INTEGER): INTEGER;
VAR
  SetNum: INTEGER;
BEGIN
  SetNum := Min;
  WHILE (SetNum <= Max) AND ((NOT(SetNum IN Sieve)) OR (SetNum <= MinPrime))
  DO
    SetNum := SetNum + 1;
  FindMinInSet := SetNum
END;

BEGIN
  MinPrime := MinPrimeNumber;
  Sieve := [MinNum .. MaxNum];
  WHILE (MinPrime * MinPrime <= MaxNum)
  DO
    BEGIN
      DeleteMultipleFromSet(Sieve, MinPrime, MaxNum, MinNum);
      MinPrime := FindMinInSet(Sieve, MinNum, MaxNum, MinPrime) 
    END;
  WRITELN('Простые числа в диапазоне от ', MinNum, ' до ', MaxNum, ' будут: ');
  WriteSet(Sieve, MinNum, MaxNum);
  WRITELN 
END.
     
