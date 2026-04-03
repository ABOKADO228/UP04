/*=====================================================
1. Вставка данных в справочники
=======================================================*/

-- Единицы измерения
INSERT INTO unit (code, name) VALUES
('kg', 'Килограмм'),
('g', 'Грамм'),
('t', 'Тонна'),
('l', 'Литр'),
('ml', 'Миллилитр'),
('pcs', 'Штука'),
('box', 'Коробка'),
('bunch', 'Пучок'),
('m', 'Метр'),
('sq_m', 'Квадратный метр');

-- Типы документов, удостоверяющих личность
INSERT INTO identity_document_type (code, name) VALUES
('passport_rf', 'Паспорт РФ'),
('passport_foreign', 'Паспорт иностранного гражданина'),
('driver_license', 'Водительское удостоверение'),
('snils', 'СНИЛС'),
('inn', 'ИНН'),
('military_id', 'Военный билет'),
('residence_permit', 'Вид на жительство');

-- 3. Должности/роли на ферме
INSERT INTO farm_role (name, description) VALUES
('Управляющий фермой', 'Отвечает за общее руководство, планирование и контроль'),
('Главный зоотехник', 'Отвечает за животноводство, кормление, здоровье животных'),
('Ветеринар', 'Осуществляет ветеринарный контроль и лечение животных'),
('Агроном', 'Отвечает за растениеводство, почвы, севооборот'),
('Оператор доильной установки', 'Выполняет доение и уход за доильным оборудованием'),
('Тракторист-машинист', 'Работает на сельхозтехнике, обрабатывает поля'),
('Разнорабочий', 'Выполняет различные подсобные работы'),
('Бухгалтер', 'Ведёт финансовый учёт и отчётность'),
('Кладовщик', 'Отвечает за учёт и хранение материалов и продукции');

-- 4. Статусы занятости
INSERT INTO employment_status (name) VALUES
('Активен'),
('Уволен'),
('В отпуске'),
('На больничном'),
('В декрете'),
('Отстранён');

-- 5. Типы продукции 
	-- основные категории продукции
INSERT INTO product_type (id, parent_id, sku, product_level, name, description) VALUES
(1, NULL, 'CROPS', 1, 'Растениеводство', 'Продукция растительного происхождения'),
(2, NULL, 'LIVESTOCK', 1, 'Животноводство', 'Продукция животного происхождения'),
(3, NULL, 'POULTRY', 1, 'Птицеводство', 'Продукция птицеводства');

	-- одкатегории растениеводства (parent_id = 1)
INSERT INTO product_type (id, parent_id, sku, product_level, name, description) VALUES
(11, 1, 'GRAINS', 2, 'Зерновые', 'Пшеница, рожь, ячмень, овёс и др.'),
(12, 1, 'VEGETABLES', 2, 'Овощи', 'Картофель, морковь, капуста и др.'),
(13, 1, 'FRUITS', 2, 'Фрукты', 'Яблоки, груши, сливы и др.');

	-- подкатегории животноводства (parent_id = 2)
INSERT INTO product_type (id, parent_id, sku, product_level, name, description) VALUES
(21, 2, 'CATTLE', 2, 'КРС', 'Крупный рогатый скот'),
(22, 2, 'PIGS', 2, 'Свиноводство', 'Свиньи'),
(23, 2, 'SHEEP_GOATS', 2, 'Овцы и козы', 'Овцы, козы');

	-- подкатегории птицеводства (parent_id = 3)
INSERT INTO product_type (id, parent_id, sku, product_level, name, description) VALUES
(31, 3, 'CHICKENS', 2, 'Куры', 'Мясные и яичные породы'),
(32, 3, 'TURKEYS', 2, 'Индейки', 'Мясные индейки');

	-- более детальные типы для зерновых (parent_id = 11)
INSERT INTO product_type (id, parent_id, sku, product_level, name, description) VALUES
(111, 11, 'WHEAT', 3, 'Пшеница', 'Озимая и яровая пшеница'),
(112, 11, 'BARLEY', 3, 'Ячмень', 'Фуражный и пивоваренный');

	-- для овощей (parent_id = 12)
INSERT INTO product_type (id, parent_id, sku, product_level, name, description) VALUES
(121, 12, 'POTATO', 3, 'Картофель', 'Столовый и технический'),
(122, 12, 'CARROT', 3, 'Морковь', 'Столовая морковь');

-- 6. Типы фермерских участков 
INSERT INTO farm_plot_type (id, name, description, farm_plot_level, parent_id) VALUES
(1, 'Поле', 'Открытый грунт для выращивания сельхозкультур', 1, NULL),
(2, 'Теплица', 'Защищённый грунт', 1, NULL),
(3, 'Пастбище', 'Участок для выпаса скота', 1, NULL);

	-- специализации для полей (parent_id = 1)
INSERT INTO farm_plot_type (id, name, description, farm_plot_level, parent_id) VALUES
(11, 'Орошаемое поле', 'Поле с системой капельного или дождевального орошения', 2, 1),
(12, 'Богарное поле', 'Поле без искусственного орошения', 2, 1),
(13, 'Зерновое поле', 'Поле, специализированное для зерновых культур', 2, 1);

	-- специализации для теплиц (parent_id = 2)
INSERT INTO farm_plot_type (id, name, description, farm_plot_level, parent_id) VALUES
(21, 'Стеклянная теплица', 'Капитальная теплица из стекла', 2, 2),
(22, 'Пленочная теплица', 'Сезонная теплица из полиэтиленовой плёнки', 2, 2);

	-- специализации для пастбищ (parent_id = 3)
INSERT INTO farm_plot_type (id, name, description, farm_plot_level, parent_id) VALUES
(31, 'Культурное пастбище', 'Пастбище с посевными травами', 2, 3),
(32, 'Естественное пастбище', 'Природное пастбище', 2, 3);

	-- более детальные типы орошаемых полей (parent_id = 11)
INSERT INTO farm_plot_type (id, name, description, farm_plot_level, parent_id) VALUES
(111, 'Капельное орошение', 'Поле с системой капельного полива', 3, 11),
(112, 'Дождевальное орошение', 'Поле с дождевальными установками', 3, 11);


/*=====================================================
2. Запросы на получение
=======================================================*/

-- "стухшие" заявки на продажу
SELECT *
FROM sales_requisition  as sr
WHERE sr.valid_until < CURDATE()
order by sr.valid_until;

-- "стухшие" заявки на покупку
SELECT *
FROM purchase_requisition  as pr
WHERE pr.valid_until < CURDATE()
order by pr.valid_until;


-- действующие фермы действующие на данный момент в ассциацииассцоиации
SELECT f.id as ID, f.leagal_name as `name`, af.notes as notes
FROM association_farms as af
JOIN farm as f on af.farm_id = f.id
WHERE af.`status` = "active" and f.`status` = "active";

-- действующие фермы не действующие на данный момент в ассциацииассцоиации
SELECT f.id as ID, f.leagal_name as `name`, af.notes as notes
FROM association_farms as af
JOIN farm as f on af.farm_id = f.id
WHERE af.`status` in ("inactive", "suspended") and f.`status` = "active";

