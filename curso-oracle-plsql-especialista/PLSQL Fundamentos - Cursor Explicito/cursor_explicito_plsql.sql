-- Cursor - Controlando Cursor explicito com LOOP basico

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor IS
    SELECT *
    FROM employees; -- Declaracao do cursor
    
    employees_record employees_cursor%rowtype; -- baseado na estrutura do cursor, ou seja, terá as colunas do select do cursor
BEGIN
    /* Inicializa */
    
    OPEN employees_cursor; -- Abrindo cursor e executando o select colocando as linhas na memoria oracle
    
    LOOP
        FETCH   employees_cursor
        INTO    employees_record; -- fetch do cursor --> inclui todas as colunas de employees no record
        
        EXIT WHEN employees_cursor%notfound;
        
        DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' || 
                  employees_record.first_name || ' - ' ||
                  employees_record.last_name || ' - ' ||
                  employees_record.department_id || ' - ' ||
                  employees_record.job_id || ' - ' ||
                  employees_record.phone_number || ' - ' ||
                  LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99'))); -- LTRIM elimina o espaço em branco a esquerda
    END LOOP;
    
    CLOSE employees_cursor;
    
END;


-- Cursor - Controlando Cursor explicito com WHILE LOOP

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
    CURSOR employees_cursor IS
    SELECT *
    FROM employees; -- Declaracao do cursor
    employees_record employees_cursor%rowtype; -- baseado na estrutura do cursor, ou seja, terá as colunas do select do cursor
BEGIN
    /* Inicializa */
    
    OPEN employees_cursor; -- Abrindo cursor e executando o select colocando as linhas na memoria oracle
    
    FETCH   employees_cursor
        INTO    employees_record; -- fetch do cursor --> inclui todas as colunas de employees no record
        
        
    WHILE employees_cursor%found LOOP
        DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' || 
                  employees_record.first_name || ' - ' ||
                  employees_record.last_name || ' - ' ||
                  employees_record.department_id || ' - ' ||
                  employees_record.job_id || ' - ' ||
                  employees_record.phone_number || ' - ' ||
                  LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99'))); -- LTRIM elimina o espaço em branco a esquerda
        
        FETCH employees_cursor
            INTO employees_record;
    END LOOP;
    
    CLOSE employees_cursor;  
END;