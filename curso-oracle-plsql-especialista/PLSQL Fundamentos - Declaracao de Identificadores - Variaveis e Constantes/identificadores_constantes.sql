-- Declarando CONSTANT
SET SERVEROUTPUT ON

DECLARE
    vPi CONSTANT NUMBER(38,15) := 3.1415922653589793;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pi = ' || vPi);
    
END;


-- Declarando Constant CHAR e VARCHAR2
DECLARE
    vCaracterTamFixo CONSTANT CHAR(2) := 'SP';
    vCaracterTamVariavel CONSTANT VARCHAR2(100) := 'Sao Paulo, SP';
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo);
    DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável = ' || vCaracterTamVariavel);
    
END;

