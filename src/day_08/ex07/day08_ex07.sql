--Session #1
begin;
update pizzeria set rating = 5.0 where pizzeria.id = 1;
update pizzeria set rating = 5.0 where pizzeria.id = 2;
commit;

--Session #2
begin;
update pizzeria set rating = 5.0 where pizzeria.id = 2;
update pizzeria set rating = 5.0 where pizzeria.id = 1;
commit;