A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!


1. feladat: 2p
CREATE DATABASE beiskolazas
DEFAULT CHARACTER SET utf8
COLLATE utf8_hungarian_ci;

3. feladat: 2p
ALTER TABLE jelentkezesek ADD FOREIGN KEY (diak) REFERENCES diakok(oktazon);
ALTER TABLE jelentkezesek ADD FOREIGN KEY (tag) REFERENCES tagozatok(akod);

4. feladat: 1p
UPDATE diakok SET kpmagy = 43 WHERE oktazon = 0143302;

5. feladat: 4p
SELECT nev
FROM `diakok` 
WHERE hozott >= 40 AND kpmagy = 50 AND kpmat = 50
ORDER BY nev ASC;

6. feladat: 6p
SELECT tagozatok.agazat, COUNT(diakok.oktazon) as jelentkezoszam, (MAX(diakok.hozott) - MIN(diakok.hozott)) as terjedelem
FROM `jelentkezesek` INNER JOIN tagozatok ON tagozatok.akod=jelentkezesek.tag
INNER JOIN diakok ON jelentkezesek.diak=diakok.oktazon
WHERE tagozatok.nyek AND jelentkezesek.hely = 1
GROUP BY tagozatok.agazat
ORDER BY jelentkezoszam DESC;

7. feladat: 5p
SELECT diakok.nev, tagozatok.agazat, tagozatok.nyek, jelentkezesek.hely, (diakok.hozott*2+diakok.kpmagy+diakok.kpmat) as osszpont
FROM `jelentkezesek` INNER JOIN tagozatok ON tagozatok.akod=jelentkezesek.tag
INNER JOIN diakok ON jelentkezesek.diak=diakok.oktazon
ORDER BY tagozatok.agazat ASC, osszpont DESC, jelentkezesek.hely ASC;

