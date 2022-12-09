-- 1. Вывести список сотрудников в формате: Сотрудник, Отдел сотрудника, Руководитель, Отдел руководителя.
SELECT e.name AS employee, d.name AS department, chief.name AS chief, chief_department.name AS chief_department
FROM employee AS e
LEFT JOIN employee AS chief 
	ON e.chief_id = chief.id
INNER JOIN department AS d
	ON e.department_id = d.id
LEFT JOIN department AS chief_department
	ON chief.department_id = chief_department.id;
    
-- 2. Вывести список сотрудников, получающих заработную плату, большую чем у непосредственного руководителя
SELECT e.name, e.salary, chief.name AS chief, chief.salary AS chief_salary
FROM employee AS e
INNER JOIN employee AS chief
	ON e.chief_id = chief.id
WHERE e.salary > chief.salary;

-- 3. Вывести список сотрудников, получающих максимальную заработную плату в своем отделе
SELECT e1.name, e1.salary
FROM employee AS e1
WHERE e1.salary = (SELECT MAX(salary)
				FROM employee AS e2
				WHERE e1.department_id = e2.department_id);

-- 4. Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек
SELECT d.id
FROM department AS d
LEFT JOIN employee AS e
	ON d.id = e.department_id
GROUP BY d.id
HAVING COUNT(d.id) <= 3;

-- 5. Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том же отделе
SELECT e.name
FROM employee AS e
LEFT JOIN employee AS chief 
	ON chief.id = e.chief_id AND chief.department_id = e.department_id
WHERE chief.id IS NULL;

-- 6. Вывести список наименований отделов с максимальной суммарной зарплатой сотрудников
SELECT d.name
FROM department AS d
INNER JOIN employee AS e
	ON d.id = e.department_id
GROUP BY d.name
HAVING SUM(e.salary) >= ALL (SELECT SUM(salary)
							FROM employee
							GROUP BY department_id);

-- 7. Вывести ФИО сотрудника(ов), получающего третью по величине зарплату в организации
SELECT name, salary
FROM employee
WHERE 3 = (SELECT COUNT(DISTINCT e.salary)
			FROM employee AS e
			WHERE e.salary >= employee.salary);