SELECT 
    p.familia, 
    p.imya, 
    COUNT(n.kod_disciplini) AS kolichestvo_disciplin, 
    AVG(n.stoimost_chasa) AS srednyaya_oplata_chasa
FROM prepodavateli1 p
JOIN nagruzka n ON p.kod_prepodavatelya = n.kod_prepodavatelya
GROUP BY p.kod_prepodavatelya, p.familia, p.imya;