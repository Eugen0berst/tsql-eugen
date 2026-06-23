CREATE TABLE mein_test1 (nummer INT, vorname VARCHAR(10));
INSERT INTO mein_test1 VALUES
(1, 'Karl'),
(2, 'Klara');

SELECT * FROM mein_test1;

SELECT vorname FROM mein_test1;

SELECT nummer FROM mein_test1;

INSERT INTO mein_test1 (vorname) VALUES ('Jenny'), ('Johnny');

INSERT INTO mein_test1 (vorname, nummer) VALUES
('Fred', 24), ('Mike' ,25);

CREATE TABLE mein_test2 (nummer INT, vorname VARCHAR(10));

delete from mein_test1
where vorname = 'Fred';

delete from mein_test1 where nummer is NULL;

SELECT * FROM mein_test1;

delete from mein_test1 where nummer = 1;

delete mein_test1;

drop table  mein_test1;

CREATE TABLE mein_test1 (nummer INT, vorname VARCHAR(10));

CREATE TABLE mein_test2 (nummer INT, vorname VARCHAR(10));

sp_rename 'mein_test_3', 'mein_test3';

SELECT * FROM mein_test1;

SELECT column_name, data_type, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'mein_test1';

CREATE TABLE mein_test1 (
id INT IDENTITY(1,1) PRIMARY KEY,  --CONSTRAINTS
vorname VARCHAR(20)
);

SELECT name FROM sys.key_constraints;

CREATE TABLE mein_test8 (
id INT IDENTITY(1,1),
vorname VARCHAR(20),
nachname VARCHAR(20),
email VARCHAR(100),
CONSTRAINT PK_test8_id PRIMARY KEY (id),
CONSTRAINT UQ_test8_email UNIQUE (email),
CONSTRAINT UQ_test8_vname_nname UNIQUE (vorname, nachname)
);

SELECT * FROM sys.foreign_keys;