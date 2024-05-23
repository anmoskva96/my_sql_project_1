--Session #1
begin;
set transaction isolation level read committed;
select * from pizzeria where pizzeria.name ='Pizza Hut';
select * from pizzeria where pizzeria.name ='Pizza Hut';
commit;
select * from pizzeria where pizzeria.name ='Pizza Hut';

--Session #2
begin;
set transaction isolation level read committed;
update pizzeria set rating = 3.6 where pizzeria.name ='Pizza Hut';
commit;
select * from pizzeria where pizzeria.name ='Pizza Hut';