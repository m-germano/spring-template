-- ============================================================
-- Usuário da aplicação Spring
-- ============================================================

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

GRANT CONNECT
ON DATABASE postgres
TO spring;

GRANT USAGE
ON SCHEMA public
TO spring;
