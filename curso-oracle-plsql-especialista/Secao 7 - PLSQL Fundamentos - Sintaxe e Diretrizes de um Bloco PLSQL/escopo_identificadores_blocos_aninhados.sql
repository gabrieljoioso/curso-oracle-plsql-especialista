-- Escopo de identificadores e blocos aninhados

SET SERVEROUTPUT ON
DECLARE
    vBloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco1: ' || vBloco1);
    -- Se referenciar vBloco2 aqui --> Exception
    DECLARE
        vBloco2 VARCHAR2(20) := 'Bloco 2';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco1: ' || vBloco1);
        DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco2: ' || vBloco2);
    END;
    DBMS_OUTPUT.PUT_LINE('Referenciando variável do bloco1: ' || vBloco1);
    -- Se referenciar vBloco2 aqui --> Exception
END;