with BTab as (
        SELECT user_id,
                t.type,
                sum(money) as volume,
                t.currency_id
        FROM (
                        SELECT *
                        from Balance
                        ORDER BY user_id,
                                type,
                                updated DESC
                ) as t
        GROUP BY user_id,
                t.type,
                t.currency_id
), CTab as (
        select Crn.id as currency_id,
                Crn.name as currency_name,
                Crn.updated,
                Crn.rate_to_usd
        from (
                        select DISTINCT(id),
                                name,
                                max(updated) as updated
                        FROM Currency
                        GROUP BY id,
                                name
                ) as c
                join Currency as Crn on Crn.id = c.id
                and c.updated = Crn.updated
)
SELECT 
 coalesce(name,'<not defined>') as name
 , coalesce(lastname,'<not defined>') as lastname
 , type 
 , volume
 , coalesce(currency_name,'<not defined>') as currency_name
 , coalesce(rate_to_usd, 1) as last_rate_to_usd 
 , volume*coalesce(rate_to_usd, 1) as total_volume_in_usd
FROM BTab as bt
        full join public.user as u on bt.user_id = u.id
        full join CTab on CTab.currency_id = bt.currency_id
order by 1 desc,2, 3;