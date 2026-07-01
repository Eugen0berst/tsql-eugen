use musiker_db

-- 1. Bitte ermitteln Sie, wie viele Titel wir pro Genre gespeichert haben.

select * from titel
select * from genre

SELECT g.genre, 
COUNT(t.t_id) AS anzahl_titel
FROM dbo.genre g
LEFT JOIN dbo.titel t ON g.g_id = t.genre_id
GROUP BY g.g_id, g.genre;

-- 2.	Bitte erstellen Sie eine Auflistung, wie viele unterschiedliche Titel jeder Interpret
--		in seinem Repertoire hat. Sortieren Sie die Ausgabe bitte nach Interpret. 

SELECT  i.name, 
COUNT(t.t_id) AS anzahl_titel
FROM dbo.interpret i
LEFT JOIN dbo.titel t ON i.i_id = t.interpret_id
GROUP BY i.i_id, i.name
ORDER BY i.name ASC;

-- 3.	Bei welchen Interpreten haben wir mehr als sechs Titel gespeichert.
--		Sortieren Sie die Ausgabe bitte nach Interpret.

SELECT i.name, 
COUNT(t.t_id) AS anzahl_titel
FROM dbo.interpret i
JOIN dbo.titel t ON i.i_id = t.interpret_id
GROUP BY i.i_id, i.name
HAVING COUNT(t.t_id) > 6
ORDER BY i.name ASC;

-- 4.	Bitte erzeugen Sie eine Liste die uns informiert, welches die jeweils ersten 
--		Auftrittstage der Interpreten sind und wo die Auftritte stattfinden.
--		Sortierung bitte nach Interpret. 

SELECT i.name, 
MIN(iv.datum_von) AS erster_auftrittstag, v.ort_name
FROM dbo.interpret i
JOIN dbo.in_ver iv ON i.i_id = iv.i_nr
JOIN dbo.veranstaltungsort v ON iv.v_nr = v.v_id
GROUP BY i.i_id, i.name, v.ort_name
ORDER BY i.name ASC;



use mitarbeiter_ub1



-- 5. Welche Familienstände sind wie häufig vertreten?

SELECT f.fam_bez, 
COUNT(m.ma_id) AS anzahl_mitarbeiter
FROM  dbo.familienstand f
LEFT JOIN dbo.mitarbeiter m ON f.f_id = m.f_id
GROUP BY f.f_id, f.fam_bez
ORDER BY anzahl_mitarbeiter DESC;

-- 6. Wer ist unser jüngster Mitarbeiter und in welchem Arbeitszeitmodell arbeitet der MA?

SELECT TOP 1 m.ma_id, m.nname, m.vname, m.gebdatum, a.az_bez
FROM dbo.mitarbeiter m
JOIN dbo.arbeitszeitmodell a ON m.azm_id = a.modell_code
ORDER BY m.gebdatum DESC;

-- 7. Wie viele Mitarbeiter beschäftigen wir je Abteilung?

select m.ma_id, m.nname, m.vname, a.abtbez
from mitarbeiter m
join abteilung a on m.abt_nr = a.abtnr
order by

SELECT a.abtbez, 
COUNT(m.ma_id) AS anzahl_mitarbeiter
FROM dbo.abteilung a
LEFT JOIN dbo.mitarbeiter m ON a.abtnr = m.abt_nr
GROUP BY a.abtnr, a.abtbez
ORDER BY anzahl_mitarbeiter DESC;





select * from abteilung