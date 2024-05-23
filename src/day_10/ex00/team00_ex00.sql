SET vars.exercise TO 0;
SET vars.letter_start TO 'a';

CREATE TABLE IF NOT EXISTS path_price(
  point1 varchar NOT NULL
  , point2 varchar NOT NULL
  , cost numeric NOT NULL DEFAULT 0
  , CONSTRAINT uk_points UNIQUE (point1, point2)
);

ALTER TABLE path_price DROP CONSTRAINT IF EXISTS ch_cost;
ALTER TABLE path_price ADD CONSTRAINT ch_cost
	CHECK (COST >= 0);

DELETE FROM  path_price;
INSERT INTO path_price(POINT1, POINT2, COST) VALUES
('a','b', 10),
('a','c', 15),
('a','d', 20),
('b','c', 35),
('b','d', 25),
('c','d', 30);

CREATE OR REPLACE FUNCTION pg_temp.POINT2(in P1 varchar, in P2 varchar, in Prev varchar)
RETURNS varchar AS $$
select	CASE P2
		WHEN Prev	THEN P1
					ELSE P2
		END 
$$ LANGUAGE SQL;

CREATE OR REPLACE RECURSIVE VIEW RecRESULT (POINT2, TOUR, TOTAL_COST) AS
    SELECT	  pg_temp.POINT2(POINT1, POINT2, current_setting('vars.letter_start'))
			, ('{' || current_setting('vars.letter_start')) AS TOUR
			, COST AS TOTAL_COST
    FROM path_price PP
    WHERE current_setting('vars.letter_start') in (POINT1, POINT2)
  UNION ALL
    SELECT	pg_temp.POINT2(path_price.POINT1, path_price.POINT2, RecRESULT.POINT2) 
	        , (RecRESULT.TOUR || ',' || RecRESULT.POINT2 ) AS TOUR
	        , RecRESULT.TOTAL_COST + path_price.COST AS TOTAL_COST
    FROM path_price
        JOIN RecRESULT ON RecRESULT.POINT2  IN (path_price.POINT1, path_price.POINT2)
    WHERE TOUR NOT LIKE ('%' || RecRESULT.POINT2  || '%')
;
with FinalyRes As (
	SELECT	TOTAL_COST
			, (TOUR ||','|| current_setting('vars.letter_start') ||'}') AS TOUR
	FROM    RecRESULT
	WHERE   POINT2 = current_setting('vars.letter_start')
			AND LENGTH(TOUR) = (select max(LENGTH(TOUR)) from RecRESULT)
	order by 1, 2)

select * from FinalyRes
	where current_setting('vars.exercise')::integer = 1 or
	( current_setting('vars.exercise')::integer = 0
	and  TOTAL_COST <= (select min(TOTAL_COST) from FinalyRes));