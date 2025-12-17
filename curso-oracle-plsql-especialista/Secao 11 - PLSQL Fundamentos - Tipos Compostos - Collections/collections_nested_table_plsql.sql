-- Collections - Nested Table

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE Numero_Table_Type IS TABLE OF INTEGER(2);
    Numero_Table Numero_Table_Type := numero_table_type(); -- inicializa sem passar valor -- obrigatorio com nested table
BEGIN
-- Armazena numeros de 1 a 10
    FOR i IN 1..10 
    LOOP
        Numero_Table.extend;
        Numero_Table(i) := i;
    END LOOP;
    -- Programa faz uma serie de coisas..
    -- Le o Nested Table e imprime os números armazenados
    FOR I IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE('Associative Array: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));  
    END LOOP;
END;