	/*============================
	1. Вывести список незавершенных контрактов, привышающих дату выполнения более 10 дней (не вовремя + 10 дней вывести)
	==============================*/
	 SELECT
    id,
    contract_number,
    end_date,
    DATEDIFF(CURDATE(), end_date) AS overdue_days
FROM contract
WHERE status = 'active'
  AND end_date IS NOT NULL
  AND DATEDIFF(CURDATE(), end_date) > 10;
	/*============================
	2. Загрузка работников по каждому фермерскому хозяйству:
	 количество участков и их общей площади (с учетом занятости сотрудника)
	==============================*/
SELECT
    f.name AS farm,
    fe.id AS employee_id,
    COUNT(epa.farm_plot_id) AS plot_count,
    SUM(fp.area) AS total_area
FROM farm_employee fe
JOIN farm f ON f.id = fe.farm_id
LEFT JOIN employee_plot_assignment epa
    ON epa.farm_employee_id = fe.id
   AND epa.unassigned_at IS NULL
LEFT JOIN farm_plot fp
    ON fp.id = epa.farm_plot_id
GROUP BY f.name, fe.id;
	/*============================
	 3. Самые продуктивные участки (по количеству производимой продукции, с указанием наименования производимой продукции)
	==============================*/
SELECT
    fp.name AS plot_name,
    SUM(fpp.quantity) AS total_quantity,
    GROUP_CONCAT(p.name SEPARATOR ', ') AS products
FROM farm_plot_production_product fpp
JOIN farm_plot fp ON fp.id = fpp.farm_plot_id
JOIN product p ON p.id = fpp.product_id
where fpp.production_now = 1
GROUP BY fp.id, fp.name
ORDER BY total_quantity DESC;
	/*============================
	4. Владельцы ферм с долей более 50% и их рейтинг в ассоциации
	==============================*/
SELECT
    p.last_name,
    p.first_name,
    f.name AS farm_name,
    fo.ownership_percentage,
    ow.rating
FROM farm_ownership fo
JOIN farm_owner ow ON ow.id = fo.farm_owner_id
JOIN person p ON p.id = ow.person_id
JOIN farm f ON f.id = fo.farm_id
WHERE fo.ownership_percentage > 50;

	/*============================
	 5. Рейтинг поставщиков по надёжности (средняя просрочка и доля отменённых заказов)
	==============================*/
SELECT
    s.name,
    AVG(DATEDIFF(po.received_at, po.expected_delivery_date)) AS avg_delay,
    SUM(CASE WHEN po.status = 'cancelled' THEN 1 ELSE 0 END) / COUNT(*) AS cancel_rate
FROM supplier s
JOIN purchase_order po ON po.supplier_id = s.id
GROUP BY s.id, s.name
ORDER BY cancel_rate;
	/*============================
	 6. Средний возраст сотрудников по каждому ферм  хозяйству
	==============================*/
SELECT
    f.name,
    AVG(TIMESTAMPDIFF(YEAR, p.birth_date, CURDATE())) AS avg_age
FROM farm_employee fe
JOIN farm f ON f.id = fe.farm_id
JOIN person p ON p.id = fe.person_id
GROUP BY f.id, f.name;	
	/*============================
	 7. Общая площадь активных участков по типам (по хозяйству и ассоциации)
	==============================*/
     -- ХОЗЯЙСТВО
SELECT
    f.name AS farm_name,
    fpt.name AS plot_type,
    SUM(fp.area) AS total_area
FROM farm_plot_assignment fpa
JOIN farm f ON f.id = fpa.farm_id
JOIN farm_plot fp ON fp.id = fpa.farm_plot_id
JOIN farm_plot_type fpt ON fpt.id = fp.farm_plot_type_id
WHERE fpa.status = 'active'
  AND fp.status = 'active'
GROUP BY f.id, f.name, fpt.id, fpt.name;

 -- АССОЦИАЦИЯ
 SELECT
    fa.name AS association_name,
    fpt.name AS plot_type,
    SUM(fp.area) AS total_area
FROM association_farms af
JOIN farm_association fa ON fa.id = af.association_id
JOIN farm_plot_assignment fpa ON fpa.farm_id = af.farm_id
JOIN farm_plot fp ON fp.id = fpa.farm_plot_id
JOIN farm_plot_type fpt ON fpt.id = fp.farm_plot_type_id
WHERE af.status = 'active'
  AND fpa.status = 'active'
  AND fp.status = 'active'
GROUP BY fa.id, fa.name, fpt.id, fpt.name;

	 /*============================
	 8. Вывести список продавцов чью продукцию покупают другие участники фермерской ассциации
	 (название продукции, производитель(внутри ассоциации через запятую), покупатели (внутри ассоциации через запятую))
	==============================*/
SELECT
    p.name AS product_name,
    GROUP_CONCAT(DISTINCT fs.name SEPARATOR ', ') AS sellers,
    GROUP_CONCAT(DISTINCT fb.name SEPARATOR ', ') AS buyers
FROM sales_requisition sr
JOIN purchase_requisition pr ON pr.product_id = sr.product_id
JOIN farm fs ON fs.id = sr.farm_id
JOIN farm fb ON fb.id = pr.farm_id
JOIN product p ON p.id = sr.product_id
WHERE sr.farm_id <> pr.farm_id
GROUP BY p.id, p.name;

	 /*============================
	 9. Топ 3 месяца по объему заказов (импорта) ресурсов в хозяйства
	==============================*/
SELECT
    MONTH(po.order_date) AS month_num,
    SUM(po.total_amount) AS total_orders_amount
FROM purchase_order po
JOIN farm_association fa ON fa.id = po.association_id
JOIN association_farms af ON af.association_id = fa.id
WHERE af.status = 'active'
GROUP BY MONTH(po.order_date)
ORDER BY total_orders_amount DESC
LIMIT 3;
	 /*============================
	 10. Самая (топ 3) урожайная (количество/гектар) производимая продукция (по регионам)
	==============================*/
SELECT 
    TRIM(REPLACE(SUBSTRING_INDEX(location, ',', 1), 'г.', '')) AS region,
    p.name AS product_name,
    SUM(fpp.quantity) / SUM(fp.area) AS yield_per_hectare
FROM farm_plot_production_product fpp
JOIN farm_plot fp ON fp.id = fpp.farm_plot_id
JOIN product p ON p.id = fpp.product_id
GROUP BY region, p.id
ORDER BY yield_per_hectare DESC
LIMIT 3;