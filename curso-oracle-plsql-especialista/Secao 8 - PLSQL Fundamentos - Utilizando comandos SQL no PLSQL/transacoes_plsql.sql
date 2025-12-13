-- Controlando transações do banco de dados

-- COMMIT

SET SERVEROUTPUT ON
DECLARE
    vEmployee_id    employees.employee_id%type := 150;
BEGIN
    UPDATE employees
    SET salary = 15000
    WHERE employee_id = vEmployee_id;
    COMMIT;
END;

-- ROLLBACK

SET SERVEROUTPUT ON
DECLARE
    vEmployee_id    employees.employee_id%type := 150;
BEGIN
    UPDATE employees
    SET salary = 20000
    WHERE employee_id = vEmployee_id;
    ROLLBACK;
END;


-- SAVE POINT - PLSQL

BEGIN
    INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
    VALUES
    (employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '515.123.45568', SYSDATE, 'IT_PROG', 15000, 0.4, 103, 60);
    
    SAVEPOINT INSERTOK;
    
    UPDATE employees
    SET salary = 30000
    WHERE job_id = 'IT_PROG';
    
    ROLLBACK TO INSERTOK; -- Rollback de tudo que foi feito até o SAVEPOINT -- Neste caso fará o rollback do update
    COMMIT; -- Se fizer o commit após o rollback para o save point, apenas o commit do insert será feito.
END;
    