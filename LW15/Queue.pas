UNIT Queue;
INTERFACE
PROCEDURE EmptyQ; {очищает Q}
PROCEDURE AddQ (VAR Elt: CHAR); {добавляет символ в конец Q}
PROCEDURE DelQ; {убирает первый символ из Q}
PROCEDURE HeadQ(VAR Elt: CHAR); {считывает последний символ из Q}
PROCEDURE WriteQ;{выводит Q в OUTPUT}

IMPLEMENTATION
VAR
  Q, TEMP: TEXT;
PROCEDURE CopyOpen (VAR F1, F2 :TEXT); {Копирует строку из F1 в F2, Без использования reset и rewrite и без writeln в конце файла}
VAR
  Ch: CHAR;
BEGIN {CopyOpen}
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1,Ch);
      WRITE(F2,Ch)
    END
END;{CopyOpen}


PROCEDURE EmptyQ; {Rewrite q и перенос строки}
{Q := <,/,R>}
BEGIN {EmptyQ}
  REWRITE(Q);
  WRITELN(Q);
  RESET(Q)
END{EmptyQ};


PROCEDURE AddQ (VAR Elt : CHAR); {Заносит передаваемый символ в Q на последнюю позицию}
  {Q = <,x/,R>, x - строка, а Elt = a -->
   Q = <,xa/,R> }
BEGIN {AddQ}
  REWRITE(Temp);
  RESET(Q);
  CopyOpen(Q, Temp);
  WRITELN(Temp, Elt);
  REWRITE(Q);
  RESET(Temp);
  CopyOpen(Temp, Q);
  WRITELN(Q);
  RESET(Q) 
END {AddQ};


PROCEDURE DelQ; {Удаляет первый символ из  Q};
  {(Q = <,/,R> -->)|
   (Q = <,ax/,R>, a символ, а x строка  -->
     Q:= <,x/,R> }
VAR
  Ch: CHAR;
BEGIN {DelQ}
  READ(Q, Ch);
  IF NOT EOF(Q)
  THEN {не пустой}
    BEGIN
      REWRITE(Temp);
      CopyOpen(Q,Temp);
      WRITELN(Temp);
      RESET(Temp);
      REWRITE(Q);
      CopyOpen(Temp,Q);
      WRITELN(Q)
    END;
  RESET(Q)
END {DelQ};


PROCEDURE HeadQ(VAR Elt: CHAR); {Считывает последний символ из q и заносит его в передаваемую переменную}
  {(Q = <,/,R> --> Elt := '#')|
   (Q = <,ax/,R>,где a символ, а x строка -->
     Elt:= 'a' }
BEGIN  {HeadQ}
  IF NOT EOLN(Q)
  THEN
    READ(Q, Elt)
  ELSE
    Elt := '#';
  RESET(Q)
END{HeadQ};


PROCEDURE WriteQ; {Копирует q в OUTPUT с переносом строки}
  { (Q = <,x/,R> ? OUTPUT =<y,,W>,где y и x строки   -->
     OUTPUT := <y&x/,,W> }
BEGIN {WriteQ}
  CopyOpen(Q, OUTPUT);
  WRITELN(OUTPUT);
  RESET(Q)
END{WriteQ};


BEGIN
END.

