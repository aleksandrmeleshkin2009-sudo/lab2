INSERT INTO new_teachers (kod_prepodavatelya, familia, imya, otchestvo, obrazovanie, stazh, nomer_kafedri)
SELECT kod_prepodavatelya, familia, imya, otchestvo, obrazovanie, stazh, nomer_kafedri 
FROM prepodavateli1 
WHERE obrazovanie != 'высшее' 
  AND stazh BETWEEN 3 AND 10;