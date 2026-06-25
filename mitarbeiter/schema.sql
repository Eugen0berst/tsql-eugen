--DROP TABLE mitarbeiter;
--DROP TABLE abteilung;
--DROP TABLE arbeitszeitmodell;
--DROP TABLE familienstand;

CREATE TABLE abteilung (
abtnr INT IDENTITY(1,1) PRIMARY KEY,
abtbez VARCHAR(100)
);

CREATE TABLE arbeitszeitmodell (
modell_code CHAR(2) PRIMARY KEY,
az_bez VARCHAR(50)
);

CREATE TABLE familienstand (
f_id INT IDENTITY(1,1) PRIMARY KEY,
fam_bez VARCHAR(50)
);

CREATE TABLE mitarbeiter (
ma_id INT IDENTITY(1,1),
nname VARCHAR (100),
vname VARCHAR (100),
str_hsnr VARCHAR (100),
plz VARCHAR (5),
ort VARCHAR(50),
gebdatum DATE,
f_id INT,
abt_nr INT,
azm_id CHAR(2),
CONSTRAINT PK_mitarbeieter PRIMARY KEY (ma_id),
CONSTRAINT FK_ma_fam_f_id FOREIGN KEY (f_id) REFERENCES familienstand(f_id), 
CONSTRAINT FK_ma_azm_azm_id FOREIGN KEY (azm_id) REFERENCES arbeitszeitmodell(modell_code),
CONSTRAINT FK_ma_abt_abt_nr FOREIGN KEY (abt_nr) REFERENCES abteilung(abtnr)
);

--select * from mitarbeiter;

CREATE TABLE skills (
s_id INT IDENTITY(1,1) PRIMARY KEY,
s_bez VARCHAR(100) not null
);


create table ma_skills (
ma_id int,
s_id int,
primary key (ma_id, s_id),
foreign key (ma_id) references mitarbeiter (ma_id),
foreign key (s_id) references skills (s_id)
);