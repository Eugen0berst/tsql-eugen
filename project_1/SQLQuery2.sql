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