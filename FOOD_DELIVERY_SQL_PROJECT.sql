	CREATE DATABASE SWIGGY_DB;
    USE SWIGGY_DB;
    
DROP TABLE DELIVERY;
DROP TABLE CUSTOMERS;
DROP TABLE RESTAURANTS;
DROP TABLE RIDERS;
DROP TABLE ORDERS;

    -- SWIGGY DATA ANALYSIS USING SQL
CREATE TABLE CUSTOMERS(
	customer_ID INT PRIMARY KEY,
	customer_Name VARCHAR(25),
	reg_Date DATE);
        

CREATE TABLE RESTAURANTS(
	restaurant_id INT PRIMARY KEY,
	restaurant_name VARCHAR(50),
	city VARCHAR(25),
	opening_hours VARCHAR(50));

CREATE TABLE ORDERS(    -- parent tables
	order_id INT PRIMARY KEY,
	customer_id INT  , -- foreign key from customers
	restaurant_id INT, -- foreign key from restaurants
	order_item VARCHAR(50),
	order_date DATE,
	order_time TIME,
	order_status VARCHAR(50),
	total_amount FLOAT);
    
ALTER TABLE ORDERS
ADD CONSTRAINT foreignKEY_CUSTOMER_ID
FOREIGN KEY(CUSTOMER_ID)
REFERENCES CUSTOMERS(CUSTOMER_ID);

ALTER TABLE ORDERS 
ADD CONSTRAINT FOR_KEY_RESTAURANT_ID
FOREIGN KEY(RESTAURANT_ID)
REFERENCES RESTAURANTS(RESTAURANT_ID);

CREATE TABLE RIDERS(
	rider_id INT PRIMARY KEY,
	rider_name VARCHAR(50),
	signup_date DATE);

CREATE TABLE DELIVERY(  		-- parent table
delivery_id INT PRIMARY KEY,
	order_id int,  				-- foreign key from orders
	delivery_status varchar(50),
	delivery_time time,
	rider_id int,				-- foreign key from riders 
    FOREIGN KEY(order_id) REFERENCES ORDERS(order_id),
	FOREIGN KEY(rider_id) REFERENCES riders(rider_id));


        
	
