CREATE OR REPLACE FUNCTION FNC_PERSONS_FEMALE()
RETURNS TABLE (ID bigint, NAME varchar, AGE integer, GENDER varchar, ADDRESS varchar)AS $$
select * from person where gender = 'female'
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION FNC_PERSONS_MALE()
RETURNS TABLE (ID bigint, NAME varchar, AGE integer, GENDER varchar, ADDRESS varchar)AS $$
select * from person where gender = 'male'
$$ LANGUAGE SQL;

SELECT * FROM FNC_PERSONS_MALE();

SELECT * FROM FNC_PERSONS_FEMALE();