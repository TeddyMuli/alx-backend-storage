-- Create users table with a country field

CREATE TABLE IF NOT EXISTS users (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email varchar(255) NOT NULL UNIQUE,
  name varchar(255),
  country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
