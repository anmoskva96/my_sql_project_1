CREATE UNIQUE INDEX IDX_MENU_UNIQUE ON MENU (PIZZERIA_ID,PIZZA_NAME);

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT PIZZERIA_ID, PIZZA_NAME
FROM MENU
WHERE PIZZERIA_ID > 3 AND PIZZA_NAME = 'cheese pizza';