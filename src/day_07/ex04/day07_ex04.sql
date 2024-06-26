SELECT PERSON.NAME, (COUNT(PERSON_VISITS.PERSON_ID)) AS COUNT_OF_VISITS
FROM PERSON_VISITS
JOIN PERSON ON PERSON.ID = PERSON_VISITS.PERSON_ID
GROUP BY PERSON.NAME
HAVING COUNT(PERSON_VISITS.PERSON_ID) > 3