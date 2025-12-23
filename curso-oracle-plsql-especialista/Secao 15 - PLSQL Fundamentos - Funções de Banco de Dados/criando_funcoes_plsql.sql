-- Criando Funções de Banco de Dados

CREATE OR REPLACE FUNCTION FNC_CONULTA_SALARIO_EMPREGADO
    (pemployee_id   IN NUMBER)
     RETURN NUMBER 
IS
    vSalary     employees.salary%TYPE;
BEGIN
    SELECT  salary
    INTO    vSalary
    FROM    employees
    WHERE   employee_id = pemployee_id;
    RETURN  (vSalary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Colaborador não localizado: ' || pemployee_id);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle' || SQLCODE || ' - '|| SQLERRM);
END;

-- Executando a função pelo bloco PLSQL

SET SERVEROUT ON
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o ID do colaborador: '
DECLARE
    vEmployee_id    employees.employee_id%TYPE := &employee_id;
    vSalary         employees.salary%TYPE;
BEGIN   
    vSalary := FNC_CONULTA_SALARIO_EMPREGADO(vEmployee_id);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || vSalary);
END;