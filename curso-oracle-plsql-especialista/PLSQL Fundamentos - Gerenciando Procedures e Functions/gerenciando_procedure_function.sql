-- Gerenciando Procedures e Functions

DESC USER_OBJECTS

SELECT  object_name, object_type, last_ddl_time, timestamp, status
FROM    user_objects
WHERE   object_type IN ('PROCEDURE', 'FUNCTION');

SELECT  object_name, object_type, last_ddl_time, timestamp, status
FROM    all_objects
WHERE   object_type IN ('PROCEDURE', 'FUNCTION');

-- Consultando objetos inválidos do schema do seu usuario

DESC USER_OBJECTS

SELECT  object_name, object_type, last_ddl_time, timestamp, status
FROM    user_objects
WHERE   status = 'INVALID'

-- Consultando o código Fonte de Procedures e Functions do seu usuário

DESC USER_SOURCE

SELECT  line, text
FROM    user_source
WHERE   name = 'PRC_INSERE_EMPREGADO' AND
        type = 'PROCEDURE'
ORDER BY LINE;

-- Consultando lista de parametros de Procedures e funcoes

DESC PRC_INSERE_EMPREGADO

DESC FNC_CONSULTA_SALARIO_EMPREGADO
