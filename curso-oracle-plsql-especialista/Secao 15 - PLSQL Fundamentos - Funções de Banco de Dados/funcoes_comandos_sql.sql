-- Utilizando Funções em comandos SQL

CREATE OR REPLACE FUNCTION FNC_CONSULTA_TITULO_CARGO_EMPREGADO
    (pjob_id   IN jobs.job_id%TYPE)
     RETURN VARCHAR2 
IS
    vJob_title     jobs.job_title%TYPE;
BEGIN
    SELECT  job_title
    INTO    vJob_title
    FROM    jobs
    WHERE   job_id = pjob_id;
    RETURN  (vJob_title);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Job inexistente: ' || vJob_title);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle' || SQLCODE || ' - '|| SQLERRM);
END;

-- Utilizando funções em comandos SQL

SELECT first_name, last_name, job_id, FNC_CONULTA_TITULO_CARGO_EMPREGADO(job_id) "JOB TITLE"
FROM employees;

-- Executando a função pelo comando SELECT

SELECT FNC_CONULTA_TITULO_CARGO_EMPREGADO('IT_PROG')
FROM dual;

-- Executando a função pelo comando SELECT

SELECT FNC_CONULTA_SALARIO_EMPREGADO(130)
FROM dual;