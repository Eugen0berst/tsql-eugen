--Bitte erstellen Sie eine Kopie der kompletten Tabelle interpret.
--Die neue Tabelle soll Kuenstler heißen

select * from interpret;

select * into kuenstler from interpret;

select name into kuenstler_2 from interpret; --nur für Test

select * from kuenstler_2;

--Eine weitere Kopie soll kuenstlername heißen. 
--Dahinein gehören nur die Inhalte der Spalte name.
--Diese Spalte in kuenstlernamen soll k_name heißen.


select column_name, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
from INFORMATION_SCHEMA. COLUMNS
where TABLE_NAME = 'interpret';

create table kuenstlernamen (
k_namen varchar(200)
);

insert into kuenstlernamen
select name from interpret;
select * from kuenstlernamen;

select name k_namen into kuenstlernamen_2 from interpret;
select * from kuenstlernamen_2;

-- 3. Bitte loschen Sie aus der Tabelle kuenstler die Person mit der i_id 6
delete from kuenstler where i_id = 6;

select * from kuenstler

-- 4. Nun muss 'Adele' weg
delete from kuenstler where name = 'adele';

-- 5. Löschen Sie jetzt bitte den kompletten
-- Inhalt der Tabelle kuenstlernamen. Kontrollieren Sie.
truncate table kuenstlernamen;
delete kuenstlernamen;
select * from kuenstlernamen;


-- 6. Und nun ganz weg mit der Tabelle kuenstlernamen
drop table if exists kuenstlernamen;
drop table kuenstlernamen;

select * from kuenstlernamen_2;

-- 7. Als letztes loschen Sie bitte nun auch die Tabelle kuenstler komplett.
-- Nicht nur den Inhalt, sondern die ganze Tabelle

drop table if exists kuenstler;
drop table if exists kuenstler_2;
select * from kuenstler_1;


select * from INFORMATION_SCHEMA. TABLES

drop table if exists kuenstlernamen_2;





-- 8. Bitte lassen Sie alle Nachnamen und Vornamen der Mitarbeiter ausgeben,
-- samt der Abteilung in welcher Sie arbeiten.
-- Sortiert nach abtbez, nname und vname. Gerne mit hubschen Überschriften.

select ma. vname Vorname, ma. nname Nachname, abt.abtbez Abteilung
from mitarbeiter ma
join abteilung abt on ma.abt_nr = abt.abtnr
order by abt.abtbez, ma.nname, ma. vname;


-- 9. Wie oben, aber nur von den Mitarbeitern
-- die in Teilzeit arbeiten.

select ma. vname Vorname, ma. nname Nachname, abt.abtbez Abteilung
from mitarbeiter ma
join abteilung abt on ma.abt_nr = abt.abtnr
join arbeitszeitmodell azm on azm.modell_code = ma.azm_id
where azm.az_bez = 'Teilzeit'
order by abt. abtbez, ma. nname, ma. vname

