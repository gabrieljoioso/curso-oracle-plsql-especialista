-- Criando um PLSQL RECORD utilizando o atributo %ROWTYPE

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o ID do empregado: '
DECLARE
employee_record     employees%rowtype;
vEmployee_id        employees.employee_id%type := &pemployee_id;  
BEGIN
SELECT  *
INTO    employee_record
FROM    employees
WHERE   employee_id = &pemployee_id;
DBMS_OUTPUT.PUT_LINE(employee_record.employee_id || ' - ' || 
                      employee_record.first_name || ' - ' ||
                      employee_record.last_name || ' - ' ||
                      employee_record.phone_number || ' - ' ||
                      employee_record.job_id);
END;