SELECT * FROM prepodavateli1 
WHERE obrazovanie != 'высшее' -- (Если в базе пишется иначе, например 'среднее', укажите точное значение)
  AND stazh BETWEEN 3 AND 10;