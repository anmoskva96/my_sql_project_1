CREATE VIEW V_PERSONS_FEMALE AS
SELECT *
FROM PERSON
WHERE GENDER = 'female';

CREATE VIEW V_PERSONS_MALE AS
SELECT *
FROM PERSON
WHERE GENDER = 'male';