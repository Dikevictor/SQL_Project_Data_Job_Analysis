/*
Anwer: What are the most optimal skills to learn? 
-- Get the skills that have the highest demand
-- then, look for the higher assiociated salary
-- Rank it Descending order to get the highest paid among the highly demanded skills
-- You can add conditiion of data analyst and working from home
*/ 

-- I have already have a code that gives me the top skill count.
-- I will use it as ssubquery and see were I can go from there. 




-- Attempt 2: Buidling a CTE instead 
WITH top_skill AS (

    SELECT
                ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS Average_Salary,
                skills_dim.skills AS Top_Demanded_Skill,
                COUNT(skills_dim.skill_id) AS Skill_demand_count
            
                FROM job_postings_fact
                INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
                INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

            WHERE
                job_title_short = 'Data Analyst' 
                AND salary_year_avg IS NOT NULL 
                AND job_work_from_home = TRUE

            GROUP BY
                skills_dim.skills
)

SELECT   
    Top_Demanded_Skill,
    Average_Salary,
    Skill_demand_count
FROM top_skill
ORDER BY
    Skill_demand_count DESC  --AND 
    --Average_Salary DESC

    LIMIT 25



/* Attempt to build a Subquery 

SELECT
    ROUND((AVG(skills_dim.skill_id)),0) AS Skill_demand_count,
    Top_Demanded_Skill,
    Average_Salary

FROM (
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
)
GROUP BY
    Skills

ORDER BY 
    Average_Salary

LIMIT 25;

*/

-- Course Solution 
/*




*/