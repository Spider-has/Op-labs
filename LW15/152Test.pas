PROGRAM ModuleTest(INPUT, OUTPUT);
USES 
  Queue;
VAR
  Ch: CHAR;

BEGIN
  EmptyQ;
  Ch := 'Y';
  AddQ(Ch);
  Ch := 'X';
  AddQ(Ch);
  HeadQ(Ch);
  DelQ;
  WRITEQ;
  WRITE(Ch)
END.
