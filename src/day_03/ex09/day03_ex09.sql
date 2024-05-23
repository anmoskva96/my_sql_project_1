INSERT INTO PERSON_VISITS
VALUES ((SELECT (MAX(PERSON_VISITS.ID) + 1) FROM PERSON_VISITS),
 (SELECT ID FROM PERSON WHERE NAME = 'Denis'),
 (SELECT DISTINCT PERSON_VISITS.PIZZERIA_ID 
  FROM PERSON_VISITS 
  JOIN PIZZERIA ON PIZZERIA.ID = PERSON_VISITS.PIZZERIA_ID 
  WHERE PIZZERIA.NAME = 'Dominos' ),
 ('2022-02-24'::date)),
 ((SELECT (MAX(PERSON_VISITS.ID) + 2) FROM PERSON_VISITS),
 (SELECT ID FROM PERSON WHERE NAME = 'Irina'),
 (SELECT DISTINCT PERSON_VISITS.PIZZERIA_ID 
  FROM PERSON_VISITS 
  JOIN PIZZERIA ON PIZZERIA.ID = PERSON_VISITS.PIZZERIA_ID 
  WHERE PIZZERIA.NAME = 'Dominos' ),
 ('2022-02-24'::date))