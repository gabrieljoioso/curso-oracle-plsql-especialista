-- Sintaxe e diretrizes de um bloco PLSQL
SET SERVEROUTPUT ON
DECLARE
    vNumero1 NUMBER(13,2);
    vNumero2 NUMBER(13,2);
    vMedia   NUMBER(13,2);
BEGIN
    /*  Cálculo do valor da média de dois números
        Autor: Gabriel E. Joioso
        Data: 12/12/2025 
    */
    vNumero1 := 7000;
    vNumero2 := 5E3;
    vMedia   := (vNumero1 + vNumero2) / 2;
    DBMS_OUTPUT.PUT_LINE('vNumero1 = ' || vNumero1);
    DBMS_OUTPUT.PUT_LINE('vNumero2 = ' || vNumero2);
    DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);
EXCEPTION
    WHEN OTHERS
    THEN
    DBMS_OUTPUT.PUT_LINE('Erro Oracle = ' || SQLCODE || SQLERRM);
END;