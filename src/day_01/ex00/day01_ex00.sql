SELECT ID AS OBJECT_ID,
	PIZZA_NAME AS OBJECT_NAME
FROM MENU
UNION
SELECT ID,
	NAME
FROM PERSON
ORDER BY 1,2