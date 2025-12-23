-- Executando o script UTLDTREE

@C:\app\xxxxxx\product\18.0.0\dbhomeXE\rdbms\admin\utldtree.sql  -- removi o usuário no path

-- Executando a procedure DEPTREE_FILL

exec DEPTREE_FILL('TABLE','HR','EMPLOYEES')

-- Utilizando as Visões DEPTREE

DESC deptree

SELECT   *
FROM     deptree
ORDER by seq#


-- Utilizando as Visões IDEPTREE

desc ideptree

SELECT *
FROM ideptree;
