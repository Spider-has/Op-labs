PROGRAM TestRemove(INPUT,OUTPUT);
  {������ ������ �� ����� ,���������� �� ����� RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;
PROCEDURE RemoveExtraBlanks;
  {������� �����e ������� ����� ������� �� ����� ������}
BEGIN {TestRemove}
  EmptyQ;
  WRITE('����:');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(Ch);
      AddQ(Ch);
    END;
  WRITELN;
  RemoveExtraBlanks;
  WRITE('�����:');
  HeadQ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(Ch);
      DelQ;
      HeadQ(Ch)
    END;
  WRITELN
END. {TestRemove}


DP1
PROCEDURE RemoveExtraBlanks;
{������� �����e ������� ����� ������� �� ����� ������}
VAR
  Ch ,Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd :='$';
  AddQ(LineEnd); {�������� ����� ������ � �������}
  HeadQ(Ch);
  {������� �������}
  WHILE Ch <> LineEnd
  DO
    BEGIN
      {������ �����}
      {������� �������}
      {��������� ������ ����� �������}
    END;
  DelQ {������ LineEnd �� �������}
END; {RemoveExtraBlanks}


DP1.1
{������� �������}
      WHILE Ch = Blank
      DO
        BEGIN
          DelQ;
          HeadQ(Ch)
        END;


DP1.2
{������ �����}
       WHILE (Ch <> Blank) AND (Ch <> LineEnd)
       DO
         BEGIN
           AddQ(Ch);
           DelQ;
           HeadQ(Ch)
         END;


DP1.3
{��������� ������ ����� �������}
       IF Ch <> LineEnd
       THEN
         AddQ(Blank)

