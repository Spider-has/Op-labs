UNIT Count3;
INTERFACE
  PROCEDURE Start;{Обнуляет счётчик}
  PROCEDURE Bump;{Инкрементирует счётчик}
  PROCEDURE Value (VAR V100, V10, V1: CHAR);{Возвращает данные с счётчика}
IMPLEMENTATION
VAR
  Ones, Tens, Hundreds: CHAR;
PROCEDURE Start;
  {Ones, Tens, Hundreds := 0,0,0}
  BEGIN{Start}
    Ones := '0';
    Tens := '0';
    Hundreds := '0'
  END;{Start}
  
PROCEDURE Bump;
  {Увеличивает 3-цифровой счётчик на 1 Ones, Tens, Hundreds
    если он находится в диапазоне от 0 до 999, иначе сбрасывает в 0 и выводит сообщение об ошибке}
  
  VAR
    OverFlow: CHAR; 
  PROCEDURE NextDigit(VAR Digit, OverFlow: CHAR);
    {Инкриментирует поданный разряд на 1}
    BEGIN {NextDigit}
      OverFlow := 'N';
      IF Digit = '0'
      THEN 
        Digit := '1' 
      ELSE
        IF Digit = '1' 
        THEN 
          Digit := '2' 
        ELSE
          IF Digit = '2' 
          THEN 
            Digit := '3' 
          ELSE
            IF Digit = '3' 
            THEN 
              Digit := '4' 
            ELSE
              IF Digit = '4' 
              THEN 
                Digit := '5' 
              ELSE
                IF Digit = '5' 
                THEN 
                  Digit := '6' 
                ELSE
                  IF Digit = '6' 
                  THEN 
                    Digit := '7' 
                  ELSE
                    IF Digit = '7' 
                    THEN 
                      Digit := '8' 
                    ELSE
                      IF Digit = '8' 
                      THEN 
                        Digit := '9' 
                      ELSE
                        IF Digit = '9' 
                        THEN
                          BEGIN 
                            Digit :='0';
                            OverFlow := 'Y'
                          END
    END;{NextDigit}
    
  BEGIN {Bump}
    NextDigit(Ones, OverFlow);
    IF OverFlow = 'Y'
    THEN
      BEGIN
        NextDigit(Tens, OverFlow);
        IF OverFlow = 'Y'
        THEN
          BEGIN
            NextDigit(Hundreds, OverFlow);
            IF OverFlow = 'Y'
            THEN
              BEGIN
                Ones := '9';
                Tens := '9';
                Hundreds := '9'
              END
          END
      END
  END; {Bump}
  
  PROCEDURE Value (VAR V100, V10, V1: CHAR);
    {Возвращает содержимое 3-х цифрового счётчика в 3 переменные на входе}
    BEGIN {Value}
        V100 := Hundreds;
        V10 := Tens;
        V1 := Ones
    END {Value};
      
BEGIN
END. {UNIT Count3}

