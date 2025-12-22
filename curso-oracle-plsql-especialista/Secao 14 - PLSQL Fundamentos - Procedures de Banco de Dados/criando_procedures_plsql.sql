-- Criando Procedure de Banco de dados

CREATE OR REPLACE PROCEDURE PRC_INSERE_EMPREGADO
    (pFirst_name    IN VARCHAR2,
     pLast_name     IN VARCHAR2,
     pEmail         IN VARCHAR2,
     pPhone_number  IN VARCHAR2,
     pHire_date     IN DATE DEFAULT SYSDATE,
     pJob_id        IN VARCHAR2,
     pSalary        IN NUMBER,
     pCommission_pct IN NUMBER,
     pManager_id    IN NUMBER,
     pDepartment_id IN NUMBER)
IS
    -- Nenhuma variavel declarada
BEGIN
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id )
    VALUES (
        employees_seq.nextval,
        pfirst_name,
        plast_name,
        pemail,
        pphone_number,
        phire_date,
        pjob_id,
        psalary,
        pCommission_pct,
        pmanager_id,
        pdepartment_id );
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle' || SQLCODE || SQLERRM);
END;


--  Executando a Procedure pelo bloco PLSQL
BEGIN
    PRC_INSERE_EMPREGADO('David','Bowie','DBOWIE','515.127.4861',SYSDATE,'IT_PROG',15000,NULL,103,60);
    COMMIT;
END;


-- Consultando empregado adicionado
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME = 'David'
AND LAST_NAME = 'Bowie'


-- Executando a procedure com o comando EXECUTE do SQL PLUS
EXEC PRC_INSERE_EMPREGADO('Greg','Lake','GLAKE','515.127.4961',SYSDATE,'IT_PROG',15000,NULL,103,60)
COMMIT;

-- Consultando empregado adicionado
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME = 'Greg'
AND LAST_NAME = 'Lake'


    