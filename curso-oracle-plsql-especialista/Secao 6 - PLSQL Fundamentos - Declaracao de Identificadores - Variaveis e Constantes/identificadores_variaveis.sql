-- Declarando var do tipo numero
SET SERVEROUTPUT ON

DECLARE
    vNumero NUMBER(11,2) := 1250.52;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Numero = ' || vNumero);
    
END;

-- Declarando var do tipo CHAR e VARCHAR2
DECLARE
    vCaracterTamFixo CHAR(2) := 'SP';
    vCaracterTamVariavel VARCHAR2(100) := 'Sao Paulo, SP';
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo);
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável = ' || vCaracterTamVariavel);
    
END;

-- Declarando var do tipo DATE - default dd/mm/yy
DECLARE
    vData1 DATE := '11/12/25';
    vData2 DATE := '11/12/2025';
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data 01 = ' || vData1);
    DBMS_OUTPUT.PUT_LINE('Data 02 = ' || vData2);
    
END;
