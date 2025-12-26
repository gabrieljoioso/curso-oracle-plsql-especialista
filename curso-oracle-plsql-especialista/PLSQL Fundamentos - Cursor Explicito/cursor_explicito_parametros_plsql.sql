-- Cursor explicito com parametros
-- Cursor for loop com parametros

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor (pdepartment_id NUMBER,
                            pjob_id VARCHAR2)
    IS
    SELECT *
    FROM employees
    WHERE department_id = pdepartment_id
    AND job_id = pjob_id;
    
BEGIN
    FOR employees_record IN employees_cursor (60, 'IT_PROG') -- record terá a mesma estrutura do select do cursor
    LOOP -- neste loop está implicito o OPEN e o FETCH INTO do cursor e do record
        DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' || 
                  employees_record.first_name || ' - ' ||
                  employees_record.last_name || ' - ' ||
                  employees_record.department_id || ' - ' ||
                  employees_record.job_id || ' - ' ||
                  employees_record.phone_number || ' - ' ||
                  LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99'))); -- LTRIM elimina o espaço em branco a esquerda
    
    END LOOP;
END;