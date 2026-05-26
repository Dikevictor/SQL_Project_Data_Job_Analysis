/*
Question: what skills are required for the top-paying data analyst jobs? 
-- Use the top highest-paying data analyst jobs from first query
-- Add the specific skills required for these roles
-- why? It provided a detailed look at which hig-paying hobs demand certain skills,
this is helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (

    SELECT 
        job_id,
        company_dim.name AS company_offering,
        job_title,
        salary_year_avg

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

    LIMIT 10

)

-- From this CTE, we have the salary and the companies 
-- Now, we want to know the skill associated with these salaries.
-- Since, the skills are on the skills_dim table, I have to join the first join the skills_job_dim which connects with it by skill_id. And with the CTE with job_id

SELECT 
    top_paying_jobs.*,
    skills

FROM top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

ORDER BY
    salary_year_avg DESC


/*

Here is a detailed analysis of the skills required for the top-paying Data Analyst roles found in the 2023 job postings.

Check course note for insight.

Below is the json files pasted so that if I want I can go back later and verify the results

[
  {
    "job_id": 1246069,
    "company_offering": "Plexus Resource Solutions",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 1246069,
    "company_offering": "Plexus Resource Solutions",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "mysql"
  },
  {
    "job_id": 1246069,
    "company_offering": "Plexus Resource Solutions",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "job_id": 712473,
    "company_offering": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 712473,
    "company_offering": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 712473,
    "company_offering": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "r"
  },
  {
    "job_id": 712473,
    "company_offering": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "company_offering": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "matlab"
  },
  {
    "job_id": 712473,
    "company_offering": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "pandas"
  },
  {
    "job_id": 712473,
    "company_offering": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "tableau"
  },
  {
    "job_id": 712473,
    "company_offering": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "company_offering": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "job_id": 456042,
    "company_offering": "Get It Recruit - Healthcare",
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "sql"
  },
  {
    "job_id": 456042,
    "company_offering": "Get It Recruit - Healthcare",
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "python"
  },
  {
    "job_id": 456042,
    "company_offering": "Get It Recruit - Healthcare",
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "golang"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "elasticsearch"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "aws"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "gcp"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "pandas"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "looker"
  },
  {
    "job_id": 479485,
    "company_offering": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 405581,
    "company_offering": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_id": 405581,
    "company_offering": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "java"
  },
  {
    "job_id": 405581,
    "company_offering": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "job_id": 405581,
    "company_offering": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "javascript"
  },
  {
    "job_id": 405581,
    "company_offering": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "c++"
  },
  {
    "job_id": 405581,
    "company_offering": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_id": 405581,
    "company_offering": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "power bi"
  },
  {
    "job_id": 405581,
    "company_offering": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "qlik"
  },
  {
    "job_id": 1090975,
    "company_offering": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "sql"
  },
  {
    "job_id": 1090975,
    "company_offering": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "python"
  },
  {
    "job_id": 1090975,
    "company_offering": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "r"
  },
  {
    "job_id": 1090975,
    "company_offering": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "swift"
  },
  {
    "job_id": 1090975,
    "company_offering": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "excel"
  },
  {
    "job_id": 1090975,
    "company_offering": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1090975,
    "company_offering": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "looker"
  },
  {
    "job_id": 1482852,
    "company_offering": "Overmind",
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "skills": "sql"
  },
  {
    "job_id": 1482852,
    "company_offering": "Overmind",
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "skills": "python"
  },
  {
    "job_id": 479965,
    "company_offering": "InvestM Technology LLC",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "sql"
  },
  {
    "job_id": 479965,
    "company_offering": "InvestM Technology LLC",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  },
  {
    "job_id": 479965,
    "company_offering": "InvestM Technology LLC",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1326467,
    "company_offering": "EPIC Brokers",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  }
]


*/