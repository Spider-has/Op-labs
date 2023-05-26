UNIT Queue;
INTERFACE
PROCEDURE EmptyQ; {������� Q}
PROCEDURE AddQ (VAR Elt: CHAR); {��������� ������ � ����� Q}
PROCEDURE DelQ; {������� ������ ������ �� Q}
PROCEDURE HeadQ(VAR Elt: CHAR); {��������� ��������� ������ �� Q}
PROCEDURE WriteQ;{������� Q � OUTPUT}

IMPLEMENTATION
VAR
  Q, TEMP: TEXT;
PROCEDURE CopyOpen (VAR F1, F2 :TEXT); {�������� ������ �� F1 � F2, ��� ������������� reset � rewrite � ��� writeln � ����� �����}
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


PROCEDURE EmptyQ; {Rewrite q � ������� ������}
{Q := <,/,R>}
BEGIN {EmptyQ}
  REWRITE(Q);
  WRITELN(Q);
  RESET(Q)
END{EmptyQ};


PROCEDURE AddQ (VAR Elt : CHAR); {������� ������������ ������ � Q �� ��������� �������}
  {Q = <,x/,R>, x - ������, � Elt = a -->
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


PROCEDURE DelQ; {������� ������ ������ ��  Q};
  {(Q = <,/,R> -->)|
   (Q = <,ax/,R>, a ������, � x ������  -->
     Q:= <,x/,R> }
VAR
  Ch: CHAR;
BEGIN {DelQ}
  READ(Q, Ch);
  IF NOT EOF(Q)
  THEN {�� ������}
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


PROCEDURE HeadQ(VAR Elt: CHAR); {��������� ��������� ������ �� q � ������� ��� � ������������ ����������}
  {(Q = <,/,R> --> Elt := '#')|
   (Q = <,ax/,R>,��� a ������, � x ������ -->
     Elt:= 'a' }
BEGIN  {HeadQ}
  IF NOT EOLN(Q)
  THEN
    READ(Q, Elt)
  ELSE
    Elt := '#';
  RESET(Q)
END{HeadQ};


PROCEDURE WriteQ; {�������� q � OUTPUT � ��������� ������}
  { (Q = <,x/,R> ? OUTPUT =<y,,W>,��� y � x ������   -->
     OUTPUT := <y&x/,,W> }
BEGIN {WriteQ}
  CopyOpen(Q, OUTPUT);
  WRITELN(OUTPUT);
  RESET(Q)
END{WriteQ};


BEGIN
END.

