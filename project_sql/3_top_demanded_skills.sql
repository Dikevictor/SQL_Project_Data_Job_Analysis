/*
Questions: what are the most in-demand skills for data analyst?
-- Join job posting to inner join table similar to query 2
-- Identify the top 5 in-demand skills for a data analyst.
-- Focus on all job postings. 
-- Why? Retrieves the top 5 skills with the highest demand in the job market
Provide insights into the most valuable skills for job seekers. 
*/

SELECT
    skills_dim.skill As Skills,
    count(job_postings_fact.job_id) AS Demand_count

FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE
    job_title = 'Data Analyst'

GROUP BY
    Skills
    
ORDER BY
    Demand_count DESC

LIMIT 5;

