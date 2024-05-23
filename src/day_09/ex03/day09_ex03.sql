DROP TRIGGER TRG_PERSON_INSERT_AUDIT ON PERSON;
DROP TRIGGER TRG_PERSON_UPDATE_AUDIT ON PERSON;
DROP TRIGGER TRG_PERSON_DELETE_AUDIT ON PERSON;
DROP FUNCTION FNC_TRG_PERSON_INSERT_AUDIT() CASCADE;
DROP FUNCTION FNC_TRG_PERSON_UPDATE_AUDIT() CASCADE;
DROP FUNCTION FNC_TRG_PERSON_DELETE_AUDIT() CASCADE;
TRUNCATE PERSON_AUDIT;

CREATE OR REPLACE FUNCTION FNC_TRG_PERSON_AUDIT()
RETURNS TRIGGER AS $trg_person_audit$
BEGIN
IF (TG_OP = 'INSERT') then
begin
insert into person_audit (row_id, name, age, gender, address)
values (new.id, new.name, new.age, new.gender, new.address);
return new;
end;
ELSIF (TG_OP = 'UPDATE') THEN
begin
insert into person_audit (created, type_event, row_id, name, age, gender, address)
values (current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address);
return old;
end;
ELSIF (TG_OP = 'DELETE') THEN
begin
insert into person_audit (created, type_event, row_id, name, age, gender, address)
values (current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address);
return old;
end;
END IF;
RETURN NULL;
END;
$trg_person_audit$
LANGUAGE PLPGSQL;

CREATE TRIGGER TRG_PERSON_AUDIT AFTER
INSERT
OR
UPDATE
OR
DELETE ON PERSON
FOR EACH ROW EXECUTE FUNCTION FNC_TRG_PERSON_AUDIT();

INSERT INTO PERSON(ID, NAME, AGE, GENDER, ADDRESS)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE PERSON SET NAME = 'Bulat' WHERE ID = 10;
UPDATE PERSON SET NAME = 'Damir' WHERE ID = 10;
DELETE FROM PERSON WHERE ID = 10;

SELECT * FROM PERSON_AUDIT;
