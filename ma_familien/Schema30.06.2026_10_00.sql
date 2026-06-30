drop table if exists menschlein;
drop table if exists familienstand;

create table familienstand (
fid int identity(1,1) primary key,
fbez varchar(20)
);

create table menschlein(
id int identity(1,1),
vname varchar(50) not null,
fid int,
constraint PK_mensch primary key(id),
constraint FK_mensch_famstand_fid 
foreign key (fid) references familienstand(fid)
);

insert into familienstand values
('Ledig'), ('Verheiratet'), ('Geschieden');

insert into menschlein values
('Lisa', 3),
('Hanni', 1),
('Eddi', 2),
('Lorenz', 2);

insert into menschlein values
('Lina', 1);

select vname Vorname, fbez "Familienstand des Mitarbeiters" from menschlein
join familienstand on menschlein.fid = familienstand.fid
where vname like '____';    -- Vorname hat 4 Symbolen
--where vname like 'Li_a';  -- Lisa oder Lina: 1 Symbol dazwischen
--where vname like '%i%';   -- Name enthält "i"

-- % = belibig viele Symbolen
-- _ = genau 1 Symbol