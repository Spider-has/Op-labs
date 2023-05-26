PROGRAM TreeSort(INPUT, OUTPUT);
TYPE
  Tree = ^RECORD
           Key: CHAR;
           Left: Tree;
           Right: Tree
          END;

VAR
  Root: Tree;
  Ch: CHAR;

PROCEDURE Insert(VAR PTR: Tree; Data: CHAR);
BEGIN
  IF PTR = NIL
  THEN
    BEGIN
      New(PTR);
      PTR^.Key := Data;
      PTR^.Left := NIL;
      PTR^.Right := NIL
    END
  ELSE
    IF PTR^.Key > Data
    THEN
      Insert(Ptr^.Left, Data)
    ELSE
      Insert(Ptr^.Right, Data)
END;

PROCEDURE TreePrint(PTR: Tree);
BEGIN
  IF PTR <> NIL
  THEN
    BEGIN
      TreePrint(PTR^.Left);
      WRITE(PTR^.Key);
      TreePrint(PTR^.Right)
    END;
END;

BEGIN
  Root := NIL;
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(Ch);
      Insert(Root, Ch)
    END;
  TreePrint(Root)
END.
