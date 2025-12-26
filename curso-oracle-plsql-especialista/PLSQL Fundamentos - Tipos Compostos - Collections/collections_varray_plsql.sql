-- Collections - Varray

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    TYPE Numero_Table_Type IS VARRAY (10) OF INTEGER(2);
    Numero_Table Numero_Table_Type := numero_table_type();
BEGIN
-- Armazena numeros de 1 a 10 em um associative array
    FOR i IN 1..10 
    LOOP
        Numero_Table.extend;
        Numero_Table(i) := i;
    END LOOP;
    -- Programa faz uma serie de coisas..
    -- Le o Varray e imprime os números armazenados
    FOR i IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE('Associative Array: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));  
    END LOOP;
END;