SELECT GENERATED_DATE AS MISSING_DATE
FROM V_GENERATED_DATES
EXCEPT
SELECT VISIT_DATE
FROM PERSON_VISITS
ORDER BY MISSING_DATE