CREATE OR REPLACE FUNCTION FNC_TRG_PERSON_UPDATE_AUDIT() RETURNS TRIGGER AS $trg_person_update_audit$
begin
insert into person_audit (created, type_event, row_id, name, age, gender, address)
values (current_timestamp, 'U', old.id, old.name, old.age, old. gender, old.address);
return old;
end;
$trg_person_update_audit$
LANGUAGE PLPGSQL;

CREATE TRIGGER TRG_PERSON_UPDATE_AUDIT AFTER
UPDATE ON PERSON
FOR EACH ROW EXECUTE FUNCTION FNC_TRG_PERSON_UPDATE_AUDIT();

UPDATE PERSON SET NAME = 'Bulat' WHERE ID = 10;
UPDATE PERSON SET NAME = 'Damir' WHERE ID = 10;
SELECT * FROM PERSON_AUDIT;