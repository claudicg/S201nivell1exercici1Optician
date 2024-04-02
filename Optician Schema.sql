DROP DATABASE IF EXISTS optician;

CREATE DATABASE optician CHARACTER SET utf8mb4;

USE optician;

CREATE TABLE addresses	(
	address_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    road_type ENUM('Street', 'Avenue', 'Square') NOT NULL,
    road_name VARCHAR(50) NOT NULL,
    road_number INT UNSIGNED NOT NULL,
    floor INT NOT NULL,
    door VARCHAR(6) NOT NULL,
    postcode INT NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE suppliers	(
	supplier_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    supplier_name VARCHAR(50) NOT NULL,
    address_id INT UNSIGNED NOT NULL,
    telephone INT NOT NULL,
    fax INT NOT NULL,
    documentId VARCHAR(15) NOT NULL UNIQUE,
    FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);


CREATE TABLE customers	(
	customer_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	customer_name VARCHAR(50) NOT NULL,
    customer_lastname VARCHAR(50) NOT NULL,
    address_id INT UNSIGNED NOT NULL,
	telephone INT NOT NULL,
	email VARCHAR(50) NOT NULL,
	register_date DATE NOT NULL,
	referred_by INT NOT NULL,
	FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);

CREATE TABLE brands 	(
	brand_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    supplier_id INT UNSIGNED NOT NULL,
    UNIQUE(brand_name, model),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE glasses	(
	glasses_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	brand_id INT UNSIGNED NOT NULL,
    right_lense_graduation FLOAT NOT NULL,
    left_lense_graduation FLOAT NOT NULL,
    frame_type ENUM('metal', 'plaster', 'floating') NOT NULL,
    frame_colour VARCHAR(30),
    right_lense_colour VARCHAR(15) NOT NULL,
    left_lense_colour VARCHAR(15) NOT NULL,
    price FLOAT NOT NULL ,
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);

CREATE TABLE employees	(
	employee_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    employee_name VARCHAR(25) NOT NULL,
    employee_lastname VARCHAR(35) NOT NULL
);

CREATE TABLE sales 	(
	sale_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    customer_id INT UNSIGNED NOT NULL,
    employee_id INT UNSIGNED NOT NULL,
    glasses_id INT UNSIGNED NOT NULL,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
	FOREIGN KEY (glasses_id) REFERENCES glasses(glasses_id)
);

/* addresses */

INSERT INTO addresses(road_type, road_name, road_number, floor, door, postcode, city, country)
VALUES ('Street', 'Arago', 324, 0, '', 08007, 'Barcelona', 'Spain');
INSERT INTO addresses(road_type, road_name, road_number, floor, door, postcode, city, country)
VALUES ('Avenue', 'Via Augusta', 180, 1, 'D', 08007, 'Barcelona', 'Spain');
INSERT INTO addresses(road_type, road_name, road_number, floor, door, postcode, city, country)
VALUES ('Square', 'Olavide', 8, 2, '3C', 28010, 'Madrid', 'Spain');
INSERT INTO addresses(road_type, road_name, road_number, floor, door, postcode, city, country)
VALUES ('Street', 'Valencia', 451, 2, 3, 08007, 'Barcelona', 'Spain');
INSERT INTO addresses(road_type, road_name, road_number, floor, door, postcode, city, country)
VALUES ('Avenue', 'Diagonal', 765, 4, 2, 08012, 'Barcelona', 'Spain');
INSERT INTO addresses(road_type, road_name, road_number, floor, door, postcode, city, country)
VALUES ('Street', 'Arago', 587, 1, 4, 08007, 'Barcelona', 'Spain');
INSERT INTO addresses(road_type, road_name, road_number, floor, door, postcode, city, country)
VALUES ('Square', 'Letamendi', 25, 3, 1, 08011, 'Barcelona', 'Spain');
INSERT INTO addresses(road_type, road_name, road_number, floor, door, postcode, city, country)
VALUES ('Street', 'Valencia', 345, 3, 2, 08011, 'Barcelona',  'Spain');
INSERT INTO addresses(road_type, road_name, road_number, floor, door, postcode, city, country)
VALUES('Street', 'Mallorca', 297, 2, 2, 08007, 'Barcelona', 'Spain');

/* suppliers*/

INSERT INTO suppliers (supplier_name, address_id , telephone, fax, documentId) VALUES ('Multiglasses', 1 , 695273649, 934235285, 'B7805452');
INSERT INTO suppliers (supplier_name, address_id , telephone, fax, documentId) VALUES ('Gafas2000', 2,  669473923, 934325698, 'A4870759');
INSERT INTO suppliers (supplier_name, address_id , telephone, fax, documentId) VALUES ('MadridVision', 3 ,654784129, 912807635, 'V58406190');


/* customers */

INSERT INTO customers(customer_name, customer_lastname, address_id, telephone, email, register_date, referred_by) 
VALUES ('Sara', 'Lorenzo', 4, 695289453, 'lorenzo.sara@gmail.com', '2022-04-23', 0);
INSERT INTO customers(customer_name, customer_lastname, address_id, telephone, email, register_date, referred_by)
VALUES ('Antonio', 'Salgado', 5, 669737246, 'antonio.salgado75@hotmail.com', '2022-04-28', 1);
INSERT INTO customers(customer_name, customer_lastname, address_id, telephone, email, register_date, referred_by)
VALUES ('Pedro', 'Ruiz', 6, 607652987, 'ruiz.pedro2000@gmail.com', '2022-04-30', 1);
INSERT INTO customers(customer_name, customer_lastname, address_id, telephone, email, register_date, referred_by)
VALUES ('Maruja', 'Saavedra', 7, 645372819, 'saavedra.maruja@gmail.com', '2022-05-02', 3);
INSERT INTO customers(customer_name, customer_lastname, address_id, telephone, email, register_date, referred_by)
VALUES ('Carlos', 'Cañabate', 8, 695673919, 'cañabate.carles@hotmail.com', '2022-05-03', 1);
INSERT INTO customers(customer_name, customer_lastname, address_id, telephone, email, register_date, referred_by)
VALUES ('Ana', 'Santos', 9, 657823467, 'santos.ana85@.gmail.com', '2022-05-04', 1);

/* brands */

INSERT INTO brands( brand_name, model, supplier_id) VALUES('Ray Ban', 'Original Wayferer Classic', 1) ;
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Ray Ban', 'RB2180', 1);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Ray Ban', 'New Caravan', 1);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Ray Ban', 'Aviator Classic', 1);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Etnia Barcelona', 'Posidonia', 1);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Etnia Barcelona', 'Cadaques BK', 1);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Etnia Barcelona', 'Brutal', 1);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Tom Ford', 'Fausto FT0711', 2);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Tom Ford', 'FT0613', 2);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Silhouette', '5599-NV', 2);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Hugo','HG 1291', 2);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Eschenbach', '820908', 3);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Eschenbach', '820876', 3);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Mikita', 'Imba', 3);
INSERT INTO brands( brand_name, model, supplier_id) VALUES('Mikita', 'Santana', 3);

/* glasses */

INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (1 , 0, 0, 'plaster', 'Black', 'Transparent', 'Trasparent', 155);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (2 , 0, 0, 'plaster', 'Bronw', 'Brown', 'Bronw', 145);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (3 , 0, 0, 'metal', 'Gold', 'Green', 'Green', 195);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (4 , 0, 0, 'metal', 'Silver', 'Grey', 'Grey', 155);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (5 , 0, 0, 'plaster', 'Red', 'Transparent', 'Transparent', 149);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (6 , 0, 0, 'plaster', 'Blue', 'Transparent', 'Trasparent', 159);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (7 , 0, 0, 'plaster', 'Green', 'Transparent', 'Trasparent', 175);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (8 , 0, 0, 'plaster', 'Black', 'Dark', 'Dark', 295);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (9 , 0, 0, 'plaster', 'Rose', 'Brown', 'Brown', 290);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (10 , 0, 0, 'floating', 'No colour', 'Transparent', 'Transparent', 358.20); 
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (11 , 0, 0, 'floating', 'Black', 'Transparent', 'Transparent', 150);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (12 , 0, 0, 'metal', 'Black', 'Transparent', 'Transparent', 234.90);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (13 , 0, 0, 'metal', 'Blue', 'Transparent', 'Transparent', 224.90);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (14 , 0, 0, 'metal', 'Gold/Jet Black', 'Transparent', 'Transparent', 659);
INSERT INTO glasses(brand_id, right_lense_graduation, left_lense_graduation, frame_type, frame_colour, right_lense_colour, left_lense_colour, price)
VALUES (15 , 0, 0, 'metal', 'Shiny Silver', 'Grey Gradient', 'Grey Gradient', 619);

/* employees*/

INSERT INTO employees(employee_name, employee_lastname) VALUES ('Oriol', 'Rosell');
INSERT INTO employees(employee_name, employee_lastname) VALUES ('Alba', 'Rosell');

/* sales */

INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (1, 1, 8, '2022-04-23');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (2, 2, 7, '2022-04-28');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (3, 2, 2, '2022-04-30');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (4, 1, 6, '2022-05-02');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (5, 1, 2, '2022-05-03');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (6, 1, 8, '2022-05-04');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (3, 2, 15, '2022-05-21');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (1, 1, 10, '2022-06-01');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (4, 1, 5, '2022-06-04');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (2, 2, 14, '2022-06-15');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (3, 2, 1, '2022-06-16');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (6, 1, 1, '2022-06-18');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (4, 1, 9, '2022-07-21');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (5, 1, 8, '2022-07-30');
INSERT INTO sales(customer_id, employee_id, glasses_id, purchase_date) VALUES (3, 2, 6, '2022-08-02');

/* Queries*/

SELECT COUNT(sale_id)
FROM sales 
WHERE customer_id = 1
AND purchase_date BETWEEN '2022-04-23' AND '2022-08-02';

SELECT DISTINCT b.model, b.brand_name 
FROM brands AS b, glasses AS g, sales AS s
WHERE s.employee_id = 2
AND purchase_date BETWEEN '2022-01-01' AND '2022-12-31'
AND g.glasses_id = s.glasses_id
AND b.brand_id = g.brand_id;

SELECT DISTINCT s.supplier_id, s.supplier_name
FROM suppliers s
WHERE s.supplier_id IN (
			SELECT b.supplier_id
            FROM brands b
            WHERE b.brand_id IN (
					SELECT g.brand_id
                    FROM glasses g, sales sl
                    WHERE g.glasses_id = sl.glasses_id));