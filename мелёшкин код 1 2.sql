SELECT * FROM prepodavateli1 
WHERE obrazovanie != 'высшее' --
  AND stazh BETWEEN 3 AND 10;

SELECT p.*, n.stoimost_chasa 
FROM prepodavateli1 p
JOIN nagruzka n ON p.kod_prepodavatelya = n.kod_prepodavatelya
WHERE p.familia ~ '^[А-К]' 
  AND n.stoimost_chasa >= 150;
  