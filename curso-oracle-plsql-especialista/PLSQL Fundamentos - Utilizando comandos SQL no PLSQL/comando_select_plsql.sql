-- Utilizando o comando SELECT no PLSQL
SET SERVEROUTPUT ON
DECLARE
    vFirst_name     employees.first_name%type;
    vLast_name      employees.last_name%type;
    vSalary         employees.salary%type;
    vEmployee_id    employees.employee_id%type := 121;
BEGIN
    SELECT first_name, last_name, salary
    INTO   vFirst_name, vLast_name, vSalary
    FROM   employees
    WHERE  employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || vEmployee_id);
    DBMS_OUTPUT.PUT_LINE('First Name: ' || vFirst_name);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || vLast_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || vSalary);
END;

-- Exemplo de erro ORA-01403 - NO DATA FOUND
SET SERVEROUTPUT ON
DECLARE
    vFirst_name     employees.first_name%type;
    vLast_name      employees.last_name%type;
    vSalary         employees.salary%type;
    vEmployee_id    employees.employee_id%type := 50;
BEGIN
    SELECT first_name, last_name, salary
    INTO   vFirst_name, vLast_name, vSalary
    FROM   employees
    WHERE  employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || vEmployee_id);
    DBMS_OUTPUT.PUT_LINE('First Name: ' || vFirst_name);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || vLast_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || vSalary);
END;

-- Exemplo usando função de agragação
SET SERVEROUTPUT ON
DECLARE
    vJob_id         employees.job_id%type := 'IT_PROG';
    vAvg_Salary     employees.salary%type;
    vSum_Salary     employees.salary%type;
BEGIN
    SELECT ROUND(AVG(salary), 2), ROUND(SUM(salary), 2)
    INTO   vAvg_Salary, vSum_Salary
    FROM   employees
    WHERE  job_id = vJob_id;
    DBMS_OUTPUT.PUT_LINE('ID do Cargo: ' || vJob_id);
    DBMS_OUTPUT.PUT_LINE('Média de salários: ' || vAvg_Salary);
    DBMS_OUTPUT.PUT_LINE('Soma de salários: ' || vSum_Salary);
END;

-- Exemplo de erro ORA-01422 - Too Many Rows --> SELECT dentro do PLSQL deve sempre retornar 1 linha
SET SERVEROUTPUT ON
DECLARE
    vJob_id         employees.job_id%type;
    vAvg_Salary     employees.salary%type;
    vSum_Salary     employees.salary%type;
BEGIN
    SELECT ROUND(AVG(salary), 2), ROUND(SUM(salary), 2)
    INTO   vAvg_Salary, vSum_Salary
    FROM   employees
    GROUP BY  job_id;
    DBMS_OUTPUT.PUT_LINE('ID do Cargo: ' || vJob_id);
    DBMS_OUTPUT.PUT_LINE('Média de salários: ' || vAvg_Salary);
    DBMS_OUTPUT.PUT_LINE('Soma de salários: ' || vSum_Salary);
END;