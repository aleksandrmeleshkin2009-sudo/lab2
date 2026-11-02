SELECT p.*, n.stoimost_chasa 
FROM prepodavateli1 p
JOIN nagruzka n ON p.kod_prepodavatelya = n.kod_prepodavatelya
WHERE p.familia ~ '^[А-К]' 
  AND n.stoimost_chasa >= 150;