A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!


1. feladat: 2p
CREATE DATABASE fogado
DEFAULT CHARACTER SET utf8
COLLATE utf8_hungarian_ci;

3. feladat: 1p
ALTER TABLE vendegek ADD INDEX(vnev);
 
4. feladat: 2p
ALTER TABLE foglalasok ADD FOREIGN KEY(vendeg) REFERENCES vendegek(vsorsz);
ALTER TABLE foglalasok ADD FOREIGN KEY(szoba) REFERENCES szobak(szazon);

5. feladat: 1p
INSERT INTO foglalasok (fsorsz, vendeg, fo, szoba, erk, tav) VALUES (281, 100, 5, 2, "2016.06.28", "2016.06.30");

6. feladat: 1p
UPDATE szobak SET agy = 3 WHERE sznev = "Vidor";

7. feladat: 3p
SELECT COUNT(vendegek.vsorsz) as vendegszam
FROM `foglalasok` INNER JOIN vendegek ON foglalasok.vendeg=vendegek.vsorsz
WHERE vendegek.irsz >= 3400 AND vendegek.irsz <= 3999;

8. feladat: 5p
SELECT szobak.sznev, SUM(foglalasok.fo) as vendegek, SUM((foglalasok.tav-foglalasok.erk)*foglalasok.fo) as vendegejszakak
FROM `foglalasok` INNER JOIN vendegek ON vendegek.vsorsz=foglalasok.vendeg
INNER JOIN szobak ON foglalasok.szoba=szobak.szazon
GROUP BY szobak.szazon
ORDER BY vendegejszakak, vendegek ASC;

9. feladat: 5p
SELECT vendegek.vnev, (COUNT(foglalasok.fsorsz)) as alkalmak
FROM `foglalasok` INNER JOIN vendegek ON vendegek.vsorsz=foglalasok.vendeg
GROUP BY vendegek.vsorsz
HAVING alkalmak > 1
ORDER BY vendegek.vnev ASC;
