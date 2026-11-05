--- выбрать всех преподавателей не имеющих высшего образвания со стажем работы от 3 до 10 лет
SELECT * FROM prepodavateli1 
WHERE obrazovanie != 'высшее' -- (Если в базе пишется иначе, например 'среднее', укажите точное значение)
  AND stazh BETWEEN 3 AND 10;
---выбрать всех преподавателей с фамилиями на буквы от А до К оплата часа которых не ниже 150
SELECT p.*, n.stoimost_chasa 
FROM prepodavateli1 p
JOIN nagruzka n ON p.kod_prepodavatelya = n.kod_prepodavatelya
WHERE p.familia ~ '^[А-К]' 
  AND n.stoimost_chasa >= 150;

--- Создать таблицу, содержащую данные 2 запроса с указанием контактных телефонов.
CREATE TABLE new_teachers AS
SELECT p.*, n.stoimost_chasa 
FROM prepodavateli1 p
JOIN nagruzka n ON p.kod_prepodavatelya = n.kod_prepodavatelya
WHERE p.familia ~ '^[А-К]' 
  AND n.stoimost_chasa >= 150;
---В созданную таблицу добавить преподавателей, выбранных в 1 запросе
INSERT INTO new_teachers (kod_prepodavatelya, familia, imya, otchestvo, obrazovanie, stazh, nomer_kafedri, kontartniy_nomer)
SELECT kod_prepodavatelya, familia, imya, otchestvo, obrazovanie, stazh, nomer_kafedri, kontartniy_nomer 
FROM prepodavateli1 
WHERE obrazovanie != 'высшее' 
  AND stazh BETWEEN 3 AND 10;
---В созданной таблице для всех преподавателей, у которых контактный телефон содержит код 499, изменить на 495.
UPDATE new_teachers 
SET kontaktniy_nomer = REPLACE(kontaktniy_nomer, '499', '495') 
WHERE kontaktniy_nomer LIKE '%499%';
---Удалить из созданной таблице все записи для преподавателей, у которых не указан контактный телефон.
DELETE FROM new_teachers 
WHERE kontartniy_nomer IS NULL OR kontartniy_nomer = '';
---посчитать количество дисциплин, которые ведет каждый из преподавателей и среднюю оплату часа.
SELECT 
    p.familia, 
    p.imya, 
    COUNT(n.kod_disciplini) AS kolichestvo_disciplin, 
    AVG(n.stoimost_chasa) AS srednyaya_oplata_chasa
FROM prepodavateli1 p
JOIN nagruzka n ON p.kod_prepodavatelya = n.kod_prepodavatelya
GROUP BY p.kod_prepodavatelya, p.familia, p.imya;