-- make fake database
DROP DATABASE IF EXISTS fake_database;
CREATE DATABASE fake_database;
USE fake_database;
CREATE TABLE usage_hits (
  ID int,
  day date,
  hits varchar(255)
);
CREATE TABLE persons (ID int, name varchar(255));
CREATE TABLE deactivate (ID int);
INSERT INTO
  usage_hits (ID, day, hits)
VALUES
  (1, "2021-01-01", 5),
  (1, "2021-01-02", 3),
  (1, "2021-01-03", 1),
  (2, "2021-01-03", 10),
  (3, "2021-01-01", 1),
  (3, "2021-01-02", 1),
  (4, "2021-01-02", 1);
INSERT INTO
  persons (ID, name)
VALUES
  (1, "XX-person1"),
  (2, "XX-person2"),
  (3, "XX-person3"),
  (4, "XX-person4"),
  (999, "XX-person999");
INSERT INTO
  deactivate (ID)
VALUES
  (4);
