PROGRAM PseudoGraphics(INPUT, OUTPUT);
CONST
  SupportedLetters = ['C', 'H', 'E', 'S', ' '];
  GraphicSymbol = '#';
  MatrixSize = 5;
  SymbolMatrixLimit = MatrixSize * MatrixSize;
  LetterUndefined = [2, 3, 4, 5, 6, 10, 15, 25];
  SpaceSize = 2;
  MaxStrokeLimit = 255;

TYPE
  LetterMatrixType = SET OF 1 .. SymbolMatrixLimit;
  StrokeType = SET OF 1 .. MaxStrokeLimit;

VAR
  PrintingSymbol: CHAR;
  Length: INTEGER;
  Stroke: StrokeType;
  CorrectInput: BOOLEAN;
  SymbolsFile: TEXT;

PROCEDURE WriteStroke(VAR Stroke: StrokeType; StrokeLength: INTEGER);
VAR
  I, StrokeNum: INTEGER;
BEGIN
  StrokeNum := 0;
  FOR I := 1 TO MaxStrokeLimit 
  DO
    BEGIN
      IF I IN Stroke
      THEN
        WRITE(OUTPUT, GraphicSymbol)
      ELSE
        WRITE(OUTPUT, ' ');
      IF ((I - StrokeNum) MOD MatrixSize = 0)
      THEN
        WRITE(OUTPUT, ' ');
      IF (I MOD (MaxStrokeLimit DIV MatrixSize) = 0)
      THEN
        BEGIN
          WRITELN(OUTPUT);
          StrokeNum := StrokeNum + 1
        END
    END
END;

FUNCTION GetSymbolMatrixFromFile(PrintedSymbol: CHAR; VAR SymbolsFile: TEXT): LetterMatrixType;
VAR
  Matrix: LetterMatrixType;
  Ch: CHAR;
  SetNum: INTEGER; 
BEGIN
  RESET(SymbolsFile);
  Matrix := [];
  READ(SymbolsFile, Ch);
  WHILE NOT(EOF(SymbolsFile)) AND (Ch <> PrintedSymbol)
  DO
    BEGIN
      READLN(SymbolsFile);
      IF NOT EOF(SymbolsFile)
      THEN
        READ(SymbolsFile, Ch);
    END;
  IF Ch = PrintedSymbol
  THEN
    BEGIN
      READ(SymbolsFile, Ch);
      WHILE NOT EOLN(SymbolsFile)
      DO
        BEGIN
          READ(SymbolsFile, SetNum);
          Matrix := Matrix + [SetNum]
        END
    END;
  GetSymbolMatrixFromFile := Matrix
END;

PROCEDURE MergeSymbols(VAR Stroke: StrokeType; LetterNow: INTEGER; 
                       PrintedSymbol: CHAR; VAR SymbFile: TEXT);
VAR
  I, StrokeLength: INTEGER;
  SymbolNow: LetterMatrixType;
BEGIN
  SymbolNow := GetSymbolMatrixFromFile(PrintedSymbol, SymbFile);
  StrokeLength := 0;
  FOR I := 1 TO SymbolMatrixLimit
  DO
    BEGIN
      IF I IN SymbolNow
      THEN
        Stroke := Stroke + [I + LetterNow * MatrixSize + StrokeLength];
      IF (I MOD MatrixSize = 0)
      THEN
        StrokeLength := StrokeLength + ((MaxStrokeLimit DIV MatrixSize) - MatrixSize) 
    END
END;

BEGIN
  ASSIGN(SymbolsFile, 'symbols.txt');
  Length := 0;
  CorrectInput := TRUE;
  Stroke := []; 
  WHILE NOT EOLN(INPUT) AND CorrectInput 
  DO
    BEGIN
      READ(INPUT, PrintingSymbol);
      IF GetSymbolMatrixFromFile(PrintingSymbol, SymbolsFile) <> []
      THEN
        BEGIN
          MergeSymbols(Stroke, Length, PrintingSymbol, SymbolsFile);
          Length := Length + 1  
        END
      ELSE
        CorrectInput := FALSE;
    END;
  IF CorrectInput = TRUE
  THEN
    WriteStroke(Stroke, Length)
  ELSE
    WRITE('Такой символ не найден, ошибика');
  WRITELN(OUTPUT)
END.
