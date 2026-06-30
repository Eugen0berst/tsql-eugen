-- 1. Welche Interpreten enthalten an beliebiger Stelle ein e und enden auf s
select i.name from interpret i
where name like '%e%s';


-- 2. Welche Titel wurden bereits in Vegas oder Fuerth gespielt,
--    sortieren Sie bitte nach Titel aufsteigend

select t.titel, iv.datum_von, iv.datum_bis, ort.ort_name
from titel t
join interpret i on i.i_id = t.interpret_id
join in_ver iv on iv.i_nr = i.i_id
join veranstaltungsort ort on ort.v_id = iv. v_nr
where ort. ort_name in ('Vegas', 'Fuerth')
and iv.datum_bis < getdate()
order by t.titel;


-- 3. Welche Titel enthalten kein a

select titel from titel
where titel not like '%a%';

-- 4. Kontrollieren Sie, wann Adele und/oder Miles Davis
--    nach dem 30.06.2026 gebucht sind

set dateformat dmy;
select i. name, iv.datum_von, iv.datum_bis
from interpret i
join in_ver iv on iv.i_nr = i.i_id
where i.name in ('Adele', 'Miles Davis')
and iv.datum_bis > '30.06.2026'

select getdate() Datum;

select format(getdate(), 'dd MM yyyy') as Heute;
select format(getdate(), 'dd MMMM yyyy') as Heute;

select year(getdate())

select datename(year, getdate()) Jahr,
datename(month, getdate()) Monat,
datename(day, getdate()) Tag,
datename(week, getdate()) Woche,
datename(weekday, getdate()) Wochentag,
datename(hour, getdate()) Uhr,
datename(minute, getdate()) Minute,
datename(second, getdate()) Sekunde,
datename(millisecond, getdate()) Milli,
datename(MICROSECOND, getdate()) Mikro;