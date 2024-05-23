CREATE TABLE PERSON_AUDIT (CREATED timestamp WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
						   TYPE_EVENT CHAR(1) DEFAULT 'I' NOT NULL,
						   ROW_ID bigint NOT NULL,
						   NAME varchar, 
						   AGE integer, 
						   GENDER varchar, 
						   ADDRESS varchar);
						   
ALTER TABLE PERSON_AUDIT ADD CONSTRAINT CH_TYPE_EVENT CHECK (TYPE_EVENT IN ('I', 'D','U'));
CREATE OR REPLACE FUNCTION FNC_TRG_PERSON_INSERT_AUDIT()
RETURNS TRIGGER AS $trg_person_insert_audit$
begin
insert into person_audit (row_id, name, age, gender, address)
values (new.id, new.name, new.age, new.gender, new.address);
return new;
end;
$trg_person_insert_audit$
LANGUAGE PLPGSQL;

CREATE TRIGGER TRG_PERSON_INSERT_AUDIT AFTER
INSERT ON PERSON
FOR EACH ROW EXECUTE FUNCTION FNC_TRG_PERSON_INSERT_AUDIT();
INSERT INTO PERSON(ID, NAME, AGE, GENDER, ADDRESS)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM PERSON_AUDIT;