--Session #1
begin;
update pizzeria set rating = 5 where pizzeria.name ='Pizza Hut';
select * from pizzeria where pizzeria.name ='Pizza Hut';
commit;

--Session #2
select * from pizzeria where pizzeria.name ='Pizza Hut';