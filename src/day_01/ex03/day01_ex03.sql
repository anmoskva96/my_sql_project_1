SELECT ORDER_DATE AS ACTION_DATE, PERSON_ID
FROM PERSON_ORDER INTERSECT ALL
SELECT VISIT_DATE, PERSON_ID
FROM PERSON_VISITS
ORDER BY 1,2 DESC