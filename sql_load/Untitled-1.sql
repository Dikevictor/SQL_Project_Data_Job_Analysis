WITH first_quarter_jobs AS (

SELECT
   *
FROM
    january_jobs
WHERE 
    salary_year_avg IS NOT NULL

UNION ALL

SELECT
    job_title_short,
    job_id,
    salary_year_avg
FROM
    february_jobs
WHERE 
    salary_year_avg IS NOT NULL

UNION ALL

SELECT
    job_title_short,
    job_id,
    salary_year_avg
FROM
    march_jobs
WHERE 
    salary_year_avg IS NOT NULL

)


SELECT
    job_title_short,
    salary_year_avg

FROM first_quarter_jobs

WHERE 
    salary_year_avg > 70000 AND job_title_short = 'Data Analyst'

ORDER BY
    salary_year_avg DESC



-- I want to know the count of each job title that 
