PROGRAM PseudoGraphics(INPUT, OUTPUT);
CONST
  SupportedLetters = ['C', 'H', 'E', 'S'];
  GraphicSymbol = '#';
  SymbolMatrixLimit = 25;
  LetterC = [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25];
  LetterH = [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
  LetterE = [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
  LetterS = [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];

TYPE
  LetterMatrixType = SET OF 1 ..SymbolMatrixLimit;

VAR
  PrintingSymbol: CHAR;
  I: INTEGER;

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
    ChooseSymbolSet := []
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
      IF(Position MOD 5 = 0)
      THEN
        WRITELN(OUTPUT) 
    END;
  WRITELN  
END;

BEGIN
  READ(PrintingSymbol);
  WRITELN(CheckForError(PrintingSymbol));
  IF CheckForError(PrintingSymbol)
  THEN
    BEGIN
     FOR I := 1 TO  SymbolMatrixLimit
     DO
       BEGIN
         IF I IN ChooseSymbolSet(PrintingSymbol)
         THEN 
           WRITE(I, ' ')
       END;
      WRITELN(OUTPUT);
      PrintSymbol(PrintingSymbol)  
    END
END.
