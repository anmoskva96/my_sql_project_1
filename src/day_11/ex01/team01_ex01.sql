WITH MainTab AS (
    SELECT *
    FROM balance b
        INNER JOIN ( SELECT DISTINCT(c.id),
                c.name AS currency_name
                FROM Currency c
            ) AS c 
            ON c.id = b.currency_id
        LEFT JOIN public.user as u
        ON u.id = b.user_id
)
SELECT
    coalesce(name, '<not defined>') AS name
    , coalesce(lastname, '<not defined>') AS lastname
    , currency_name
    , money * coalesce((
        SELECT rate_to_usd
        FROM currency as c
        WHERE c.id = m.currency_id
          AND c.updated < m.updated
        ORDER BY c.updated DESC LIMIT 1
        ),(
        SELECT rate_to_usd
        FROM currency as c
        WHERE c.id = m.currency_id
          AND c.updated > m.updated
        ORDER BY c.updated ASC LIMIT 1
        )) AS currency_in_usd
FROM MainTab as m
order by 1 desc, 2, 3;