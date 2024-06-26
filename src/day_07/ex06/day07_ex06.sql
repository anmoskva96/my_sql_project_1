SELECT NAME, COUNT(PRICE) AS COUNT_OF_ORDERS,
	ROUND(AVG(PRICE::numeric), 2)AS AVERAGE_PRICE,
	MAX(PRICE) AS MAX_PRICE,
	MIN(PRICE) AS MIN_PRICE
FROM PERSON_ORDER
JOIN MENU ON MENU.ID = PERSON_ORDER.MENU_ID
JOIN PIZZERIA ON PIZZERIA.ID = MENU.PIZZERIA_ID
GROUP BY PIZZERIA.NAME
ORDER BY 1