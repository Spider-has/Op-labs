PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  StrokeLength = 0 .. Len;

VAR
  Msg: Str;
  Code: Chiper;
  I: StrokeLength;


PROCEDURE Initialize(VAR Code: Chiper);
BEGIN {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '/'
END;  {Initialize}


PROCEDURE Encode(VAR S: Str; Length: StrokeLength);
VAR 
  Index: StrokeLength;
BEGIN {Encode}
  FOR Index := 1 TO Length
  DO
    IF S[Index] IN [' ', 'A' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}


BEGIN {Encryption}
  Initialize(Code);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      I := 0;
      WHILE (NOT EOLN(INPUT)) AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I])
        END;
      READLN;
      WRITELN;
      Encode(Msg, I)
    END
END.  {Encryption}

