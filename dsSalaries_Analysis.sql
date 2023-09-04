SELECT *
FROM salaries;


-- Overall average salaries for data science roles
SELECT
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM 
	salaries;


-----------------	LOCATION	---------------
-- How many job postings were made by each country
SELECT
	company_location,
	COUNT(*) AS job_count
FROM
	salaries
GROUP BY
	company_location
ORDER BY
	job_count DESC;


-- What job roles does each country offer the most job openings to?
SELECT
	company_location,
	job_title,
	job_count
FROM
	(
		SELECT
			company_location,
			job_title,
			COUNT(*) AS job_count,
			ROW_NUMBER() OVER (PARTITION BY company_location ORDER BY COUNT(*) DESC) AS num
		FROM
			salaries
		GROUP BY
			company_location,
			job_title
	) job
WHERE
	num = 1
ORDER BY
	company_location,
	job_count DESC;


-- Which country pays more on average in the industry?
SELECT
	company_location,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
GROUP BY
	company_location
ORDER BY 
	avg_salary DESC;


-- Which Continent paid more in the industry?
SELECT
	continent_company,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
GROUP BY
	continent_company
ORDER BY 
	avg_salary DESC;


-- Which country posted the most jobs based on experience levels?
-- ENTRY LEVEL
SELECT
	company_location,
	COUNT(*) AS job_count
FROM
	salaries
WHERE
	experience_level = 'Entry Level'
GROUP BY 
	company_location,
	job_title
ORDER BY
	job_count DESC;

-- MID LEVEL
SELECT
	company_location,
	COUNT(*) AS job_count
FROM
	salaries
WHERE
	experience_level = 'Mid Level'
GROUP BY 
	company_location
ORDER BY
	job_count DESC;

-- SENIOR LEVEL
SELECT
	company_location,
	COUNT(*) AS job_count
FROM
	salaries
WHERE
	experience_level = 'Senior Level'
GROUP BY 
	company_location
ORDER BY
	job_count DESC;

-- EXECUTIVE LEVEL
SELECT
	company_location,
	COUNT(*) AS job_count
FROM
	salaries
WHERE
	experience_level = 'Executive Level'
GROUP BY 
	company_location
ORDER BY
	job_count DESC;


-- Which country offered better pay on average as the years went by?
WITH year_twenty AS (
	SELECT company_location, ROUND(AVG(salary_in_usd), 2) AS twenty
	FROM salaries
	WHERE work_year = 2020
	GROUP BY company_location
),
year_twenty_one AS (
	SELECT company_location, ROUND(AVG(salary_in_usd), 2) AS twenty_one
	FROM salaries
	WHERE work_year = 2021
	GROUP BY company_location
),
year_twenty_two AS (
	SELECT company_location, ROUND(AVG(salary_in_usd), 2) AS twenty_two
	FROM salaries
	WHERE work_year = 2022
	GROUP BY company_location
)

SELECT DISTINCT
	s.company_location,
	t.twenty,
	one.twenty_one,
	two.twenty_two,
	(t.twenty + one.twenty_one + two.twenty_two) AS sum_avg_salary
FROM
	salaries s
JOIN year_twenty t ON t.company_location = s.company_location
JOIN year_twenty_one one ON one.company_location = s.company_location
JOIN year_twenty_two two ON two.company_location = s.company_location
WHERE
	twenty_one > twenty AND twenty_two > twenty_one
ORDER BY
	sum_avg_salary DESC;


---------------		JOB ROLES	---------------
-- What job role had the most postings?
SELECT
	job_title,
	COUNT(*) AS job_count
FROM
	salaries
GROUP BY
	job_title
ORDER BY
	job_count DESC;


-- Job roles that offered higher pay on average
SELECT
	job_title,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
GROUP BY
	job_title
ORDER BY
	avg_salary DESC;


-- What jobs had constant demand over the years?
SELECT
	job_title,
	twenty,
	twenty_one,
	twenty_two
FROM
	(
		SELECT
			job_title,
			SUM(CASE WHEN work_year = '2020' THEN 1 ELSE 0 END) AS twenty,
			SUM(CASE WHEN work_year = '2021' THEN 1 ELSE 0 END) AS twenty_one,
			SUM(CASE WHEN work_year = '2022' THEN 1 ELSE 0 END) AS twenty_two
		FROM
			salaries
		GROUP BY
			job_title
	) demand_rate
WHERE
	twenty_one > twenty AND twenty_two > twenty_one
ORDER BY
	twenty_two DESC;


-- Nummber of jobs and average salaries each country paid per job title per year
-- 2020
SELECT
	company_location,
	job_title,
	COUNT(*) AS job_count,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
WHERE
	work_year = '2020'
GROUP BY
	company_location,
	job_title
ORDER BY
	avg_salary DESC;

-- 2021
SELECT
	company_location,
	job_title,
	COUNT(*) AS job_count,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
WHERE
	work_year = '2021'
GROUP BY
	company_location,
	job_title
ORDER BY
	avg_salary DESC;

-- 2022
SELECT
	company_location,
	job_title,
	COUNT(*) AS job_count,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
WHERE
	work_year = '2022'
GROUP BY
	company_location,
	job_title
ORDER BY
	avg_salary DESC;


--------------		EXPERIENCE LEVEL	---------------
-- Number of job postings made for each experience level
SELECT
	experience_level,
	COUNT(*) AS job_count
FROM
	salaries
GROUP BY 
	experience_level
ORDER BY
	job_count DESC;


-- Highest paid experience level on average
SELECT
	experience_level,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
GROUP BY
	experience_level
ORDER BY
	avg_salary DESC;


-- Which jobs demanded more pay per experience level
-- ENTRY LEVEL
SELECT
	job_title,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
WHERE
	experience_level = 'Entry Level'
GROUP BY
	job_title
ORDER BY
	avg_salary DESC;

-- MID LEVEL
SELECT
	job_title,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
WHERE
	experience_level = 'Mid Level'
GROUP BY
	job_title
ORDER BY
	avg_salary DESC;

-- SENIOR LEVEL
SELECT
	job_title,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
WHERE
	experience_level = 'Senior Level'
GROUP BY
	job_title
ORDER BY
	avg_salary DESC;

-- EXECUTIVE LEVEL
SELECT
	job_title,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
WHERE
	experience_level = 'Executive Level'
GROUP BY
	job_title
ORDER BY
	avg_salary DESC;


-- Average paid salary per year for different experience levels
SELECT
	experience_level,
	ROUND(AVG(CASE WHEN work_year = '2020' THEN salary_in_usd END), 2) AS avg_salary_2020,
	ROUND(AVG(CASE WHEN work_year = '2021' THEN salary_in_usd END), 2) AS avg_salary_2021,
	ROUND(AVG(CASE WHEN work_year = '2022' THEN salary_in_usd END), 2) AS avg_salary_2022
FROM
	salaries
GROUP BY
	experience_level;


-- Correlation between company size and experience level
SELECT
	company_size,
	experience_level,
	COUNT(*) AS job_count,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
GROUP BY
	company_size,
	experience_level
ORDER BY
	company_size DESC,
	experience_level;


-- Which company size pays higher on average?
SELECT
	company_size,
	COUNT(*) AS job_count,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
GROUP BY
	company_size
ORDER BY
	avg_salary DESC;


---------------		Work Year	---------------
-- Trend for Average salary paid per data science jobs per year
SELECT
	work_year,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
GROUP BY
	work_year;


-- Count of job postings per year
SELECT
	work_year,
	COUNT(*) AS job_count
FROM
	salaries
GROUP BY
	work_year
ORDER BY
	job_count DESC;


-- Demand rate of Data Science Job roles over the years
WITH employee_counts AS (
    SELECT work_year, COUNT(*) AS count_year
    FROM salaries
    WHERE work_year >= 2020 AND work_year <= 2022
    GROUP BY work_year
)
SELECT
    ec1.work_year,
	ec1.count_year,
	ec2.work_year,
	ec2.count_year,
    CONVERT(DECIMAL(10, 6), ((ec2.count_year - ec1.count_year) * 100.0 / ec1.count_year)) AS demand_rate
FROM
    employee_counts ec1
JOIN
    employee_counts ec2
ON
    ec2.work_year = ec1.work_year + 1;


-- the average paid salary per year for different job roles
SELECT
	job_title,
	ROUND(AVG(CASE WHEN work_year = 2020 THEN salary_in_usd END), 2) AS avg_salary_2020,
	ROUND(AVG(CASE WHEN work_year = 2021 THEN salary_in_usd END), 2) AS avg_salary_2021,
	ROUND(AVG(CASE WHEN work_year = 2022 THEN salary_in_usd END), 2) AS avg_salary_2022
FROM
	salaries
GROUP BY
	job_title;


---------------		EMPLOYMENT TYPE		---------------
-- Average salary paid per year for different employment type
SELECT
	employment_type,
	ROUND(AVG(CASE WHEN work_year = '2020' THEN salary_in_usd END), 2) AS avg_salary_2020,
	ROUND(AVG(CASE WHEN work_year = '2021' THEN salary_in_usd END), 2) AS avg_salary_2021,
	ROUND(AVG(CASE WHEN work_year = '2022' THEN salary_in_usd END), 2) AS avg_salary_2022
FROM
	salaries
GROUP BY
	employment_type;

-- Overall average salary based on employment type
SELECT
	employment_type,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM
	salaries
GROUP BY
	employment_type; 

-- Count of job postings per employment type
SELECT
	employment_type,
	COUNT(*) AS job_count
FROM
	salaries
GROUP BY
	employment_type; 


-- Top 10 paying Jobs in each year, with their respective details
-- 2020
SELECT TOP 10
	job_title,
	employment_type,
	experience_level,
	company_size,
	salary_in_usd
FROM 
	salaries
WHERE
	work_year = '2020'
ORDER BY
	salary_in_usd DESC;

-- 2021
SELECT TOP 10
	job_title,
	employment_type,
	experience_level,
	company_size,
	salary_in_usd
FROM 
	salaries
WHERE
	work_year = '2021'
ORDER BY
	salary_in_usd DESC;

-- 2022
SELECT TOP 10
	job_title,
	employment_type,
	experience_level,
	company_size,
	salary_in_usd
FROM 
	salaries
WHERE
	work_year = '2022'
ORDER BY
	salary_in_usd DESC;


-------------		Remote Ratio Analysis		---------------
-- Number of Remote work opportunities and average salary paid:
-- COUNT:
SELECT
	remote_ratio,
	COUNT(*) AS remote_count
FROM	
	salaries
GROUP BY
	remote_ratio
ORDER BY
	remote_count;

-- AVERAGE:
SELECT
	remote_ratio,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM	
	salaries
GROUP BY
	remote_ratio
ORDER BY
	avg_salary DESC;


-- Number of remote opportunies for each role
SELECT
  company_location,
  SUM(CASE WHEN remote_ratio = 'Fully Onsite' THEN 1 ELSE 0 END) AS fully_onsite,
  SUM(CASE WHEN remote_ratio = 'Hybrid' THEN 1 ELSE 0 END) AS hybrid,
  SUM(CASE WHEN remote_ratio = 'Fully Remote' THEN 1 ELSE 0 END) AS fully_remote,
  COUNT(*) AS total
  --(no_remote_count + partial_remote_count + fully_remote_count) AS total
FROM 
	salaries
GROUP BY
	company_location
ORDER BY
	total DESC;
