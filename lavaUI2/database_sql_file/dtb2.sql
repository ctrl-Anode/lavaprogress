CREATE DATABASE gym_management;
USE gym_management;

CREATE TABLE members (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    membership_type VARCHAR(50),
    status VARCHAR(20)
);

CREATE TABLE classes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    schedule DATETIME,
    instructor VARCHAR(100),
    capacity INT,
    enrolled INT DEFAULT 0
);

CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    class_id INT,
    booking_date DATETIME,
    FOREIGN KEY (member_id) REFERENCES members(id),
    FOREIGN KEY (class_id) REFERENCES classes(id)
);

CREATE TABLE payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    payment_date DATETIME,
    amount DECIMAL(10, 2),
    receipt VARCHAR(255),
    status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES members(id)
);
