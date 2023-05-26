PROGRAM TestRemove(INPUT,OUTPUT);
  {Читает строку из входа ,пропускает ее через RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;
PROCEDURE RemoveExtraBlanks;
  {Удаляет лишниe пробелы между словами на одной строке}
BEGIN {TestRemove}
  EmptyQ;
  WRITE('Вход:');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(Ch);
      AddQ(Ch);
    END;
  WRITELN;
  RemoveExtraBlanks;
  WRITE('Выход:');
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
{Удаляет лишниe пробелы между словами на одной строке}
VAR
  Ch ,Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd :='$';
  AddQ(LineEnd); {помечаем конец текста в очереди}
  HeadQ(Ch);
  {удаляем пробелы}
  WHILE Ch <> LineEnd
  DO
    BEGIN
      {читаем слово}
      {удаляем пробелы}
      {Вставляем пробел между словами}
    END;
  DelQ {удаяем LineEnd из очереди}
END; {RemoveExtraBlanks}


DP1.1
{удаляем пробелы}
      WHILE Ch = Blank
      DO
        BEGIN
          DelQ;
          HeadQ(Ch)
        END;


DP1.2
{читаем слово}
       WHILE (Ch <> Blank) AND (Ch <> LineEnd)
       DO
         BEGIN
           AddQ(Ch);
           DelQ;
           HeadQ(Ch)
         END;


DP1.3
{Вставляем пробел между словами}
       IF Ch <> LineEnd
       THEN
         AddQ(Blank)

