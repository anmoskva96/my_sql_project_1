CREATE OR REPLACE FUNCTION FNC_FIBONACCI(PSTOP integer DEFAULT 10) RETURNS
SETOF integer LANGUAGE SQL AS $$
WITH RECURSIVE t(a,b) AS (VALUES(0,1)
UNION ALL
SELECT greatest(a,b), a + b as a from t
WHERE b < $1)
SELECT a FROM t;
$$;

SELECT * FROM FNC_FIBONACCI(100);
SELECT * FROM FNC_FIBONACCI();