--Session #1
begin;
transaction isolation level read committed;
select * from pizzeria where pizzeria.name ='Pizza Hut';
update pizzeria  set rating = 4 where pizzeria.name ='Pizza Hut';
commit;
select * from pizzeria where pizzeria.name ='Pizza Hut';

--Session #2
begin;
transaction isolation level read committed;
select * from pizzeria where pizzeria.name ='Pizza Hut';
update pizzeria set rating = 3.6 where pizzeria.name ='Pizza Hut';
commit;
select * from pizzeria where pizzeria.name ='Pizza Hut';