CREATE OR REPLACE FUNCTION FNC_TRG_PERSON_DELETE_AUDIT() RETURNS TRIGGER AS $trg_person_delete_audit$
begin
insert into person_audit (created, type_event, row_id, name, age, gender, address)
values (current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address);
return old;
end;
$trg_person_delete_audit$
LANGUAGE PLPGSQL;

CREATE TRIGGER TRG_PERSON_DELETE_AUDIT
AFTER DELETE ON PERSON
FOR EACH ROW EXECUTE FUNCTION FNC_TRG_PERSON_DELETE_AUDIT();

DELETE FROM PERSON WHERE ID = 10;
SELECT * FROM PERSON_AUDIT;