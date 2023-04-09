CREATE DATABASE IF NOT EXISTS airport;

use airport;

-- створення таблиць

CREATE TABLE IF NOT EXISTS planes (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  board_number VARCHAR(10) UNIQUE NOT NULL,
  model VARCHAR(50) NOT NULL,
  worked_hours INTEGER,
  seats INTEGER,
  capacity INTEGER
);

CREATE TABLE IF NOT EXISTS flights (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  departure_point VARCHAR(50) NOT NULL,
  destination_point VARCHAR(50) NOT NULL,
  departure_time TIMESTAMP NOT NULL,
  landing_time TIMESTAMP NOT NULL,
  plane_id INTEGER NOT NULL,
  sold_tickets_number INTEGER,
  FOREIGN KEY (plane_id) REFERENCES planes(id)
);

CREATE TABLE IF NOT EXISTS crew_members (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  last_name VARCHAR(50) NOT NULL,
  birth_date DATE NOT NULL,
  address VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS pilots (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  crew_member_id INTEGER UNIQUE NOT NULL,
  allowed_planes VARCHAR(100),
  last_flight_date TIMESTAMP,
  FOREIGN KEY (crew_member_id) REFERENCES crew_members(id)
);

CREATE TABLE IF NOT EXISTS flight_crew (
  flight_id INTEGER NOT NULL,
  crew_member_id INTEGER NOT NULL,
  PRIMARY KEY (flight_id, crew_member_id),
  FOREIGN KEY (flight_id) REFERENCES flights(id),
  FOREIGN KEY (crew_member_id) REFERENCES crew_members(id)
);

-- додавання даних

-- INSERT INTO planes (board_number, model, worked_hours, seats, capacity)
-- VALUES 
-- ('AA101', 'Boeing 737', 12000, 150, 5000),
-- ('AA102', 'Boeing 737', 10000, 150, 5000),
-- ('AA103', 'Airbus A320', 8000, 180, 6000),
-- ('AA104', 'Airbus A320', 9000, 180, 6000),
-- ('AA105', 'Boeing 787', 5000, 250, 8000),
-- ('AA106', 'Boeing 787', 6000, 250, 8000),
-- ('AA107', 'Airbus A380', 3000, 500, 10000),
-- ('AA108', 'Airbus A380', 3500, 500, 10000);

-- INSERT INTO flights (departure_point, destination_point, departure_time, landing_time, plane_id, sold_tickets_number)
-- VALUES
-- ('Kyiv', 'Paris', '2023-03-20 15:00:00', '2023-03-20 18:00:00', 1, 100),
-- ('Paris', 'Kyiv', '2023-03-21 12:00:00', '2023-03-21 15:00:00', 1, 90),
-- ('Kyiv', 'Amsterdam', '2023-03-22 10:00:00', '2023-03-22 13:00:00', 3, 120),
-- ('Amsterdam', 'Kyiv', '2023-03-23 17:00:00', '2023-03-23 20:00:00', 3, 110),
-- ('Kyiv', 'New York', '2023-03-24 06:00:00', '2023-03-24 14:00:00', 5, 200),
-- ('New York', 'Kyiv', '2023-03-25 16:00:00', '2023-03-26 00:00:00', 5, 180);

-- INSERT INTO crew_members (last_name, birth_date, address)
-- VALUES
-- ('Bull', '1980-05-15', 'Kyiv, Ukraine'),
-- ('Whittaker', '1985-10-22', 'Kharkiv, Ukraine'),
-- ('Rees', '1992-03-05', 'Lviv, Ukraine'),
-- ('Peters', '1995-08-01', 'Odessa, Ukraine'),
-- ('Goodwin', '1998-12-18', 'Dnipro, Ukraine');

-- INSERT INTO pilots (crew_member_id, allowed_planes, last_flight_date)
-- VALUES 
--   (1, 'Boeing 737, Airbus A320', '2022-02-28 10:30:00'),
--   (2, 'Boeing 737, Boeing 777', '2022-03-01 15:45:00'),
--   (3, 'Airbus A320, Airbus A380', '2022-02-27 09:15:00');

-- INSERT INTO flight_crew (flight_id, crew_member_id)
-- VALUES 
--   (1, 1),
--   (1, 2),
--   (2, 2),
--   (3, 3),
--   (4, 1),
--   (4, 3),
--   (5, 1),
--   (5, 2),
--   (5, 3);

SELECT * FROM planes;

