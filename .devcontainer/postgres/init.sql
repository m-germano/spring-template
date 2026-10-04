-- ============================================================
-- Inicialização padrão do PostgreSQL para os projetos Spring
-- ============================================================

-- ------------------------------------------------------------
-- 1. Cria o usuário usado pela aplicação Spring
-- ------------------------------------------------------------

DO
$$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_catalog.pg_roles
        WHERE rolname = 'spring'
    ) THEN
        CREATE ROLE spring
            LOGIN
            PASSWORD 'pass123';
    END IF;
END
$$;


-- ------------------------------------------------------------
-- 2. Permite conexão ao banco
-- ------------------------------------------------------------

GRANT CONNECT
ON DATABASE postgres
TO spring;


-- ------------------------------------------------------------
-- 3. Permite utilizar o schema public
-- ------------------------------------------------------------

GRANT USAGE
ON SCHEMA public
TO spring;


-- ------------------------------------------------------------
-- 4. Permissões em tabelas QUE JÁ EXISTIREM
-- ------------------------------------------------------------

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO spring;


-- ------------------------------------------------------------
-- 5. Permissões em sequences QUE JÁ EXISTIREM
--
-- Necessário para IDs que utilizam sequence/serial/identity
-- dependendo da estratégia usada.
-- ------------------------------------------------------------

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO spring;


-- ------------------------------------------------------------
-- 6. Permissões AUTOMÁTICAS em tabelas criadas futuramente
-- pelo usuário postgres.
--
-- Essa parte é a que estava faltando nos comandos manuais.
-- ------------------------------------------------------------

ALTER DEFAULT PRIVILEGES
FOR ROLE postgres
IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLES
TO spring;


-- ------------------------------------------------------------
-- 7. Permissões AUTOMÁTICAS em sequences criadas futuramente
-- pelo usuário postgres.
-- ------------------------------------------------------------

ALTER DEFAULT PRIVILEGES
FOR ROLE postgres
IN SCHEMA public
GRANT USAGE, SELECT
ON SEQUENCES
TO spring;