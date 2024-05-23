WITH PIZZERIAS AS
	(SELECT PIZZERIA.NAME AS PIZZERIA_NAME,
			PIZZERIA.ID AS PIZZERIA_ID,
			PIZZA_NAME,
			PRICE
		FROM MENU
		JOIN PIZZERIA ON PIZZERIA.ID = MENU.PIZZERIA_ID)
SELECT PIZZERIAS_1.PIZZA_NAME,
	PIZZERIAS_1.PIZZERIA_NAME AS PIZZERIA_NAME_1,
	PIZZERIAS.PIZZERIA_NAME AS PIZZERIA_NAME_2,
	PIZZERIAS_1.PRICE
FROM PIZZERIAS AS PIZZERIAS_1
JOIN PIZZERIAS ON PIZZERIAS_1.PRICE = PIZZERIAS.PRICE
AND PIZZERIAS_1.PIZZA_NAME = PIZZERIAS.PIZZA_NAME
WHERE PIZZERIAS_1.PIZZERIA_ID != PIZZERIAS.PIZZERIA_ID
	AND PIZZERIAS_1.PIZZERIA_ID > PIZZERIAS.PIZZERIA_ID
ORDER BY PIZZERIAS_1.PIZZA_NAME