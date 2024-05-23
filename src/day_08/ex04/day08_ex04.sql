--Session #1
begin;
set transaction isolation level serializable;
select * from pizzeria where pizzeria.name ='Pizza Hut';
select * from pizzeria where pizzeria.name ='Pizza Hut';
commit;
select * from pizzeria where pizzeria.name ='Pizza Hut';

--Session #2
begin;
set transaction isolation level serializable;
update pizzeria set rating = 3.0 where pizzeria.name ='Pizza Hut';
commit;
select * from pizzeria where pizzeria.name ='Pizza Hut';