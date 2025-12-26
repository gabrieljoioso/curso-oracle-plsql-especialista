-- Funções no bloco PLSQL
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
    vNumero1 := 7000.8888;
    vNumero2 := 3000.4444;
    vMedia   := ROUND((vNumero1 + vNumero2) / 2, 2); -- Funcao ROUND para arredondar
    DBMS_OUTPUT.PUT_LINE('vNumero1 = ' || vNumero1);
    DBMS_OUTPUT.PUT_LINE('vNumero2 = ' || vNumero2);
    DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(vMedia, '99G999G999D99')); -- Funcao TO_CHAR para transformar em caracter
EXCEPTION
    WHEN OTHERS
    THEN
    DBMS_OUTPUT.PUT_LINE('Erro Oracle = ' || SQLCODE || SQLERRM);
END;