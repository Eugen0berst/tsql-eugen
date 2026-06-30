select name, titel from titel 
join interpret on interpret_id=i_id

--select name as Band, titel as Song from titel
select name Band, titel Song from titel 
join interpret on interpret_id=i_id

select interpret.name Band, titel.titel Song, genre.genre Genre
from interpret join titel
on interpret.i_id = titel.interpret_id
join genre 
on genre.g_id=titel.genre_id

select interpret.name Band, titel.titel Song, genre.genre Genre
from interpret join titel
on interpret.i_id = titel.interpret_id
join genre 
on genre.g_id=titel.genre_id

select i.name Band, t.titel Song, g.genre Genre
from interpret as i join titel as t
on i.i_id = t.interpret_id
join genre g 
on g.g_id=t.genre_id

---ohne as 
select i.name Band, t.titel Song, g.genre Genre
from interpret i join titel  t
on i.i_id = t.interpret_id
join genre g 
on g.g_id=t.genre_id

select i.name Band, t.titel Song, g.genre Genre
from interpret i
join titel t on t.interpret_id=i.i_id
join genre g on g.g_id = t.genre_id
where g.genre in ('Rock', 'Reggae')
--alternative:
--where g.genre='Rock' or g.genre='Reggae'

select i.name Band, t.titel Song
from interpret i join titel t
on t.interpret_id=i.i_id
join genre g on g.g_id=t.genre_id
where g.genre in ('Rock', 'Pop')
order by t.titel DESC

select i.name Band, t.titel Song, g.genre Genre
from interpret i, genre g, titel t
where (i.i_id= t.interpret_id) and (g.g_id = t.genre_id)
and (g.genre = 'Rock' or g.genre = 'Pop');


select i.name  from interpret i
join in_ver iv on iv.i_nr = i.i_id
join veranstaltungsort ort on ort.v_id = iv.v_nr 

select distinct i.name, g.genre from interpret i --distinkt - schreib nur eine zeile von viele gleiche
join titel t on t.interpret_id = i.i_id
join genre g on g.g_id=t.genre_id
order by g.genre;





