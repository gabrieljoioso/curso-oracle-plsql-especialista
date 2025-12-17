-- Collections - Associative Array

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE Numero_Table_Type IS TABLE OF NUMBER(2)
    INDEX BY BINARY_INTEGER;
    Numero_Table Numero_Table_Type;
BEGIN
-- Armazena numeros de 1 a 10 em um associative array
    FOR i IN 1..10 
    LOOP
        Numero_Table(i) := i;
    END LOOP;
    -- Programa faz uma serie de coisas...
    -- Le o Associative Array e imprime os números armazenados
    FOR I IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE('Associative Array: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));  
    END LOOP;
END;