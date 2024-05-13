CREATE TABLE `JauntyCoffeeCo.`.`EMPLOYEE`(
	`employee_id` INT NOT NULL,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `hire_date` DATE NOT NULL,
    `job_title` VARCHAR(30) NOT NULL,
    `shop_id` INT NOT NULL,
    PRIMARY KEY (`employee_id`),
    FOREIGN KEY (`shop_id`) REFERENCES COFFEE_SHOP(shop_id));

CREATE TABLE `JauntyCoffeeCo.`.`COFFEE_SHOP`(
	`shop_id` INT NOT NULL,
    `shop_name` VARCHAR(50) NOT NULL,
    `city` VARCHAR(50) NOT NULL,
    `state` CHAR(2) NOT NULL,
    PRIMARY KEY (`shop_id`));

CREATE TABLE `JauntyCoffeeCo.`.`COFFEE`(
	`coffee_id` INT NOT NULL,
	`shop_id` INT NOT NULL,
    `supplier_id` INT NOT NULL,
    `coffee_name` VARCHAR(30) NOT NULL,
    `price_per_pound` NUMERIC(5,2) NOT NULL,
    PRIMARY KEY (`coffee_id`),
    FOREIGN KEY (`shop_id`) REFERENCES COFFEE_SHOP(shop_id),
    FOREIGN KEY (`supplier_id`) REFERENCES SUPPLIER(supplier_id));

CREATE TABLE `JauntyCoffeeCo.`.`SUPPLIER`(
	`supplier_id` INT NOT NULL,
    `company_name` VARCHAR(50) NOT NULL,
    `country` VARCHAR(30) NOT NULL,
    `sales_contact_name` VARCHAR(60) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`supplier_id`));

-- Inserting Data into tables
INSERT INTO EMPLOYEE
	(employee_id, first_name, last_name, hire_date, job_title, shop_id)
VALUES
	(100, 'karen', 'perdue', '2017-07-16', 'graphic_designer', 1 ),
    (101, 'wayne', 'rodriquez', '2017-11-05', 'barista', 1),
    (102, 'thomas', 'lowery', '2018-03-21', 'barista', 1),
    (103, 'samantha', 'delgado', '2016-04-19', 'cashier', 1),
    (104, 'maggie', 'rondeau', '2016-03-06', 'manager', 1);
    
INSERT INTO COFFEE_SHOP
	(shop_id, shop_name, city, state)
VALUES
	(1, 'jaunty_coffee_co', 'sterling', 'mi');

INSERT INTO COFFEE
	(coffee_id, shop_id, supplier_id, coffee_name, price_per_pound)
VALUES
	(01, 1, 001, 'java_chip', 1.50),
    (02, 5, 002, 'french_vanilla', 1.00),
    (03, 4, 003, 'mocha', 1.25),
    (04, 3, 003, 'caramel', 1.25),
    (05, 1, 004, 'hazelnut', 1.00),
    (06, 2, 004, 'peppermint', 1.50),
    (07, 2, 004, 'cinnamon', 1.50),
    (08, 1, 004, 'pumpkin_spice', 1.50);
    
INSERT INTO SUPPLIER
	(supplier_id, company_name, country, sales_contact_name, email)
VALUES
	(001, 'coffee_co.', 'united_states', 'clarence', 'coffee_co@gmail.com'),
    (002, 'rise_&_shine_co.', 'united_states', 'carol', 'rise&shine@gmail.com'),
    (003, 'east_espresso.', 'united_kingdom', 'jeremy', 'eespressoo@gmail.com'),
    (004, 'viva_coco', 'costa_rica', 'jose', 'viva_coco@gmail.com');
    

CREATE VIEW employee_view AS
SELECT 
	employee_id, 
	CONCAT(first_name,' ', last_name) AS employee_full_name,
	hire_date,
	job_title
    FROM employee;

SELECT *
FROM employee_view;

-- Creating an index for the coffee_name field from the COFFEE table
CREATE INDEX coffee_name_index
ON COFFEE (coffee_name);

SHOW INDEX
FROM COFFEE;

-- Create an SFW query
SELECT *
FROM EMPLOYEE
WHERE hire_date > '2017-01-01';

-- Create a table join query, consisting of three different tables
SELECT 
	COFFEE.supplier_id,
	COFFEE.shop_id,
    SUPPLIER.company_name,
    COFFEE_SHOP.shop_name
FROM COFFEE
INNER JOIN SUPPLIER
ON COFFEE.supplier_id = SUPPLIER.supplier_id
INNER JOIN COFFEE_SHOP
ON COFFEE.shop_id = COFFEE_SHOP.shop_id;





