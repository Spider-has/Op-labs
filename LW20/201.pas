PROGRAM PseudoGraphics(INPUT, OUTPUT);
CONST
  SupportedLetters = ['C', 'H', 'E', 'S', ' '];
  GraphicSymbol = '#';
  MatrixSize = 5;
  SymbolMatrixLimit = MatrixSize * MatrixSize;
  LetterC = [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25];
  LetterH = [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
  LetterE = [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
  LetterS = [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];
  LetterUndefined = [2, 3, 4, 5, 6, 10, 15, 25];

TYPE
  LetterMatrixType = SET OF 1 ..SymbolMatrixLimit;

VAR
  PrintingSymbol: CHAR;

FUNCTION CheckForError(PrintedSymbol: CHAR): BOOLEAN;
BEGIN
  IF PrintedSymbol IN SupportedLetters
  THEN
    CheckForError := TRUE
  ELSE
    CheckForError := FALSE  
END;

FUNCTION ChooseSymbolSet(PrintedSymbol: CHAR): LetterMatrixType;
BEGIN
  CASE PrintedSymbol OF
    'C': ChooseSymbolSet := LetterC; 
    'H': ChooseSymbolSet := LetterH; 
    'E': ChooseSymbolSet := LetterE; 
    'S': ChooseSymbolSet := LetterS
  ELSE
    ChooseSymbolSet := LetterUndefined
  END 
END;

PROCEDURE PrintSymbol(PrintedSymbol: CHAR);
VAR
  Position: INTEGER;
  LetterNow: LetterMatrixType;
BEGIN
  LetterNow := ChooseSymbolSet(PrintedSymbol);
  FOR Position := 1 TO SymbolMatrixLimit
  DO
    BEGIN
      IF(Position IN LetterNow)
      THEN
        WRITE(GraphicSymbol)
      ELSE
        WRITE(' ');
      IF(Position MOD MatrixSize = 0)
      THEN
        WRITELN(OUTPUT) 
    END;
  WRITELN  
END;      

BEGIN
  WHILE NOT EOLN(INPUT) 
  DO
    BEGIN
      READ(INPUT, PrintingSymbol);
      IF PrintingSymbol IN SupportedLetters
      THEN
        PrintSymbol(PrintingSymbol)
      ELSE
        WRITELN('¬веденый символ ', PrintingSymbol, ' не поддерживаетс€')
    END;
  WRITELN(OUTPUT)
END.
