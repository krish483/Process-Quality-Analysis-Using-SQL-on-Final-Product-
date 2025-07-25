
-- Create database and use it
CREATE DATABASE IF NOT EXISTS ProcessQualityDB;
USE ProcessQualityDB;

-- Create table
CREATE TABLE ProductQuality (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cast_id VARCHAR(20),
    section INT,
    grade VARCHAR(50),
    shift CHAR(1),
    sample_time DATETIME,
    line CHAR(1),
    sampling_condition VARCHAR(100),
    ys FLOAT,
    uts FLOAT,
    uts_ys FLOAT,
    surface_inspection VARCHAR(50)
);

-- Insert sample data
INSERT INTO ProductQuality (
    cast_id, section, grade, shift, sample_time, line,
    sampling_condition, ys, uts, uts_ys, surface_inspection
) VALUES
('M70156', 16, 'FE550 D', 'C', '2025-01-01 00:20:00', 'A', 'Regular Sample', 590.0, 693.0, 1.175, 'Ok'),
('M70156', 16, 'FE550 D', 'C', '2025-01-01 00:20:00', 'B', 'Regular Sample', 612.0, 715.0, 1.168, 'Ok'),
('M70159', 16, 'FE550 D', 'C', '2025-01-01 01:20:00', 'A', 'Regular Sample', 598.0, 699.0, 1.169, 'Ok'),
('M70159', 16, 'FE550 D', 'C', '2025-01-01 01:20:00', 'B', 'Regular Sample', 607.0, 706.0, 1.162, 'Ok'),
('M70160', 16, 'FE550 D', 'C', '2025-01-01 01:50:00', 'A', 'Regular Sample', 614.0, 709.0, 1.155, 'Ok');
