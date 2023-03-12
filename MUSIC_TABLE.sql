----Creating a simple music table, including columns music_id,
music_name, artist_name.

-- CREATING A DATABASE FOR THE TABLES
CREATE DATABASE MusicSql

-- CREATING A SCHEMA FOR THE TABLES
CREATE SCHEMA Music

-- CREATING TABLES 

CREATE TABLE music (
Music_ID integer,
Music_name varchar(45) ,
Artist_name varchar(50)
);

---ALTER TABLE 

ALTER TABLE music
ADD release_year INT;

---ALTER TABLE + DROP COLUMN

ALTER TABLE music
DROP COLUMN release_year;

---ALTER TABLE + ALTER COLUMN

ALTER TABLE music
ALTER COLUMN music_name TYPE VARCHAR,
ALTER COLUMN artist_name TYPE VARCHAR;

---ALTER TABLE + ADD PRIMARY KEY

ALTER TABLE music
ADD PRIMARY KEY (music_id);

---ALTER TABLE + DROP CONSTRAINT

ALTER TABLE music
DROP CONSTRAINT (music_id);

--- INSERTING new rows

INSERT INTO music 
(Music_ID, Music_name, Artist_name)
VALUES (1000, ‘Essence’, ‘Wizkid’),
(1001, ‘Peru’, ‘Fireboy’),
(1002, ‘Warisi Cruise Beats’, ‘Dj Yk Beats’);

---UPDATE TABLE

UPDATE music
SET music_name = ‘Peru Remix’,
artist_name = ‘Fireboy ft Ed Sheeran’
WHERE music_id = 1001;

---DELETING ROWS + WHERE CLAUSE

DELETE FROM music
WHERE music_name = ‘Warisi Cruise Beats’;



