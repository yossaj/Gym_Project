DROP TABLE bookings;
DROP TABLE classes;
DROP TABLE members;


CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  registration_date VARCHAR(255),
  membership_type VARCHAR(255),
  pic_url VARCHAR(255)
);

CREATE TABLE classes(
  id SERIAL8 PRIMARY KEY,
  type VARCHAR(255),
  time TIME(1),
  date DATE,
  capacity INT8,
  tier VARCHAR(255)
);

CREATE TABLE bookings(
  id SERIAL8 PRIMARY KEY,
  class_id SERIAL8 REFERENCES classes(id) ON DELETE CASCADE,
  member_id SERIAL8 REFERENCES members(id) ON DELETE CASCADE
);
