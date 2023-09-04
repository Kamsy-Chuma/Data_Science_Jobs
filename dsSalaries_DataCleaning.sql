SELECT *
FROM salaries;

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'salaries';


-- Identification of unique records and checking if any row has NULL values.
SELECT DISTINCT job_title
FROM salaries;

-- DATA CLEANING PROCESSES:
-- Making the records more descriptive.

-- Update the experience_level columns
SELECT DISTINCT experience_level
FROM salaries;

UPDATE salaries
SET experience_level = CASE WHEN experience_level = 'EN' THEN 'Entry Level'
						    WHEN experience_level = 'MI' THEN 'Mid Level'
						    WHEN experience_level = 'SE' THEN 'Senior Level'
						    WHEN experience_level = 'EX' THEN 'Executive Level'
						    ELSE NULL END;

-- Update the employment type
SELECT DISTINCT employment_type
FROM salaries;

UPDATE salaries
SET employment_type = CASE WHEN employment_type = 'PT' THEN 'Part Time'
						   WHEN employment_type = 'FT' THEN 'Full Time'
						   WHEN employment_type = 'CT' THEN 'Contract'
						   WHEN employment_type = 'FL' THEN 'Freelance'
						   ELSE employment_type END;

-- Update job title
SELECT DISTINCT job_title
FROM salaries;

UPDATE salaries
SET job_title = CASE WHEN job_title LIKE 'Finance%' THEN 'Financial Data Analyst'
					 WHEN job_title = 'Head of Data' THEN 'Head of Data Science'
					 WHEN job_title = 'ML Engineer' THEN 'Machine Learning Engineer'
				     ELSE job_title END;

-- Update remote ratio
SELECT DISTINCT remote_ratio
FROM salaries;

ALTER TABLE salaries
ALTER COLUMN remote_ratio VARCHAR(255);

UPDATE salaries
SET remote_ratio = CASE WHEN remote_ratio = 0 THEN 'Fully Onsite'
						WHEN remote_ratio = 50 THEN 'Hybrid'
						WHEN remote_ratio = 100 THEN 'Fully Remote'
						ELSE remote_ratio END;

-- Update employee residence and company location
-- company location
SELECT DISTINCT company_location
FROM salaries;

UPDATE salaries
SET company_location = CASE WHEN company_location = 'AE' THEN 'United Arab Emirates'
							WHEN company_location = 'AS' THEN 'American Samoa'
							WHEN company_location = 'AT' THEN 'Austria'
							WHEN company_location = 'AU' THEN 'Australia'
							WHEN company_location = 'BE' THEN 'Belgium'
							WHEN company_location = 'BR' THEN 'Brazil'
							WHEN company_location = 'CA' THEN 'Canada'
							WHEN company_location = 'CH' THEN 'Switzerland'
							WHEN company_location = 'CL' THEN 'Chile'
							WHEN company_location = 'CN' THEN 'China'
							WHEN company_location = 'CO' THEN 'Colombia'
							WHEN company_location = 'CZ' THEN 'Czech Republic'
							WHEN company_location = 'DE' THEN 'Germany'
							WHEN company_location = 'DK' THEN 'Denmark'
							WHEN company_location = 'DZ' THEN 'Algeria'
							WHEN company_location = 'EE' THEN 'Estonia'
							WHEN company_location = 'ES' THEN 'Spain'
							WHEN company_location = 'FR' THEN 'France'
							WHEN company_location = 'GB' THEN 'United Kingdom'
							WHEN company_location = 'GR' THEN 'Greece'
							WHEN company_location = 'HN' THEN 'Honduras'
							WHEN company_location = 'HR' THEN 'Croatia'
							WHEN company_location = 'HU' THEN 'Hungary'
							WHEN company_location = 'IE' THEN 'Ireland'
							WHEN company_location = 'IL' THEN 'Israel'
							WHEN company_location = 'IN' THEN 'India'
							WHEN company_location = 'IQ' THEN 'Iraq'
							WHEN company_location = 'IR' THEN 'Iran'
							WHEN company_location = 'IT' THEN 'Italy'
							WHEN company_location = 'JP' THEN 'Japan'
							WHEN company_location = 'KE' THEN 'Kenya'
							WHEN company_location = 'LU' THEN 'Luxembourg'
							WHEN company_location = 'MD' THEN 'Moldova'
							WHEN company_location = 'MT' THEN 'Malta'
							WHEN company_location = 'MX' THEN 'Mexico'
							WHEN company_location = 'MY' THEN 'Malaysia'
							WHEN company_location = 'NG' THEN 'Nigeria'
							WHEN company_location = 'NL' THEN 'Netherlands'
							WHEN company_location = 'NZ' THEN 'New Zealand'
							WHEN company_location = 'PK' THEN 'Pakistan'
							WHEN company_location = 'PL' THEN 'Poland'
							WHEN company_location = 'PT' THEN 'Portugal'
							WHEN company_location = 'RO' THEN 'Romania'
							WHEN company_location = 'RU' THEN 'Russia'
							WHEN company_location = 'SG' THEN 'Singapore'
							WHEN company_location = 'SI' THEN 'Slovenia'
							WHEN company_location = 'TR' THEN 'Turkey'
							WHEN company_location = 'UA' THEN 'Ukraine'
							WHEN company_location = 'US' THEN 'United States'
							WHEN company_location = 'VN' THEN 'Vietnam'
							ELSE company_location END;

-- employee residence
SELECT DISTINCT employee_residence
FROM salaries;

UPDATE salaries
SET employee_residence = CASE WHEN employee_residence = 'AE' THEN 'United Arab Emirates'
							  WHEN employee_residence = 'AR' THEN 'Argentina'
							  WHEN employee_residence = 'AT' THEN 'Austria'
							  WHEN employee_residence = 'AU' THEN 'Australia'
							  WHEN employee_residence = 'BE' THEN 'Belgium'
							  WHEN employee_residence = 'BG' THEN 'Bulgaria'
							  WHEN employee_residence = 'BO' THEN 'Bolivia'
							  WHEN employee_residence = 'BR' THEN 'Brazil'
							  WHEN employee_residence = 'CA' THEN 'Canada'
							  WHEN employee_residence = 'CH' THEN 'Switzerland'
							  WHEN employee_residence = 'CL' THEN 'Chile'
							  WHEN employee_residence = 'CN' THEN 'China'
							  WHEN employee_residence = 'CO' THEN 'Colombia'
							  WHEN employee_residence = 'CZ' THEN 'Czech Republic'
							  WHEN employee_residence = 'DE' THEN 'Germany'
							  WHEN employee_residence = 'DK' THEN 'Denmark'
							  WHEN employee_residence = 'DZ' THEN 'Algeria'
							  WHEN employee_residence = 'EE' THEN 'Estonia'
							  WHEN employee_residence = 'ES' THEN 'Spain'
							  WHEN employee_residence = 'FR' THEN 'France'
							  WHEN employee_residence = 'GB' THEN 'United Kingdom'
							  WHEN employee_residence = 'GR' THEN 'Greece'
							  WHEN employee_residence = 'HK' THEN 'Hong Kong'
							  WHEN employee_residence = 'HN' THEN 'Honduras'
							  WHEN employee_residence = 'HR' THEN 'Croatia'
							  WHEN employee_residence = 'HU' THEN 'Hungary'
							  WHEN employee_residence = 'IE' THEN 'Ireland'
							  WHEN employee_residence = 'IN' THEN 'India'
							  WHEN employee_residence = 'IQ' THEN 'Iraq'
							  WHEN employee_residence = 'IR' THEN 'Iran'
							  WHEN employee_residence = 'IT' THEN 'Italy'
							  WHEN employee_residence = 'JE' THEN 'Jersey'
							  WHEN employee_residence = 'JP' THEN 'Japan'
							  WHEN employee_residence = 'KE' THEN 'Kenya'
							  WHEN employee_residence = 'LU' THEN 'Luxembourg'
							  WHEN employee_residence = 'MD' THEN 'Moldova'
							  WHEN employee_residence = 'MT' THEN 'Malta'
							  WHEN employee_residence = 'MX' THEN 'Mexico'
							  WHEN employee_residence = 'MY' THEN 'Malaysia'
							  WHEN employee_residence = 'NG' THEN 'Nigeria'
							  WHEN employee_residence = 'NL' THEN 'Netherlands'
							  WHEN employee_residence = 'NZ' THEN 'New Zealand'
							  WHEN employee_residence = 'PH' THEN 'Philippines'
							  WHEN employee_residence = 'PK' THEN 'Pakistan'
							  WHEN employee_residence = 'PL' THEN 'Poland'
							  WHEN employee_residence = 'PR' THEN 'Puerto Rico'
							  WHEN employee_residence = 'PT' THEN 'Portugal'
							  WHEN employee_residence = 'RO' THEN 'Romania'
							  WHEN employee_residence = 'RS' THEN 'Serbia'
							  WHEN employee_residence = 'RU' THEN 'Russia'
							  WHEN employee_residence = 'SG' THEN 'Singapore'
							  WHEN employee_residence = 'SI' THEN 'Slovenia'
							  WHEN employee_residence = 'TN' THEN 'Tunisia'
							  WHEN employee_residence = 'TR' THEN 'Turkey'
							  WHEN employee_residence = 'UA' THEN 'Ukraine'
							  WHEN employee_residence = 'US' THEN 'United States'
							  WHEN employee_residence = 'VN' THEN 'Vietnam'
							  ELSE employee_residence END;

-- updating company size
SELECT DISTINCT company_size
FROM salaries;

UPDATE salaries
SET company_size = CASE WHEN company_size = 'L' THEN 'Large'
						WHEN company_size = 'M' THEN 'Medium'
						WHEN company_size = 'S' THEN 'Small'
						ELSE company_size END;

-- Checking for duplicates
WITH duplicate AS
	(
		SELECT *,
			   ROW_NUMBER() OVER 
					(
						PARTITION BY id,
									 work_year,
									 experience_level,
									 employment_type,
									 job_title,
									 salary_in_usd,
									 employee_residence,
									 remote_ratio,
									 company_location,
									 company_size
									 ORDER BY id
					) row_num
		FROM
			salaries
	)

SELECT *
FROM duplicate
WHERE row_num > 1
-- No duplicate values

-- Creating a continent column for company location to use in my analysis
ALTER TABLE salaries
ADD continent_company NVARCHAR(255)

UPDATE salaries
SET continent_company = CASE WHEN company_location IN ('United Arab Emirates', 'China', 'Israel', 'India', 'Iraq', 'Iran', 'Japan', 'Malaysia', 'Pakistan', 'Singapore', 'Vietnam') THEN 'Asia'
							 WHEN company_location IN ('Algeria', 'Kenya', 'Nigeria') THEN 'Africa'
							 WHEN company_location IN ('Canada', 'Honduras', 'Mexico', 'United States') THEN 'North America'
							 WHEN company_location IN ('Brazil', 'Chile', 'Colombia') THEN 'South America'
							 WHEN company_location IN ('Austria', 'Belgium', 'Switzerland', 'Czech Republic', 'Germany', 'Denmark', 'Estonia', 'Spain', 'France', 'United Kingdom', 'Greece', 'Croatia',
							 'Hungary', 'Ireland', 'Italy', 'Luxembourg', 'Moldova', 'Malta', 'Netherlands', 'Poland', 'Portugal', 'Romania', 'Russia', 'Slovenia', 'Turkey', 'Ukraine') THEN 'Europe'
							 WHEN company_location IN ('American Samoa', 'Australia', 'New Zealand') THEN 'Australia'
							 ELSE company_location END;

