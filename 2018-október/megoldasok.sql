-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!


-- 1. feladat: 2p
CREATE DATABASE palyazatok
DEFAULT CHARACTER SET utf8
COLLATE utf8_hungarian_ci;

-- 3. feladat: 2p
ALTER TABLE szamla ADD FOREIGN KEY (palyazatId) REFERENCES palyazat(id);
ALTER TABLE szamla ADD FOREIGN KEY (koltsegtipusId) REFERENCES koltsegtipus(id);

-- 4. feladat: 1p
UPDATE `szamla` 
SET koltsegtipusId="A8"
WHERE id=512;

-- 5. feladat: 1p
INSERT INTO koltsegtipus (id, megnevezes) VALUES ("A10", "Humánerőforrás-fejlesztés");

-- 6. feladat: 2p
SELECT * 
FROM `szamla`
WHERE ertek>=100000 AND szamla.koltsegtipusId="C1";

-- 7. feladat: 4p
SELECT szamlaszam, datum, ertek
FROM `szamla`
WHERE szamla.koltsegtipusId="A7"
ORDER BY ertek DESC
LIMIT 5;

-- 8. feladat: 4p
SELECT koltsegtipus.megnevezes as megnevezés, SUM(ertek) as "elszamolt osszeg", count(szamla.id) as "szamlak szama"
FROM `szamla` INNER JOIN koltsegtipus ON szamla.koltsegtipusId=koltsegtipus.id
GROUP BY koltsegtipus.id
ORDER BY SUM(ertek) DESC;

-- 9. feladat: 3p (1p számolási hiba)
SELECT 
palyazat.id as palyazat, 
tervezetA+tervezetC as keret, 
((SUM(szamla.ertek))/(tervezetA+tervezetC))*100 as allapot
FROM `palyazat` INNER JOIN szamla ON szamla.palyazatId=palyazat.id
GROUP BY palyazat.id;