-- Cursor - Controlando Cursor com CURSOR FOR LOOP

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor IS
    SELECT *
    FROM employees; -- Declaracao do cursor
BEGIN
    FOR employees_record IN employees_cursor -- record terá a mesma estrutura do select do cursor
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
