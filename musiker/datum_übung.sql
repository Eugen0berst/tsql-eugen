-- 1. Bitte erstellen Sie eine Liste aller Interpreten und deren Titel

select top 0 * from interpret;
select top 0 * from titel;

select i.name, titel.titel
from interpret i
join titel on titel.interpret_id = i.i_id;

-- 2. Welche Titel fallen alle unter das Genre Klassik?
select top 0 * from titel;

select titel. titel, genre.genre
from titel
join genre on titel.genre_id = genre.g_id
where genre.genre = 'Klassik';

-- 3. Bitte uberprufen Sie, ob 'Miles Davis'
-- am 01.07.2027 gebucht werden kann
select top 1 * from in_ver;

select i. name, iv.datum_von, iv.datum_bis
from in_ver iv
join interpret i on i.i_id = iv.i_nr
where i. name = 'Miles Davis'
-- where i.name like 'Miles%'
and '2027-07-01' between iv.datum_von and iv.datum_bis;