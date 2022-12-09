SET foreign_key_checks = 0;

DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS employee;

CREATE TABLE department
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE employee
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
salary INT NOT NULL,
department_id INT NOT NULL,
chief_id INT NULL,
FOREIGN KEY (chief_id) REFERENCES employee(id),
FOREIGN KEY (department_id) REFERENCES department(id)
);

INSERT department (name)
VALUES
('Администрация'),
('ИТ'),
('Бухгалтерия'),
('Маркетинг'),
('Технический персонал');

INSERT employee (name, salary, department_id, chief_id)
VALUES
('Иванов И.И.', 100000, 1, NULL),
('Петров П.П.', 80000, 3, 1),
('Сидоров С.С.', 200000, 2, 1),
('Андреев А.А.', 40000, 3, 1),
('Горшков Ю.С', 15000, 4, NULL),
('Сергеев А.И.', 170000, 4, 1),
('Власов С.С.', 90000, 2, 1),
('Шнякин А.И.', 170000, 4, NULL),
('Филиппов И.И.', 100000, 1, NULL),
('Круглов П.П.', 40000, 2, 3),
('Травин П.П.', 70000, 2, 3);