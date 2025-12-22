-- Utilizando parametros tipo IN OUT na procedure

CREATE OR REPLACE PROCEDURE PRC_CONSULTA_EMPREGADO
    (pemployee_id   IN NUMBER,
     pFirst_name    OUT VARCHAR2,
     pLast_name     OUT VARCHAR2,
     pEmail         OUT VARCHAR2,
     pPhone_number  OUT VARCHAR2,
     pHire_date     OUT DATE,
     pJob_id        OUT VARCHAR2,
     pSalary        OUT NUMBER,
     pCommission_pct OUT NUMBER,
     pManager_id    OUT NUMBER,
     pDepartment_id OUT NUMBER)
IS
BEGIN
    SELECT
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
    INTO
        pFirst_name,
        pLast_name,
        pEmail,
        pPhone_number,
        pHire_date,
        pJob_id,
        pSalary,
        pCommission_pct,
        pManager_id,
        pDepartment_id
    FROM employees
    WHERE employee_id = pemployee_id;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Empregado não localizado: ' || pemployee_id);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle' || SQLCODE || SQLERRM);
END;


-- Executando procedure parametro do tipo OUT
SET SERVEROUT ON
SET VERIFY OFF
DECLARE
    employees_record    employees%ROWTYPE;
BEGIN   
    PRC_CONSULTA_EMPREGADO(100, employees_record.first_name, employees_record.last_name, employees_record.email,
    employees_record.phone_number, employees_record.hire_date, employees_record.job_id, employees_record.salary,
    employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);
    DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' ' ||
                  employees_record.last_name || ' - ' ||
                  employees_record.department_id || ' - ' ||
                  employees_record.job_id || ' - ' ||
                  employees_record.phone_number || ' - ' ||
                  LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99'))); -- LTRIM elimina o espaço em branco a esquerda
END;


-- Utilizando parametros tipo OUT com opção NOCOPY

CREATE OR REPLACE PROCEDURE PRC_CONSULTA_EMPREGADO
    (pemployee_id   IN NUMBER,
     pFirst_name    OUT NOCOPY VARCHAR2,
     pLast_name     OUT NOCOPY VARCHAR2,
     pEmail         OUT NOCOPY VARCHAR2,
     pPhone_number  OUT NOCOPY VARCHAR2,
     pHire_date     OUT NOCOPY DATE,
     pJob_id        OUT NOCOPY VARCHAR2,
     pSalary        OUT NOCOPY NUMBER,
     pCommission_pct OUT NOCOPY NUMBER,
     pManager_id    OUT NOCOPY NUMBER,
     pDepartment_id OUT NOCOPY NUMBER)
IS
BEGIN
    SELECT
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
    INTO
        pFirst_name,
        pLast_name,
        pEmail,
        pPhone_number,
        pHire_date,
        pJob_id,
        pSalary,
        pCommission_pct,
        pManager_id,
        pDepartment_id
    FROM employees
    WHERE employee_id = pemployee_id;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Empregado não localizado: ' || pemployee_id);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle' || SQLCODE || SQLERRM);
END;


-- Executando procedure parametro do tipo OUT
SET SERVEROUT ON
SET VERIFY OFF
DECLARE
    employees_record    employees%ROWTYPE;
BEGIN   
    PRC_CONSULTA_EMPREGADO(100, employees_record.first_name, employees_record.last_name, employees_record.email,
    employees_record.phone_number, employees_record.hire_date, employees_record.job_id, employees_record.salary,
    employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);
    DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' ' ||
                  employees_record.last_name || ' - ' ||
                  employees_record.department_id || ' - ' ||
                  employees_record.job_id || ' - ' ||
                  employees_record.phone_number || ' - ' ||
                  LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99'))); -- LTRIM elimina o espaço em branco a esquerda
END;

    
    
