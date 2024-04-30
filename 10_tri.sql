CREATE TABLE emp (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary NUMERIC(10, 2)
);

INSERT INTO emp (name, salary) VALUES ('John', 5000.00), ('Alice', 6000.00), ('Bob', 5500.00);
select * from emp;

CREATE OR REPLACE FUNCTION emp_restrictions()
RETURNS TRIGGER AS $$
BEGIN
    RAISE EXCEPTION 'You are not allowed to perform this operation on emp table';
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER restrict_emp_operations
BEFORE INSERT OR UPDATE OR DELETE ON emp
FOR EACH ROW
EXECUTE FUNCTION emp_restrictions();

CREATE OR REPLACE FUNCTION emp_log()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Data manipulation performed on emp table at %', now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Query the pg_proc table to retrieve the definitions of the functions
SELECT proname AS function_name, pg_get_functiondef(oid) AS function_definition
FROM pg_proc
WHERE proname IN ('emp_restrictions', 'emp_log');


CREATE OR REPLACE FUNCTION emp_log()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Data manipulation performed on emp table at %', now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_emp_operations
AFTER INSERT OR UPDATE OR DELETE ON emp
FOR EACH ROW
EXECUTE FUNCTION emp_log();


