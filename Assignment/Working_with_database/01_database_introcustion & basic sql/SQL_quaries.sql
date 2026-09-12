-- Create a new database named 'foodie_app' 
CREATE DATABASE foodie_app;
SHOW DATABASES ;
USE foodie_app;

CREATE TABLE restaurants (
id INT AUTO_INCREMENT PRIMARY KEY ,
name VARCHAR(100) NOT NULL,
cuisin VARCHAR(50) NOT NULL,
rating DECIMAL(2,2),
location VARCHAR(100) NOT NULL);

CREATE TABLE users( 
user_id INT AUTO_INCREMENT PRIMARY KEY ,
username VARCHAR(100) NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE ,
phone_number BIGINT NOT NULL UNIQUE ,
created_at DATETIME );