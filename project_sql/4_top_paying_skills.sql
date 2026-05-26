
/*
Answer: What are the top skills saved on salary?
-- Look at the average salary associated with each skill for data analyst position
-- Focuses on roles with specified salaries, regardless of location
-- Why? It reveals how different skills impact salary levels for data analysts and helps identify the most financially rewarding skills to acquire or improve
*/
SELECT

    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS Average_Salary,
    skills_dim.skills AS Top_Demanded_Skill
   
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = TRUE

GROUP BY
     Top_Demanded_Skill

ORDER BY
     Average_Salary DESC

LIMIT 25;

-- INSIGHTS 

/*

Looking at this data, there is a very clear and fascinating trend: the highest-paying "data analyst" roles aren't actually looking for traditional data analysis alone. They are heavily blending into Data Engineering, Machine Learning (MLOps), and DevOps.

When companies offer these premium salaries, they are looking for analysts who can build pipelines, manage big data architectures, and deploy models.

Here is a breakdown of the key trends driving these top-tier salaries:

1. The Big Data & Engineering Premium
The absolute highest-paying skills focus on processing massive datasets and managing infrastructure.

PySpark ($208,172): Taking the #1 spot by a wide margin, PySpark indicates that companies are willing to pay a massive premium for analysts who can handle distributed computing and process petabytes of data rather than just querying standard relational databases.

Databricks ($141,907) & Airflow ($126,103): These show a high demand for data orchestration and unified analytics platforms. Knowing how to schedule and manage data pipelines (Airflow) is a massive salary booster.

2. Advanced Python & Machine Learning Ecosystem
Traditional analysts stick to basic SQL and Excel, but the top earners are deeply embedded in Python's advanced engineering and modeling ecosystems.

The Core Stack: Pandas ($151,821) and NumPy ($143,513) command incredibly high averages here. This suggests these roles lean heavily into custom programmatic data manipulation rather than just using standard BI tools.

Scikit-learn ($125,781) & DataRobot ($155,486): These point directly toward predictive analytics and automated machine learning. The line between Data Analyst and Data Scientist completely blurs at this level.

3. The "Analyst as a Developer" (DevOps & Version Control)
A massive chunk of this list consists of software engineering and development operations (DevOps) tools. Companies are looking for analysts who follow rigorous software development lifecycles.

Version Control & Collaboration: Bitbucket ($189,155) and GitLab ($154,500) sit comfortably near the very top. This implies that premium roles require analysts to work within engineering teams, write production-grade code, and manage pull requests.

CI/CD & Infrastructure: Tools like Kubernetes ($132,500) and Jenkins ($125,436) prove that top-paying roles expect analysts to understand how applications and data pipelines are deployed and sustained.

4. Specialized Programming Languages
While SQL and Python are standard, adding secondary or specialized languages yields high returns:

Golang ($145,000) & Scala ($124,903): Both are highly efficient, concurrent programming languages often used to build heavy data backend systems.

Swift ($153,750): Likely tied to high-paying mobile analytics or user behavior tracking roles within tech-first companies.

*/


/*

-- The code here is to know the top skill in data analysis
SELECT

    COUNT(skills_dim.skill_id) AS Demand_count,
    skills_dim.skills AS Top_Demanded_Skill
    --job_postings_fact.salary_year_avg AS Salary

FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE
    job_title_short = 'Data Analyst' -- AND salary_year_avg IS NOT NULL

GROUP BY
    Top_Demanded_Skill

ORDER BY
    Demand_count DESC

-- LIMIT 10

*/
