-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!


-- 1. feladat: 2p
CREATE DATABASE tenisz
DEFAULT CHARACTER SET utf8
COLLATE utf8_hungarian_ci;

-- 3. feladat: 3p
SELECT count(id) as visszalepes
FROM `merkozes` 
WHERE jatszma1=-1 OR jatszma2=-1;

-- 4. feladat: 3p
SELECT MIN(kezdes) as legkorabbban, MAX(kezdes) as legkesobben
FROM `merkozes` 
WHERE fordulo='d8';

-- 5. feladat:
SELECT merkozes.datum, jatekos1.orszagKod, jatekos1.nev AS 'egyik jatekos', jatekos2.nev AS 'masik jatekos'
FROM `merkozes` 
INNER JOIN jatekos AS jatekos1 ON merkozes.jatekos1Id=jatekos1.id
INNER JOIN jatekos AS jatekos2 ON merkozes.jatekos2Id=jatekos2.id
WHERE jatekos1.orszagKod=jatekos2.orszagKod
ORDER BY jatekos1.orszagKod ASC;

-- 6. feladat: 3p
SELECT orszagKod, count(id) as letszam 
FROM `jatekos` 
GROUP BY orszagKod
ORDER BY letszam DESC;

-- 7. feladat: 5p
SELECT YEAR(datum) as evszam, count(id) as '2:0 vagy 0:2'
FROM `merkozes` 
WHERE (jatszma1=0 AND jatszma2=2) OR (jatszma1=2 AND jatszma2=0)
GROUP BY YEAR(datum)
ORDER BY evszam DESC;
