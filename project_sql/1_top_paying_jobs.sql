/*
Question: what are the top-paying data analyst jobs?
-- Identify the top 10 highest paying Data Analyst roles that are available remotely.
-- focuses on job postings with specifies salaries (remove nulls).
-- Find what company offers these jobs
-- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into the most optimium skill skills or roles to be pursueing as a data analyst
*/ 

-- Buiding base query
SELECT 
    job_id,
    company_dim.name AS company_offering,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    job_work_from_home

FROM 
    job_postings_fact 
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id

WHERE
    job_title = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
     salary_year_avg IS NOT NULL AND 
     job_work_from_home = True

ORDER BY 
    salary_year_avg DESC

LIMIT 10;



