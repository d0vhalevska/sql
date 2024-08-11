CREATE DATABASE record_company;
USE record_company;
CREATE TABLE bands(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL, 
    PRIMARY KEY (id)
);
CREATE TABLE albums(
	id INT NOT NULL AUTO_INCREMENT,
    album VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id), 
    FOREIGN KEY(band_id) REFERENCES bands(id)
);

INSERT INTO bands (name)
VALUES ('Iron Maiden');

INSERT INTO bands (name)
VALUES ('Deuce'), ('Avenged Sevenfold'), ('Ankor');

USE record_company; 

SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands;

SELECT id AS 'ID', name AS 'Band Name'
FROM bands;

SELECT * FROM bands ORDER BY name DESC;

INSERT INTO albums (album, release_year, band_id)
VALUES ('The number of the Beasts', 1985, 1),
('Power Slave', 1984, 1),
('Nightmare', 2018, 2),
('Nightmare', 2010, 2),
('Test Album', NULL, 3);

SELECT * FROM albums;

SELECT DISTINCT album FROM albums;

UPDATE albums
SET release_year = 1982
WHERE id = 1;

SELECT * FROM albums
WHERE release_year < 2000;

SELECT * FROM albums
WHERE album LIKE '%er%' OR band_id = 2;

SElECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2018;

SELECT * FROM albums
WHERE release_year is NULL;

DELETE FROM albums 
WHERE id > 4;

UPDATE albums
SET release_year = 2010
WHERE band_id = 3;

SELECT * FROM bands 
INNER JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands 
LEFT JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands 
RIGHT JOIN albums ON bands.id = albums.band_id;

SELECT SUM(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b 
LEFT JOIN albums AS a ON b.id =.band_id
GROUP BY b.id
HAVING num_albums = 1;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b 
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE b.name = 'Deuce'
GROUP BY b.id
HAVING num_albums = 1;
