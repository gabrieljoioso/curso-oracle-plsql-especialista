-- Operadores e precedencia PLSQL

SET SERVEROUTPUT ON
DECLARE
    vNota1      NUMBER(11,2) :=7.0;
    vNota2      NUMBER(11,2) :=6.0;
    vNota3      NUMBER(11,2) :=9.0;
    vNota4      NUMBER(11,2) :=6.0;
    vMedia      NUMBER(11,2);
    
BEGIN
    vMedia := (vNota1 + vNota2 + vNota3 + vNota4) / 4;
    DBMS_OUTPUT.PUT_LINE('Média: ' || vMedia);
END;