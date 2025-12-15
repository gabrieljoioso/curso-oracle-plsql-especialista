-- Utilizando IF - Condicional 
-- Mais abaixo também há ELSIF

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o ID do departamento: '
DECLARE
    vPercentual      NUMBER(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    IF vDepartment_id = 80
    THEN
        vPercentual := 10; -- Sales
    ELSE
        IF &pdepartment_id = 20
        THEN
            vpercentual := 15; -- Marketing
        ELSE
            IF &pdepartment_id = 60
            THEN
                vpercentual := 20; -- IT
            ELSE
                vpercentual := 5;
            END IF;
        END IF;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('ID do Departamento: ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual: ' || vPercentual);
    
    UPDATE employees
    SET salary = salary * (1 + vpercentual / 100)
    WHERE department_id = vDepartment_id;
    COMMIT; 
END;

-- Utilizando ELSIF - Condicional
SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o ID do departamento: '
DECLARE
    vPercentual      NUMBER(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    IF vDepartment_id = 80
    THEN
        vPercentual := 10; -- Sales
    ELSIF vDepartment_id = 20
    THEN
        vpercentual := 15; -- Marketing
    ELSIF vDepartment_id = 60
    THEN
        vpercentual := 20; -- IT
    ELSE
        vpercentual := 5;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('ID do Departamento: ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual: ' || vPercentual);
    
    UPDATE employees
    SET salary = salary * (1 + vpercentual / 100)
    WHERE department_id = vDepartment_id;
    COMMIT; 
END;



