A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!


1. feladat: 2p
CREATE DATABASE forma1
DEFAULT CHARACTER SET utf8
COLLATE utf8_hungarian_ci;

3. feladat: 1p
ALTER TABLE `pilotak` ADD INDEX(`pnev`);
ALTER TABLE pilotak ADD INDEX(pnev);

4. feladat: -
ALTER TABLE pilotak
ADD FOREIGN KEY (csapat) REFERENCES csapatok(csazon);
ALTER TABLE eredmenyek
ADD FOREIGN KEY (pilota) REFERENCES pilotak(pazon);
ALTER TABLE eredmenyek
ADD FOREIGN KEY (nagydij) REFERENCES versenyek(vkod);

ALTER TABLE pilotak ADD FOREIGN KEY(csapat) REFERENCES csapatok(csazon);
ALTER TABLE eredmenyek ADD FOREIGN KEY(pilota) REFERENCES pilotak(pazon);
ALTER TABLE eredmenyek ADD FOREIGN KEY(nagydij) REFERENCES versenyek(vkod);

5. feladat: 1p
DELETE FROM `versenyek` WHERE vnev="Német nagydíj";

6. feladat: 1p
UPDATE `versenyek` 
SET hely="Sao Paulo"
WHERE vnev="Brazil nagydíj";

7. feladat: 4p
SELECT pilotak.pnev, count(eredmenyek.nagydij) as gyozelmek
FROM `pilotak` INNER JOIN eredmenyek ON eredmenyek.pilota=pilotak.pazon
WHERE eredmenyek.celpoz=1
GROUP BY pilotak.pnev
LIMIT 1;

8. feladat: 3p
SELECT vnev, (kor*hossz/1000) as tav
FROM `versenyek` 
ORDER BY tav DESC;

9. feladat: 5p
SELECT pnev, szev, csapatok.csnev, MIN(eredmenyek.celpoz) as legjobb
FROM `pilotak` INNER JOIN csapatok ON csapatok.csazon=pilotak.csapat
INNER JOIN eredmenyek ON eredmenyek.pilota=pilotak.pazon
GROUP BY pnev
ORDER BY szev DESC;
