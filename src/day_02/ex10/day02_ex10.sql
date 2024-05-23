WITH TABLE_ALL AS
	(SELECT NAME, ADDRESS, ID
	FROM PERSON)
SELECT PERSON.NAME AS PERSON_NAME1,
	TABLE_ALL.NAME AS PERSON_NAME2,
	PERSON.ADDRESS AS COMMON_ADDRESS
FROM PERSON
JOIN TABLE_ALL ON TABLE_ALL.ADDRESS = PERSON.ADDRESS
WHERE PERSON.NAME != TABLE_ALL.NAME AND PERSON.ID > TABLE_ALL.ID