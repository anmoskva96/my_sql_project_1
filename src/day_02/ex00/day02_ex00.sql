SELECT P.NAME, P.RATING
FROM PIZZERIA P
LEFT JOIN PERSON_VISITS PV ON P.ID = PV.PIZZERIA_ID
WHERE PV.PIZZERIA_ID IS NULL