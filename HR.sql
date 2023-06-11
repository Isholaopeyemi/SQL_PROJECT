SELECT * FROM project.hr;

USE project;

SELECT * FROM hr;

 ====I used the codes to create visualizations in Power bi.
 
 
 ====THE FIRST 11 CODES WAS TO CHANGE_COLUMNS, UPDATE_COLUMNS, MODIFY_COLUMN,ALSO TO ADD_NEW_COLUMN===

ALTER TABLE hr CHANGE COLUMN ď»żid emp_id VARCHAR(30);

SET sql_safe_updates =0;


SELECT birthdate FROM hr;

UPDATE hr 
SET birthdate = CASE 
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d') ELSE NULL END;

ALTER TABLE hr MODIFY COLUMN birthdate DATE;

SELECT hire_date FROM hr;

UPDATE hr 
SET hire_date = CASE 
WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d') ELSE NULL END;

ALTER TABLE hr MODIFY COLUMN hire_date DATE;

SELECT termdate FROM hr;

SET sql_mode='';

UPDATE hr 
SET termdate = date( str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'));
WHERE termdate IS NOT NULL AND termdate !=;

ALTER TABLE hr MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN age INT;

===CALCULATIMG THE AGE OF EACH EMPLOYEE==

UPDATE hr 
SET age = timestampdiff(YEAR,birthdate,CURDATE());


===CALCULATIMG TOTAL_NUMBER_OF EMPLOYEE==

SELECT  count(emp_id) FROM hr;

SELECT  * FROM hr;

===CALCULATIMG TOTAL_NUMBER_OF EMPLOYEE IN_EACH JOBTITLE===

SELECT  jobtitle, count(*) AS count  FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY jobtitle
ORDER BY count DESC;

===CALCULATIMG TOTAL_NUMBER_OF EMPLOYEE BY GENDER===

SELECT  gender, count(*) AS count  FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY gender
ORDER BY count DESC;

===CALCULATIMG TOTAL_NUMBER_OF EMPLOYEE BY RACE===

SELECT  race, count(*) AS count  FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY race
ORDER BY count DESC;

===GROUPING EMPLOYEE INTO 5 CATEGORIES

SELECT 
CASE 
WHEN age >= 20 AND age <=29 THEN '20-29'
WHEN age >= 30 AND age <=39 THEN '30-39'
WHEN age >= 40 AND age <=49 THEN '40-49'
WHEN age >= 50 AND age <=59 THEN '50-59'
ELSE '60+' END AS age_group, count(*) AS count FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY age_group
ORDER BY count DESC;

===CALCULATIMG LENTH OF SERVICE OF EACH EMPLOYEE AND THE MIN/MAX==

SELECT emp_id, datediff(termdate,hire_date) as lenght_of_employment
FROM hr
WHERE termdate <= curdate() AND termdate <>'0000-00-00' AND age>= 18;
GROUP BY emp_id;

ALTER TABLE hr ADD COLUMN lenght_work INT;
 
UPDATE hr 
SET lenght_work = timestampdiff(YEAR,hire_date,CURDATE());

SELECT min(lenght_work) AS lowest, max(lenght_work) AS highest FROM hr
WHERE age >=18 AND termdate = '0000-00-00';


===CALCULATIMG TOTAL_NUMBER_OF EMPLOYEE BY DEPARTMAENT==

 
SELECT *   FROM hr;

SELECT department , count(*) AS count  FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY department
ORDER BY count DESC;


===CALCULATIMG TOTAL_NUMBER_OF EMPLOYEE THAT ARE TERMINATED_====

ALTER TABLE hr ADD COLUMN terminatted VARCHAR(30);

UPDATE hr 
SET terminatted = emp_id WHERE termdate <> curdate() AND termdate <>'0000-00-00' AND age>= 18;

SELECT terminatted  FROM hr;

SELECT * FROM hr
WHERE emp_id='00-0076100';

===CALCULATIMG NUMBER_OF_YEARS BEFORE TERMINATING===

ALTER TABLE hr ADD COLUMN years_work VARCHAR(30);

UPDATE hr 
SET years_work  = timestampdiff(YEAR,hire_date,termdate);

SELECT years_work  FROM hr;

ALTER TABLE hr MODIFY COLUMN years_work INT;

SELECT terminatted FROM hr;

=====SHOWING NUMBER_OF_EMPLOYEE BASE ON GENDER===

SELECT gender,count(*)
  FROM hr
  WHERE terminatted!=''
GROUP BY gender;


SELECT gender,count(*) AS number_of_terminatted
  FROM hr
  WHERE terminatted!=''
GROUP BY gender
ORDER BY number_of_terminatted  DESC;

=====SHOWING NUMBER_OF_EMPLOYEE BASE ON RACE===
 
 SELECT race,count(*) AS number_of_terminatted
  FROM hr
  WHERE terminatted!=''
GROUP BY race
ORDER BY number_of_terminatted DESC;

=====SHOWING NUMBER_OF_EMPLOYEE BASE ON DEPARTMENT===

SELECT department,count(*) AS number_of_terminatted
  FROM hr
  WHERE terminatted!=''
GROUP BY department
ORDER BY number_of_terminatted DESC;

SELECT 
terminatted,count(*)
  FROM hr
  WHERE terminatted!='';
 