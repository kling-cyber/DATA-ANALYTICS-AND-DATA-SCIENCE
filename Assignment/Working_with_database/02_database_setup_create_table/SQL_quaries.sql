-- Q.1 & Q.2: Setup database
CREATE DATABASE foodie_app;
SHOW DATABASES;
USE foodie_app;

-- Q.3: Create restaurants table with fixed typo and decimal rating range
CREATE TABLE restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(50) NOT NULL,    -- Fixed typo 'cuisin'
    rating DECIMAL(3,1),             -- Fixed to support ratings like 4.5
    location VARCHAR(100) NOT NULL
);

-- Q.4: Create users table with optimal unique constraints and data types
CREATE TABLE users ( 
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone_number BIGINT NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
