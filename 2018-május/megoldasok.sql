A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!


1. feladat: 2p
CREATE DATABASE nyelviskola
DEFAULT CHARACTER SET utf8
COLLATE utf8_hungarian_ci;

3. feladat: 2p
ALTER TABLE vizsgak ADD FOREIGN KEY (nyelvid) REFERENCES nyelvek(id);
ALTER TABLE jelentkezesek ADD FOREIGN KEY (vizsga) REFERENCES vizsgak(sorsz);

4. feladat: 1p
UPDATE jelentkezesek SET mobil = "30784613" WHERE sorsz = 9;

5. feladat: 1p
INSERT INTO nyelvek (id, nyelv) VALUES(8, 'holland');

6. feladat: 3p
SELECT MIN(2018-szulev) as legfiatalabb, MAX(2018-szulev) as legidosebb 
FROM `jelentkezesek`;

7. feladat: 5p
SELECT idopont
FROM `vizsgak` INNER JOIN jelentkezesek ON jelentkezesek.vizsga=vizsgak.sorsz
GROUP BY idopont
HAVING COUNT(jelentkezesek.sorsz) = 25
ORDER BY idopont DESC;

8. feladat: 6p
SELECT nyelvek.nyelv, vizsgak.szint, COUNT(jelentkezesek.sorsz) as vizsgazo
FROM `vizsgak` INNER JOIN nyelvek ON nyelvek.id=vizsgak.nyelvid
INNER JOIN jelentkezesek ON vizsgak.sorsz=jelentkezesek.vizsga
GROUP BY nyelvek.nyelv, vizsgak.szint
ORDER BY vizsgazo DESC;