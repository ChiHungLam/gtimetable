DROP DATABASE IF EXISTS gtt
CREATE DATABASE gtt
USE gtt;
CREATE TABLE Type(type_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, type_name VARCHAR(100) NOT NULL);
CREATE TABLE Line (line_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, line_name VARCHAR(5) NOT NULL, version_id INT NOT NULL, version_name VARCHAR(100) NOT NULL, type_id INT UNSIGNED NOT NULL, valid_from DATE, valid_to DATE, FOREIGN KEY(type_id) REFERENCES Type(type_id) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE Stop( stop_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, zdik_id VARCHAR(10) NOT NULL UNIQUE,lat DOUBLE ,lng DOUBLE ,stop_name VARCHAR(100) NOT NULL,street VARCHAR(100) NOT NULL,features VARCHAR(100));
CREATE TABLE Note(note_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,note_code VARCHAR(10) NOT NULL,note_mean VARCHAR(300) NOT NULL);
CREATE TABLE Day(day_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, day_name VARCHAR(200) NOT NULL);
CREATE TABLE Timetable(event_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, line_id INT UNSIGNED NOT NULL,stop_id INT UNSIGNED NOT NULL, stop_number INT UNSIGNED NOT NULL,departuretime TIME,day_id INT UNSIGNED,FOREIGN KEY(day_id) REFERENCES Day(day_id) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY(line_id) REFERENCES Line(line_id) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY(stop_id) REFERENCES Stop(stop_id) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE Mark(event_id INT UNSIGNED NOT NULL,note_id INT UNSIGNED NOT NULL,PRIMARY KEY(event_id, note_id), FOREIGN KEY(note_id) REFERENCES Note(note_id) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY(event_id) REFERENCES Timetable(event_id) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE Graph(graph_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, ps_id INT UNSIGNED NOT NULL, pe_id INT UNSIGNED NOT NULL, line_id INT UNSIGNED NOT NULL, weight DOUBLE NOT NULL, type_id INT  UNSIGNED NOT NULL, FOREIGN KEY(ps_id) REFERENCES Stop(stop_id), FOREIGN KEY(pe_id) REFERENCES Stop(stop_id),FOREIGN KEY(line_id) REFERENCES Line(line_id), FOREIGN KEY(type_id) REFERENCES Type(type_id))