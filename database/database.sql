DROP DATABASE IF EXISTS contacts_app;

CREATE DATABASE IF NOT EXISTS contacts_app;
USE contacts_app;

CREATE TABLE IF NOT EXISTS users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(30) NOT NULL UNIQUE,
  password VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS groups_table (
  group_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS contacts(
  contact_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  telephonic_number VARCHAR(20) NOT NULL,
  email VARCHAR(30),
  user_id INT NOT NULL,
  group_id INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (group_id) REFERENCES groups_table(group_id)
);
