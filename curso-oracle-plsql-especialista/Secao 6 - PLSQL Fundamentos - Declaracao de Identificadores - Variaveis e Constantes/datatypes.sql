-- DATATYPES
SET SERVEROUTPUT ON
DECLARE
    vNumero                         NUMBER(11,2) := 1300.50;
    vCaracterTamFixo                CHAR(100) := 'Texto de Tamanho Fixo de até 32767 bytes';
    vCaracterTamVariavel            VARCHAR2(100) := 'Textto de tamanha variável de até 32767 bytes';
    vBooleano                       BOOLEAN := TRUE;
    vData                           DATE := sysdate;
    vLong                           LONG := 'Texto tamanho variavel de até 32760 bytes';
    vRowid                          ROWID;
    vTimestamp                      TIMESTAMP := systimestamp;
    vTimestampz                     TIMESTAMP WITH TIME ZONE := systimestamp;
    vCaracterTamFixoUniversal       NCHAR(100) := 'Texto de tamanho fixo universal até 32767 bytes';
    vCaracterTamVariavelUniversal   NCHAR(100) := 'Texto de tamanho variavel universal até 32767 bytes';
    vNumeroInteiro                  BINARY_INTEGER := 1200;
    vNumeroFloat                    BINARY_FLOAT := 15000000;
    vNumeroDouble                   BINARY_DOUBLE := 15000000;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Numero = ' || vNumero);
    DBMS_OUTPUT.PUT_LINE('String caracteres tam fixo = ' || vCaracterTamFixo);
    DBMS_OUTPUT.PUT_LINE('String caracteres tam variável = ' || vCaracterTamVariavel);
    IF vBooleano = TRUE
    THEN
        DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'FALSE or NULL');
    END IF;
    DBMS_OUTPUT.PUT_LINE('Data = ' || vData);
    DBMS_OUTPUT.PUT_LINE('Long = ' || vLong);
    SELECT rowid
    INTO vRowid
    FROM employees
    WHERE first_name = 'Steven' AND  last_name = 'King';
    DBMS_OUTPUT.PUT_LINE('Rowid = ' || vRowid);
    DBMS_OUTPUT.PUT_LINE('Timestamp = ' || vTimestamp);
    DBMS_OUTPUT.PUT_LINE('Timestamp com time zone = ' || vTimestampz);
    DBMS_OUTPUT.PUT_LINE('String caracteres tam fixo universal = ' || vCaracterTamFixoUniversal);
    DBMS_OUTPUT.PUT_LINE('String caracteres tam variável universal = ' || vCaracterTamVariavelUniversal);
    DBMS_OUTPUT.PUT_LINE('Numero Inteiro = ' || vNumeroInteiro);
    DBMS_OUTPUT.PUT_LINE('Numero Float = ' || vNumeroFloat);
    DBMS_OUTPUT.PUT_LINE('Numero Double = ' || vNumeroDouble);
END;
    