PROGRAM Encryption(INPUT, OUTPUT);
VAR
  ChiperFile: TEXT;
  Ch, CodeCh: CHAR;


FUNCTION GetCodingSymbol(VAR ChiperFile: TEXT; CodingSymbol: CHAR): CHAR;
VAR
  Ch: CHAR;
BEGIN {Initialize}
  RESET(ChiperFile);
  READ(ChiperFile, Ch);
  WHILE (NOT EOF(ChiperFile)) AND (CodingSymbol <> Ch)
  DO
    BEGIN
      READLN(ChiperFile);
      IF NOT EOF(ChiperFile)
      THEN
        READ(ChiperFile, Ch)
    END;
  IF (Ch = CodingSymbol)
  THEN
    READ(ChiperFile, Ch)
  ELSE
    Ch := CodingSymbol;
  GetCodingSymbol := Ch   
END;  {Initialize}

BEGIN {Encryption}
  ASSIGN(ChiperFile, 'chiper.txt');
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE (NOT EOLN(INPUT))
      DO
        BEGIN
          READ(Ch);
          WRITE(GetCodingSymbol(ChiperFile, Ch))
        END;
      READLN;
      WRITELN
    END
END.  {Encryption}
