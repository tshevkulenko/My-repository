-- 1) Выведите ФИО всех мерчандайзеров из сибирского региона
SELECT m.lastName, m.firstName, m.middleName
FROM merchandiser AS m
INNER JOIN city AS c
	ON m.cityId = c.id
INNER JOIN region AS r
	ON c.regionId = r.id
WHERE r.name = 'Сибирский';

-- 2) Выведите информацию о POSm, у которых не задан комментарий
SELECT * FROM posmitem
WHERE comment IS NULL;

-- 3) Для каждого города выведите название города и число мерчандайзеров из этого города. Если там 0 мерчандайзеров, то должно вывестись 0
SELECT c.name, COUNT(m.id) AS merchandisersCount
FROM city AS c
LEFT JOIN merchandiser AS m
	ON m.cityId = c.id
GROUP BY c.name;

-- 4) Для каждого региона выведите название региона и число мерчандайзеров из этого региона. Если там 0 мерчандайзеров, то должно вывестись 0
SELECT r.name, COUNT(m.id) AS merchandisersCount
FROM region AS r
LEFT JOIN city AS c
	ON c.regionId = r.id
LEFT JOIN merchandiser AS m
	ON m.cityId = c.id
GROUP BY r.name;

-- 5) Посчитайте сколько единиц каждого вида POSm еще осталось разместить и сколько было размещено
SELECT pi.name, 
	SUM(CASE WHEN ppt.status = 1 THEN ppt.posmSetsCount * psi.posmItemsCount END) AS inProcess,
	SUM(CASE WHEN ppt.status = 2 THEN ppt.posmSetsCount * psi.posmItemsCount END) AS done
FROM placeposmtask AS ppt
INNER JOIN formposmsettask AS fst
	ON fst.id = ppt.formPosmSetTaskId
INNER JOIN posmsetitem AS psi
	ON psi.posmSetId = fst.posmSetId
RIGHT JOIN posmitem AS pi	 
    ON pi.id = psi.posmItemId
GROUP BY pi.name;

-- 6) Посчитайте сколько единиц каждого вида POSm было отправлено каждому агенту
SELECT pi.name, SUM(ppt.posmSetsCount * psi.posmItemsCount) AS posmCount, ppt.agentCode
FROM placeposmtask AS ppt
INNER JOIN formposmsettask AS fst
	ON fst.id = ppt.formPosmSetTaskId
INNER JOIN posmsetitem AS psi
	ON psi.posmSetId = fst.posmSetId
RIGHT JOIN posmitem AS pi	 
	ON pi.id = psi.posmItemId
GROUP BY ppt.agentCode, pi.name
HAVING SUM(ppt.posmSetsCount * psi.posmItemsCount) IS NOT NULL;

-- 7) Посчитайте сколько у каждого мерчандайзера задач «в работе» и «выполнено». Если 0, то должно вывестись 0
SELECT m.id,
	m.lastName,
    m.firstName,
    m.middleName,
	COUNT(CASE WHEN ppt.status = 1 THEN 1 END) AS tasksInProcess, 
    COUNT(CASE WHEN ppt.status = 2 THEN 1 END) AS tasksDone
FROM merchandiser AS m
LEFT JOIN placeposmtask AS ppt
	ON ppt.merchandiserId = m.id
GROUP BY m.id, m.lastName, m.firstName, m.middleName;

-- 8) Найдите агентов, у которых более 2 задач на размещение, выведите для каждого из них количество задач
SELECT agentCode, COUNT(id) AS tasksCount
FROM placeposmtask
GROUP BY agentCode
HAVING COUNT(id) > 2;