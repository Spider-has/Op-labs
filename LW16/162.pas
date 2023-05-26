PROGRAM SarahRevere(INPUT, OUTPUT); 
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN;
   
PROCEDURE InitVariable(VAR InputFile: TEXT; VAR W1, W2, W3, W4: CHAR; VAR Looking, 
                     Sea, Land: BOOLEAN);
BEGIN {InitWindow}
  Sea := FALSE;
  Land := FALSE;
  IF NOT EOLN(InputFile)
  THEN
    BEGIN
      READ(InputFile, W4);
      W1 := ' ';
      W2 := ' ';
      W3 := ' ';
      Looking := TRUE
    END
  ELSE
    Looking := FALSE 
END; {InitWindow}
 
PROCEDURE WindowMoving(VAR InputFile: TEXT; VAR W1, W2, W3, W4: CHAR; 
                       VAR Looking: BOOLEAN);
BEGIN
  IF NOT EOLN(InputFile)
  THEN
    BEGIN 
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(InputFile, W4)
    END
  ELSE
    Looking := FALSE
END; 

PROCEDURE CheckWindowForWords(W1, W2, W3, W4: CHAR; VAR Land, Sea: BOOLEAN);
BEGIN
  Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd'); {проверка окна на land}  
  Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a') {проверка окна на sea}  
END;

PROCEDURE WriteMessage(Land, Sea: BOOLEAN);
BEGIN
  IF Land
  THEN
    WRITELN('British are coming by land')
  ELSE
    IF Sea
    THEN
      WRITELN('British are coming by sea')
    ELSE
      WRITELN('British aren''t coming') 
END;
   
BEGIN {SarahRevere}   
  InitVariable(INPUT, W1, W2, W3, W4, Looking, Sea, Land);
  WHILE Looking AND (NOT (Land OR Sea))   
  DO
    BEGIN
      WindowMoving(INPUT, W1, W2, W3, W4, Looking);
      CheckWindowForWords(W1, W2, W3, W4, Land, Sea)
    END;
  WriteMessage(Land, Sea)
END.  {SarahRevere} 


