CREATE SCHEMA IF NOT EXISTS farm_association
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

USE farm_association;

/*=================================
1. Справочники (независимые таблицы)
===================================*/

-- Единицы измерения
CREATE TABLE unit (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10) NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- Типы документов, удостоверяющих личность
CREATE TABLE identity_document_type (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    description varchar(255)
);

-- Должности роли в ассоциации
CREATE TABLE association_role (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    description varchar(255)
);

-- Должности/роли на ферме
CREATE TABLE farm_role (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description varchar(255)
);

-- Статусы занятости
CREATE TABLE employment_status (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

-- Типы продукции (самостоятельная иерархия)
CREATE TABLE product_type (
    id INT UNSIGNED PRIMARY KEY,
    parent_id INT UNSIGNED,
    sku VARCHAR(128) NOT NULL unique,
    product_level INT UNSIGNED NOT NULL,
    name VARCHAR(128) NOT NULL,
    description VARCHAR(255)
);

-- Типы фермерских участков (самостоятельная иерархия)
CREATE TABLE farm_plot_type (
    id INT UNSIGNED PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    description VARCHAR(255),
    farm_plot_level INT UNSIGNED NOT NULL,
    parent_id INT UNSIGNED
);

/*=================================
2. Основные сущности (не зависят от других, кроме справочников)
===================================*/

-- Физические лица
CREATE TABLE person (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    birth_date DATE,
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(300)
);

-- Фермерская ассоциация
CREATE TABLE farm_association (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    inn VARCHAR(12) NOT NULL,
    ogrn VARCHAR(15) NOT NULL,
    name VARCHAR(200) NOT NULL,
    legal_address VARCHAR(300),
    status ENUM('active', 'inactive', 'suspended', 'archived') NOT NULL DEFAULT 'active'
);

-- Ферма (хозяйство)
CREATE TABLE farm (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    legal_name VARCHAR(200),
    legal_address VARCHAR(300) NOT NULL,
    actual_address VARCHAR(300),
    inn VARCHAR(12),
    ogrn VARCHAR(15),
    status ENUM('active', 'inactive', 'suspended', 'archived') NOT NULL DEFAULT 'active',
    farm_type ENUM('peasant_farm', 'llc', 'individual_entrepreneur', 'personal_subsidiary') NOT NULL DEFAULT 'peasant_farm'
);

-- Поставщики
CREATE TABLE supplier (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    legal_address VARCHAR(300),
    status ENUM('active', 'inactive', 'suspended', 'archived') NOT NULL DEFAULT 'active'
);

/*=================================
3. Документы и члены (зависят от person и справочников)
===================================*/

-- Документы, удостоверяющие личность
CREATE TABLE person_document (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    person_id INT UNSIGNED NOT NULL,
    document_type_id TINYINT UNSIGNED NOT NULL,
    document_number VARCHAR(50) NOT NULL,
    issued_by VARCHAR(200),
    issued_date DATE,
    expiration_date DATE,
    is_primary BOOLEAN,
    CONSTRAINT fk_person_document_person FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE,
    CONSTRAINT fk_person_document_type FOREIGN KEY (document_type_id) REFERENCES identity_document_type(id)
);

-- Члены ассоциации
CREATE TABLE association_member (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    association_id INT UNSIGNED NOT NULL,
    person_id INT UNSIGNED NOT NULL,
    membership_number VARCHAR(20) NOT NULL,
    joined_date DATE NOT NULL,
    status ENUM('active', 'inactive', 'expelled', 'deceased') NOT NULL DEFAULT 'active',
    notes TEXT,
    CONSTRAINT fk_member_association FOREIGN KEY (association_id) REFERENCES farm_association(id) ON DELETE CASCADE,
    CONSTRAINT fk_member_person FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE RESTRICT
);

-- Владельцы ферм
CREATE TABLE farm_owner (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    person_id INT UNSIGNED NOT NULL,
    status ENUM('active', 'inactive', 'archived') NOT NULL DEFAULT 'active',
    rating DECIMAL(5,2) UNSIGNED,
    CONSTRAINT fk_owner_person FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE RESTRICT
);

/*=================================
4. Продукция (зависит от product_type и unit)
===================================*/

CREATE TABLE product (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_id INT UNSIGNED NOT NULL,
    name VARCHAR(100) NOT NULL,
    unit_id TINYINT UNSIGNED,
    CONSTRAINT fk_product_type FOREIGN KEY (type_id) REFERENCES product_type(id),
    CONSTRAINT fk_product_unit FOREIGN KEY (unit_id) REFERENCES unit(id) ON DELETE SET NULL
);

/*=================================
5. Работники и участки
===================================*/

-- Фермерский участок
CREATE TABLE farm_plot (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    farm_plot_type_id INT UNSIGNED,
    name VARCHAR(100) NOT NULL,
    area DECIMAL(10,2) UNSIGNED,
    location VARCHAR(300),
    cadastral_number VARCHAR(50),
    status ENUM('active', 'inactive', 'suspended', 'archived') NOT NULL DEFAULT 'active',
    CONSTRAINT fk_farm_plot_type FOREIGN KEY (farm_plot_type_id) REFERENCES farm_plot_type(id)
);

-- Работники фермы
CREATE TABLE farm_employee (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    person_id INT UNSIGNED NOT NULL,
    farm_id INT UNSIGNED NOT NULL,
    role_id TINYINT UNSIGNED NOT NULL,
    employment_status_id TINYINT UNSIGNED NOT NULL,
    hire_date DATE NOT NULL,
    dismissal_date DATE,
    salary DECIMAL(10,2) UNSIGNED NOT NULL,
    employment_contract_number VARCHAR(50),
    is_primary_workplace BOOLEAN,
    CONSTRAINT fk_employee_person FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE RESTRICT,
    CONSTRAINT fk_employee_farm FOREIGN KEY (farm_id) REFERENCES farm(id) ON DELETE CASCADE,
    CONSTRAINT fk_employee_role FOREIGN KEY (role_id) REFERENCES farm_role(id),
    CONSTRAINT fk_employee_status FOREIGN KEY (employment_status_id) REFERENCES employment_status(id)
);

-- Работники ассоциации
CREATE TABLE association_employee (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    person_id INT UNSIGNED NOT NULL,
    association_id INT UNSIGNED NOT NULL,
    role_id TINYINT UNSIGNED NOT NULL,
    employment_status_id TINYINT UNSIGNED NOT NULL,
    hire_date DATE NOT NULL,
    dismissal_date DATE,
    salary DECIMAL(10,2) UNSIGNED,
    contract_number VARCHAR(50),
    CONSTRAINT fk_assoc_emp_person FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE RESTRICT,
    CONSTRAINT fk_assoc_emp_association FOREIGN KEY (association_id) REFERENCES farm_association(id) ON DELETE CASCADE,
    CONSTRAINT fk_assoc_emp_role FOREIGN KEY (role_id) REFERENCES association_role(id),
    CONSTRAINT fk_assoc_emp_status FOREIGN KEY (employment_status_id) REFERENCES employment_status(id)
);

-- Привязка работников к участкам
CREATE TABLE employee_plot_assignment (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    farm_employee_id INT UNSIGNED NOT NULL,
    farm_plot_id INT UNSIGNED NOT NULL,
    assignment_type ENUM('primary', 'secondary', 'temporary') NOT NULL DEFAULT 'primary',
    assigned_at DATE NOT NULL,
    unassigned_at DATE,
    notes TEXT,
    CONSTRAINT fk_assignment_employee FOREIGN KEY (farm_employee_id) REFERENCES farm_employee(id) ON DELETE CASCADE,
    CONSTRAINT fk_assignment_plot FOREIGN KEY (farm_plot_id) REFERENCES farm_plot(id) ON DELETE CASCADE
);

-- Привязка участков к фермам
CREATE TABLE farm_plot_assignment (
    farm_id INT UNSIGNED NOT NULL,
    farm_plot_id INT UNSIGNED NOT NULL,
    status ENUM('active', 'inactive', 'suspended') NOT NULL DEFAULT 'active',
    notes TEXT,
    CONSTRAINT pk_farm_plot PRIMARY KEY (farm_id, farm_plot_id),
    CONSTRAINT fk_farm_plot_farm FOREIGN KEY (farm_id) REFERENCES farm(id) ON DELETE CASCADE,
    CONSTRAINT fk_farm_plot_plot FOREIGN KEY (farm_plot_id) REFERENCES farm_plot(id) ON DELETE CASCADE
);

-- Привязка ферм к ассоциациям
CREATE TABLE association_farms (
    farm_id INT UNSIGNED NOT NULL,
    association_id INT UNSIGNED NOT NULL,
    join_date DATE NOT NULL,
    status ENUM('active', 'inactive', 'suspended') NOT NULL DEFAULT 'active',
    notes TEXT,
    CONSTRAINT pk_association_farm PRIMARY KEY(farm_id, association_id),
    CONSTRAINT fk_association_af FOREIGN KEY (association_id) REFERENCES farm_association(id) ON DELETE CASCADE,
    CONSTRAINT fk_farm_af FOREIGN KEY (farm_id) REFERENCES farm(id) ON DELETE CASCADE
);

-- Связь фермы с владельцами
CREATE TABLE farm_ownership (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    farm_id INT UNSIGNED NOT NULL,
    farm_owner_id INT UNSIGNED NOT NULL,
    ownership_percentage DECIMAL(5,2) UNSIGNED NOT NULL,
    started_at DATE NOT NULL,
    ended_at DATE,
    CONSTRAINT fk_ownership_farm FOREIGN KEY (farm_id) REFERENCES farm(id) ON DELETE CASCADE,
    CONSTRAINT fk_ownership_owner FOREIGN KEY (farm_owner_id) REFERENCES farm_owner(id) ON DELETE RESTRICT
);

/*=================================
6. Продукция на участках (производство/потребление)
===================================*/

CREATE TABLE farm_plot_production_product (
    product_id INT UNSIGNED NOT NULL,
    farm_plot_id INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    production_now BOOLEAN NOT NULL,
    CONSTRAINT pk_production PRIMARY KEY (product_id, farm_plot_id),
    CONSTRAINT fk_production_product FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    CONSTRAINT fk_production_plot FOREIGN KEY (farm_plot_id) REFERENCES farm_plot(id) ON DELETE CASCADE
);

CREATE TABLE farm_plot_consumption_product (
    product_id INT UNSIGNED NOT NULL,
    farm_plot_id INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    consumption_now BOOLEAN NOT NULL,
    CONSTRAINT pk_consumption PRIMARY KEY (product_id, farm_plot_id),
    CONSTRAINT fk_consumption_product FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    CONSTRAINT fk_consumption_plot FOREIGN KEY (farm_plot_id) REFERENCES farm_plot(id) ON DELETE CASCADE
);

/*=================================
7. Цены поставщиков и контракты
===================================*/

CREATE TABLE supplier_product_price (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    purchase_price DECIMAL(10,2) UNSIGNED NOT NULL,
    valid_from DATE NOT NULL,
    valid_until DATE,
    CONSTRAINT fk_supplier_spp FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON DELETE CASCADE,
    CONSTRAINT fk_product_spp FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE contract (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT UNSIGNED,
    farm_id INT UNSIGNED,
    association_id INT UNSIGNED NOT NULL,
    contract_number VARCHAR(50) NOT NULL,
    sign_date DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status ENUM('active', 'expired', 'terminated') NOT NULL DEFAULT 'active',
    description VARCHAR(255),
    CONSTRAINT fk_contract_supplier FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON DELETE SET NULL,
    CONSTRAINT fk_contract_farm FOREIGN KEY (farm_id) REFERENCES farm(id) ON DELETE SET NULL,
    CONSTRAINT fk_contract_association FOREIGN KEY (association_id) REFERENCES farm_association(id) ON DELETE CASCADE
);

/*=================================
8. Заказы и заявки
===================================*/

CREATE TABLE purchase_order (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    association_id INT UNSIGNED NOT NULL,
    supplier_id INT UNSIGNED NOT NULL,
    delivery_address VARCHAR(300) NOT NULL,
    order_date DATE NOT NULL,
    expected_delivery_date DATE,
    status ENUM('draft', 'sent', 'received', 'cancelled', 'archived') NOT NULL DEFAULT 'draft',
    total_amount DECIMAL(12,2) UNSIGNED,
    received_at DATE,
    created_by INT UNSIGNED,
    CONSTRAINT fk_association_order FOREIGN KEY (association_id) REFERENCES farm_association(id) ON DELETE RESTRICT,
    CONSTRAINT fk_supplier_order FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON DELETE RESTRICT,
    CONSTRAINT fk_order_creator FOREIGN KEY (created_by) REFERENCES person(id) ON DELETE SET NULL
);

CREATE TABLE purchase_order_item (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    purchase_order_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    quantity DECIMAL(12,3) UNSIGNED NOT NULL,
    unit_price DECIMAL(10,2) UNSIGNED NOT NULL,
    vat_rate DECIMAL(4,2) UNSIGNED,
    currency VARCHAR(3),
    CONSTRAINT fk_purchase_order_item FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id) ON DELETE CASCADE,
    CONSTRAINT fk_product_item FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE RESTRICT
);

CREATE TABLE purchase_requisition (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    farm_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    max_price_per_unit DECIMAL(12,2),
    offer_date DATE,
    required_date DATE,
    priority INT UNSIGNED,
    valid_until DATE,
    status ENUM('draft', 'delivering', 'approved', 'completed', 'cancelled') NOT NULL DEFAULT 'draft',
    notes TEXT,
    CONSTRAINT fk_requisition_farm FOREIGN KEY (farm_id) REFERENCES farm(id) ON DELETE CASCADE,
    CONSTRAINT fk_requisition_product FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE RESTRICT
);

CREATE TABLE sales_requisition (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    farm_id INT UNSIGNED,
    product_id INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    price_per_unit DECIMAL(12,2) UNSIGNED NOT NULL,
    offer_date DATE NOT NULL,
    valid_until DATE,
    status ENUM('draft', 'approved', 'delivering', 'completed', 'cancelled') NOT NULL DEFAULT 'draft',
    notes TEXT,
    CONSTRAINT fk_sales_farm FOREIGN KEY (farm_id) REFERENCES farm(id) ON DELETE CASCADE,
    CONSTRAINT fk_sales_product FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE RESTRICT
);