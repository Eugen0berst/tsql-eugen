--bitte erstellen sie eine liste aller interpreten und deren titel

select top 0 *from interpret;
select top 0 * from titel;
select top 0 * from genre
select top 0 * from in_ver
select top 0 * from veranstaltungsort

select i.name, titel.titel from interpret i
join titel on i.i_id = titel.interpret_id;

--2.welche titel gehören zum genre klassik
select titel.t_id, titel.titel, genre.genre from titel
join genre on genre.g_id = titel.genre_id
where genre = 'klassik';

--3. bitte übeprüfen sie ob 'miles davis' am 01.07.20027 gebucht werden kann
select i.name, in_ver.datum_von, in_ver.datum_bis from interpret i
join in_ver on in_ver.i_nr = i.i_id
where i.name = 'Miles Davis' and '2027-07-01'
--between in_ver.datum_von and in_ver.datum_bis;
>=in_ver.datum_von and '2027-07-01' <= in_ver.datum_bis;


--4. ich meine mich zu errinnern, dass miles Davis am 30.06.2026 bereits
--irgendwo gebucht wurde. 
--ermitteln sie an welchen veranstaltungsort er auftreten wird

select i.name, in_ver.datum_von, in_ver.datum_bis, vort.ort_name  from interpret i
join in_ver on in_ver.i_nr = i.i_id
join veranstaltungsort vort on vort.v_id=in_ver.v_nr
where i.name = 'Miles Davis' and ('2026-06-30' 
between in_ver.datum_von and in_ver.datum_bis)
or ('2027-03-08' between in_ver.datum_von and in_ver.datum_bis) 

select i.name, in_ver.datum_von, in_ver.datum_bis, vort.ort_name  from interpret i
join in_ver on in_ver.i_nr = i.i_id
join veranstaltungsort vort on vort.v_id=in_ver.v_nr
where i.name = 'Miles Davis' and '2026-01-01'<=in_ver.datum_von
and '2026-12-31' >=in_ver.datum_bis;

insert into in_ver values
(3,1,'2025-12-1', '2027-12-02')

select i.name, in_ver.datum_von, in_ver.datum_bis, vort.ort_name  from interpret i
join in_ver on in_ver.i_nr = i.i_id
join veranstaltungsort vort on vort.v_id=in_ver.v_nr
where i.name = 'Miles Davis' and (year(in_ver.datum_von)<=2026 and year(in_ver.datum_bis)>=2026);



