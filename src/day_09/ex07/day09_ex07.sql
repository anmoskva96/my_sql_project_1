CREATE OR REPLACE FUNCTION FUNC_MINIMUM (VARIADIC ARR float[]) RETURNS float AS $$
select min($1[i])from generate_subscripts($1, 1) g(i);
$$ LANGUAGE SQL;

SELECT FUNC_MINIMUM(VARIADIC ARR => ARRAY[10.0, -1.0, 5.0, 4.4]);