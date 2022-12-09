CREATE DATABASE merchandising;
USE merchandising;

CREATE TABLE region
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	nameEn VARCHAR(100) NOT NULL
);

INSERT INTO region(id, name, nameEn)
VALUES (1, 'Москва', 'Moscow'),
(2, 'Центр', 'Centre'),
(3, 'Сибирский', 'Siberia'),
(4, 'Восточный', 'East'),
(5, 'Южный', 'South'),
(6, 'Юго-Восточная Азия', 'South-East Asia'),
(7, 'СНГ и Грузия', 'CIS and Georgia'),
(8, 'Западная Европа', 'Western Europe');

CREATE TABLE city
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(3) NOT NULL,
	name VARCHAR(100) NOT NULL,
	nameEn VARCHAR(100) NOT NULL,
	regionId INT NOT NULL,
	FOREIGN KEY (regionId) REFERENCES region(id)
);

INSERT INTO city (id, code, name, nameEn, regionId) VALUES (1, 'MOW', 'Москва', 'Moscow', 1);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (2, 'KGD', 'Калининград', 'Kaliningrad', 2);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (3, 'OVB', 'Новосибирск', 'Novosibirsk', 3);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (4, 'UUS', 'Южно-Сахалинск', 'Yuzhno-Sakhalinsk', 4);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (5, 'AER', 'Сочи', 'Sochi', 5);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (6, 'IKT', 'Иркутск', 'Irkutsk', 4);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (7, 'BAX', 'Барнаул', 'Barnaul', 3);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (8, 'ABA', 'Абакан', 'Abaka', 3);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (9, 'ROV', 'Ростов-на-Дону', 'Rostov', 5);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (10, 'ПТГ', 'Пятигорск', 'Pyatigorsk', 5);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (11, 'SPK', 'Саппоро', 'Sapporo', 6);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (12, 'EV', 'Ереван', 'Yereva', 7);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (13, 'FRU', 'Бишкек', 'Bishkek', 7);
INSERT INTO city (id, code, name, nameEn, regionId) VALUES (14, 'ALY', 'Александрия', 'Alexandria', 8);

CREATE TABLE merchandiser
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	firstName VARCHAR(50) NOT NULL,
	lastName VARCHAR(50) NOT NULL,
	middleName VARCHAR(50) NULL,
	login VARCHAR(50) NOT NULL,
	cityId INT NOT NULL,
	phone VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
	FOREIGN KEY (cityId) REFERENCES city(id)
);

INSERT INTO merchandiser (id, firstName, lastName, middleName, login, cityId, phone, email)
VALUES (1, 'Иван', 'Иванов', 'Иванович', 'merch_1', 2, '333001', 'merch_1@demo.com'),
(2, 'Ирина', 'Петрова', 'Сергеевна', 'merch_2', 1, '333002', 'merch_2@demo.com'),
(3, 'Петр', 'Кулаков', 'Ильич', 'merch_3', 5, '333003', 'merch_3@demo.com'),
(4, 'Александр', 'Логинов', 'Иванович', 'merch_4', 4, '333004', 'merch_4@demo.com'),
(5, 'Иван', 'Иванов', 'Иванович', 'merch_5', 3, '333005', 'merch_5@demo.com'),
(6, 'Семен', 'Тучин', 'Алексеевич', 'merch_6', 6, '333006', 'merch_6@demo.com'),
(7, 'Ольга', 'Беседина', 'Александровна', 'merch_7', 7, '333007', 'merch_7@demo.com'),
(8, 'Елисей', 'Умнов', 'Петрович', 'merch_8', 8, '333008', 'merch_8@demo.com'),
(9, 'Анисья', 'Семенова', 'Матвеевна', 'merch_9', 10, '333009', 'merch_9@demo.com'),
(10, 'Сергей', 'Манеев', 'Алексеевич', 'merch_10', 9, '333010', 'merch_10@demo.com'),
(11, 'Екатерина', 'Королева', 'Петровна', 'merch_11', 11, '333011', 'merch_11@demo.com'),
(12, 'Владимир', 'Титов', 'Владимирович', 'merch_12', 12, '333012', 'merch_12@demo.com'),
(13, 'Елена', 'Полякова', 'Петровна', 'merch_13', 14, '333013', 'merch_13@demo.com'),
(14, 'Александр', 'Иванов', 'Семенович', 'merch_14', 13, '333014', 'merch_14@demo.com'),
(15, 'Данил', 'Кусков', 'Антонович', 'merch_15', 1, '333015', 'merch_15@demo.com'),
(16, 'Антон', 'Лебедев', 'Александрович', 'merch_16', 2, '333016', 'merch_16@demo.com'),
(17, 'Оксана', 'Вавилина', 'Алексеевна', 'merch_17', 3, '333017', 'merch_17@demo.com');

CREATE TABLE posmSet
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	lastUpdateDate DATETIME NOT NULL
);

INSERT INTO posmSet (id, name, lastUpdateDate)
VALUES (1, '4 волна', '2017-06-19');

CREATE TABLE posmItem
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	format VARCHAR(150) NOT NULL,
	price DECIMAL(15, 2) NOT NULL,
	comment VARCHAR(255) NULL
);

INSERT INTO posmItem (id, name, format, price, comment)
VALUES (1, 'Блокнот A5', 'A5', 200, 'на пружине'),
(2, 'Календарь настенный 2017', 'квартальный', 400, NULL),
(3, 'Кубарик', '9*9 см', 150, 'с отрывными листами'),
(4, 'Пакет', 'Стандарт', 20, NULL),
(5, 'Ручка шариковая', 'стандарт', 30, '5 цветов');

CREATE TABLE posmSetItem
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	posmItemId INT NOT NULL,
	posmItemsCount INT NOT NULL,
	posmSetId INT NOT NULL,
	FOREIGN KEY (posmItemId) REFERENCES posmItem(id),
	FOREIGN KEY (posmSetId) REFERENCES posmSet(id)
);

INSERT INTO posmSetItem (id, posmItemId, posmItemsCount, posmSetId)
VALUES (1, 1, 6, 1),
(2, 3, 5, 1),
(3, 4, 5, 1),
(4, 5, 15, 1);

CREATE TABLE formPosmSetTask
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	createdDate DATETIME NOT NULL,
	status INT NOT NULL,
	posmSetId INT NOT NULL,
	FOREIGN KEY (posmSetId) REFERENCES posmSet(id)
);

/* status: 2 - done */
INSERT INTO formPosmSetTask (id, name, createdDate, status, posmSetId)
VALUES (1, '2017 1 Мерчендайзинг POSm', '2017-01-05', 2, 1);

CREATE TABLE placePosmTask
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	status INT NOT NULL,
	formPosmSetTaskId INT NOT NULL,
	merchandiserId INT NOT NULL,
	cityId INT NOT NULL,
	salePointAddress VARCHAR(255) NOT NULL,
	posmSetsCount INT NOT NULL,
	agentCode VARCHAR(10) NULL,
	completeDate DATETIME NULL,
	FOREIGN KEY (cityId) REFERENCES city(id),
	FOREIGN KEY (formPosmSetTaskId) REFERENCES formPosmSetTask(id),
	FOREIGN KEY (merchandiserId) REFERENCES merchandiser(id)
);

/* status: 1 - in progress, 2 - done */
INSERT INTO placePosmTask (id, name, status, formPosmSetTaskId, merchandiserId, cityId, salePointAddress, posmSetsCount, agentCode, completeDate)
VALUES (1, 'M-17-00001', 1, 1, 2, 1, 'Москва, ул.Петрова, д.1', 1, '10187', NULL),
(2, 'M-17-00002', 2, 1, 2, 1, 'Москва, ул.Ленина, д.5', 2, '10187', '2017-02-02'),
(3, 'M-17-00003', 1, 1, 1, 2, 'Калининград, пл.Калинина, д.12', 1, '325', NULL),
(4, 'M-17-00004', 2, 1, 5, 3, 'Новосибирск, ул.Инженерная, д.4а', 2, '3043', '2017-02-02'),
(5, 'M-17-00005', 2, 1, 5, 3, 'Новосибирск, ул.Фрунзе, д.5', 1, '3044', '2017-02-05'),
(6, 'M-17-00006', 1, 1, 4, 4, 'Южно-Сахалинск, ул.Сахалинская 68', 1, '224', NULL),
(7, 'M-17-00007', 2, 1, 3, 5, 'Сочи, ул.Южная 3', 1, '2256', '2017-03-02'),
(8, 'M-17-00008', 2, 1, 6, 6, 'Иркутск, ул.Советская, д.32', 1, '432', '2017-03-12'),
(9, 'M-17-00009', 1, 1, 7, 7, 'Барнаул, ул.Энтузиастов, д.4', 1, '3456', NULL),
(10, 'M-17-00010', 2, 1, 8, 8, 'Абакан, ул.Иванова, д.2', 1, '325', '2017-02-22'),
(11, 'M-17-00011', 1, 1, 10, 9, 'Ростов-на-Дону, ул.Донская, д.12', 1, '10187', NULL),
(12, 'M-17-00012', 2, 1, 9, 10, 'Пятигорск, ул.Горная, д.7', 1, '4537', '2017-02-05'),
(13, 'M-17-00013', 2, 1, 11, 11, 'Саппоро, ул.Рамен, д.1', 1, '4326', '2017-03-02');