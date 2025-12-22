-- Utilizando parametros tipo IN na Procedure

CREATE OR REPLACE PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO
    (pEmployee_id   IN NUMBER,
     pPercentual IN NUMBER)
IS
    -- Nenhuma variavel declarada
BEGIN
    UPDATE employees
    SET salary = salary * (1 + ppercentual / 100)
    WHERE employee_id = pemployee_id;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;

-- Executando a proc pelo bloco plsql

BEGIN
    PRC_AUMENTA_SALARIO_EMPREGADO(109,10);
    --COMMIT;
END;

-- Verificar se foi efetivado
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID = '109'