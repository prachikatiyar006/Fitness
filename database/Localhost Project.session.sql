CREATE DATABASE fitness_db;
USE fitness_db;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password VARCHAR(100),
  role ENUM('ADMIN','TRAINER','USER')
);

CREATE TABLE workout_plans (
  plan_id INT AUTO_INCREMENT PRIMARY KEY,
  trainer_id INT,
  title VARCHAR(100),
  description TEXT,
  status ENUM('PENDING','APPROVED'),
  FOREIGN KEY (trainer_id) REFERENCES users(user_id)
);

CREATE TABLE progress (
  progress_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  weight FLOAT,
  measurements VARCHAR(100),
  entry_date DATE,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE messages (
  message_id INT AUTO_INCREMENT PRIMARY KEY,
  sender_id INT,
  receiver_id INT,
  message TEXT,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
