DROP TABLE studd;

CREATE TABLE studd(
  id SERIAL PRIMARY KEY NOT NULL,
  sname VARCHAR(225) NOT NULL,
  course VARCHAR(225) NOT NULL,
  fee VARCHAR(225) NOT NULL
);