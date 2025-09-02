
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


-- Question 1 
-- Which grade has the highest average Yield Strength (YS)?

SELECT GRADE, AVG(YS) AS avg_ys
FROM NBM_Data
GROUP BY GRADE
ORDER BY avg_ys DESC
LIMIT 1;

-- Question 2 
-- What is the average UTS and YS per shift (A, B, C)?

SELECT SHIFT, AVG(YS) AS avg_ys, AVG(UTS) AS avg_uts
FROM NBM_Data
GROUP BY SHIFT;

--Question 3 
--Which line (A or B) produces higher strength on average?

SELECT LINE, AVG(YS) AS avg_ys, AVG(UTS) AS avg_uts
FROM NBM_Data
GROUP BY LINE;

--Question 4 
--How many samples had surface inspection issues (not 'Ok')?

SELECT COUNT(*) AS defect_count
FROM NBM_Data
WHERE SURFACE_INSPECTION <> 'Ok';

-- Question 5
--What is the trend of average UTS over months?

SELECT DATE_FORMAT(SAMPLE_TIME, '%Y-%m') AS month, AVG(UTS) AS avg_uts
FROM NBM_Data
GROUP BY month
ORDER BY month;


-- Question 6
--Which grade and section combination gives the highest UTS/YS ratio?

SELECT GRADE, SEC., AVG([UTS/YS]) AS avg_ratio
FROM NBM_Data
GROUP BY GRADE, SEC.
ORDER BY avg_ratio DESC
LIMIT 1;
-- Question 7
--How many samples were taken in each sampling condition?

SELECT SAMPLING_CONDITION, COUNT(*) AS sample_count
FROM NBM_Data
GROUP BY SAMPLING_CONDITION;


-- Question 8
--What is the distribution of defects across shifts?

SELECT SHIFT, COUNT(*) AS defect_count
FROM NBM_Data
WHERE SURFACE_INSPECTION <> 'Ok'
GROUP BY SHIFT;
    
-- Question 9
--Which cast ID had the highest UTS recorded?

SELECT CAST_ID, MAX(UTS) AS max_uts
FROM NBM_Data
GROUP BY CAST_ID
ORDER BY max_uts DESC
LIMIT 1;

-- Question 10
--Monthly defect percentage for each line (A/B)?

SELECT LINE,
       DATE_FORMAT(SAMPLE_TIME, '%Y-%m') AS month,
       COUNT(CASE WHEN SURFACE_INSPECTION <> 'Ok' THEN 1 END) * 100.0 / COUNT(*) AS defect_percentage
FROM NBM_Data
GROUP BY LINE, month
ORDER BY month, LINE;
