--select 
-- sum(gehalt), -- Alle Einträge bei gehalt werden aufsummiert 
-- avg(gehalt), -- Der Durchschnitt über alle Gehälter wird ermittelt 
-- min(gehalt), -- Das niedrigste Gehalt 
-- max(gehalt), -- Das höchste Gehalt 
-- count(*)  -- Anzahl Zeilen in der Tabelle (alle, auch die mit null) 
--from personal;

use ma_familien;

select * from menschlein;

select count(*) Menschen from menschlein;

select count(vname) Vornamen from menschlein;

select count(fid) Familienstand from menschlein;

select count(*) from menschlein where fid is null;

select vname, count(fid) Familienstand from menschlein
group by vname;

use mitarbeiter_ub1;

-- Count zählt Datensätze.
-- Count(*) zählt alle Datensätze,
-- count(geschlecht) zählt alle Datensätze, welche bei geschlecht einen Eintrag haben

--Grüppchenbildung mittels group by

select count(abt.abtbez)
from mitarbeiter ma 
join abteilung abt on ma.abt_nr = abt.abtnr;

select count(*)
from mitarbeiter ma 
join abteilung abt on ma.abt_nr = abt.abtnr;

select ma.nname, abt.abtbez
from mitarbeiter ma 
join abteilung abt on ma.abt_nr = abt.abtnr;

INSERT INTO mitarbeiter  VALUES 
('Wagner', 'Robert', 'Bachstr. 7', '90768', 'Fuerth', '1975-12-04', NULL, NULL, NULL);

select count(abt.abtbez)
from mitarbeiter ma left join abteilung abt on ma.abt_nr = abt.abtnr;

select *
from mitarbeiter ma join abteilung abt on ma.abt_nr = abt.abtnr;

select count(*)
from mitarbeiter ma 
left join abteilung abt on ma.abt_nr = abt.abtnr;

select ma.nname, abt.abtbez
from mitarbeiter ma
join abteilung abt on ma.abt_nr = abt.abtnr;

select abt.abtbez, count(*) 'MA in der Abteilung'
from mitarbeiter ma
join abteilung abt on ma.abt_nr = abt.abtnr
group by abt.abtbez;

select abt.abtnr, abt.abtbez, count(*) 'MA in der Abteilung'
from mitarbeiter ma
join abteilung abt on ma.abt_nr = abt.abtnr
group by abt.abtbez, abt.abtnr;

-- Nun mochte ich wissen, wie viele Mitarbeiter wir pro Familienstand gespeichert haben.

select f. fam_bez, count(*)
from mitarbeiter ma
join familienstand f on f.f_id = ma.f_id
group by f.fam_bez;

-- HAVING

-- Abteilungen mit mehr als 3 Mitarbeiter:
select abt.abtnr, abtbez, count(*)
from mitarbeiter ma
join abteilung abt on abt.abtnr = ma.abt_nr
group by abt.abtnr, abtbez
HAVING count(*) > 3;

-- Jetzt mochten wir noch wissen welche Familienstande, acht-Mal oder mehr angegeben wurden

select f.fam_bez, count(*) 'anz ma'
from mitarbeiter ma
join familienstand f on f.f_id = ma.f_id
group by f.fam_bez
HAVING count(*) > 7;

-- oder so kann man das auch sehen

select f. fam_bez
from mitarbeiter ma
join familienstand f on f.f_id = ma.f_id
group by f. fam_bez
having count(*) >= 8;

-- Hier wollten wir nur die Anzahl der Mitarbeiter aus den Abteilungen IT und Logistik.

select abt.abtbez, count(*)
from mitarbeiter ma
join abteilung abt on abt.abtnr = ma.abt_nr
where abt.abtbez in ('IT', 'Logistik')
group by abt.abtbez;

select abt.abtbez, count(*)
from mitarbeiter ma
join abteilung abt on abt.abtnr = ma.abt_nr
group by abt. abtbez
having abt.abtbez in ('IT', 'Logistik') -- nicht so gut, aber passt auch.

-- Anzahl der MA pro Abteilung (AbtNr und Bezeichnung) fur die Abteilungen mit mehr als 3 MA.
-- ABC nach Abteilung sortieren.

select abt.abtnr, abt.abtbez, count(*) 'Anz. MA pro Abt.'
from mitarbeiter ma
join abteilung abt on abt.abtnr = ma.abt_nr
group by abt.abtnr, abt.abtbez
HAVING count(*) > 3
order by abt.abtbez ASC;

-- Anzahl der MA pro Abteilung (AbtNr und Bezeichnung) fur die Abteilungen mit mehr als 3 MA.
-- Absteigend nach Anzahl der MA sortieren (Zuerst Abteilungen mit der großten Anzahl der MA)

select abt.abtnr, abt.abtbez, count(*) 'Anz. MA pro Abt.'
from mitarbeiter ma
join abteilung abt on abt.abtnr = ma.abt_nr
group by abt.abtnr, abt.abtbez
HAVING count(*) > 3
order by [Anz. MA pro Abt.] DESC;

select * from mitarbeiter



use test_db_1

create table aggregat_test(zahl integer);

insert into aggregat_test values
(12), (127), (287), (2), (100), (null);

select * from aggregat_test;

select count(*) from aggregat_test;
select count(zahl) from aggregat_test;
select avg(zahl) from aggregat_test;
select sum(zahl)/count(zahl) from aggregat_test
select min(zahl) from aggregat_test;
select max(zahl) from aggregat_test;
select sum(zahl) from aggregat_test;



use mitarbeiter_ub1;


select f. fam_bez, count(*) Anzahl
from mitarbeiter ma
join familienstand f on f.f_id = ma.f_id
group by f. fam_bez

-- oder so können wir maximale Anzahl abfragen in dem wir unten unserer Tabelle
-- die Name "temp" geben, und oben noch ein select hinzufügen mit maximale abfrage.

select max(temp. Anzahl) as 'Max Anzahl pro Fam. Stand'
from
(
select f. fam_bez, count(*) as Anzahl
from mitarbeiter ma
join familienstand f on f.f_id = ma.f_id
group by f. fam_bez
) as temp



use test_db_1;

select * from aggregat_test;

-- Zeigt erster Wert:
select top 1 zahl
from aggregat_test;

-- Zeigt erste 3 Werte:
select top 3 zahl
from aggregat_test;

-- Zeigt 3 kleinste Werte:
select top 3 zahl from aggregat_test
where zahl is not null
order by zahl;

insert into aggregat_test values (12);

select * from aggregat_test;

select top 3 zahl from aggregat_test
order by zahl;

select top 3 with ties zahl from aggregat_test
order by zahl

select top 3 zahl from aggregat_test
order by zahl desc;

insert into aggregat_test values (100);

select top 3 zahl from aggregat_test
order by zahl desc;

select top 4 with ties zahl from aggregat_test
order by zahl desc;

select * from aggregat_test

insert into aggregat_test values (287);