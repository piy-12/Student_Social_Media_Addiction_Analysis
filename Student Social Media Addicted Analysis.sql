SELECT * FROM students;

-- Easy Questions

-- Q1.List all students along with their Age, Gender, and Country.

SELECT Student_ID, Age, Gender, Country
FROM students;

-- Q2. What is the average daily usage of social media across all students?

SELECT AVG(Avg_Daily_Usage_Hours) AS Avergae_Usage_Across_AllStudents FROM Students;

-- Q3 How many students belong to each Gender category?

SELECT Gender, COUNT(Student_ID) AS Number_of_Males_and_Females FROM students
GROUP BY Gender;

-- Q4 How many students are from each Country?

SELECT Country, COUNT(Student_ID) AS Number_of_Students_From_Each_Country  FROM students
GROUP BY Country;

-- Q5 Which students sleep more than 8 hours per night?

SELECT 
    Student_ID, 
    Sleep_Hours_Per_Night,
    COUNT(*) OVER() AS Total_Students
FROM Students
WHERE Sleep_Hours_Per_Night > 8;

-- Medium Level

-- Q1. Which are the top 3 most used social media platforms among students?

SELECT Most_Used_Platform AS Platform_Name, COUNT(*) AS Most_Used FROM students
GROUP BY Most_Used_Platform
ORDER BY  Most_Used DESC
LIMIT 3;

-- Q2. What is the average sleep duration per night for each Academic Level?

SELECT AVG(Sleep_Hours_Per_Night) AS Average_Sleep_Duration, Academic_Level FROM students
GROUP BY Academic_Level;

-- Q3. List students who spend more than 6 hours on social media but sleep less than 6 hours.

SELECT Student_ID, Avg_Daily_Usage_Hours, Sleep_Hours_Per_Night 
FROM students
WHERE Avg_Daily_Usage_Hours > 6 AND Sleep_Hours_Per_Night < 6;

-- Q4. Find the average Addicted_Score for students in each Relationship Status.

SELECT AVG(Addicted_Score) AS Average_Addiction_Score, Relationship_Status
FROM students
GROUP BY Relationship_Status;


-- Q5. Which country has the highest average daily social media usage?

SELECT Country, AVG(Avg_Daily_Usage_Hours) AS Avg_Usage
FROM students
GROUP BY Country
ORDER BY Avg_Usage DESC
LIMIT 1;


-- HARD LEVEL

-- Q1. Compare the average Addicted_Score of students whose academic performance is affected vs not affected.



SELECT AVG(Addicted_Score), Affects_Academic_Performance FROM students 
WHERE Affects_Academic_Performance = 'Yes'
UNION
SELECT AVG(Addicted_Score), Affects_Academic_Performance FROM students 
WHERE Affects_Academic_Performance = 'No';

SELECT AVG(Addicted_Score), Affects_Academic_Performance FROM Students
GROUP BY Affects_Academic_Performance;

-- Q2. Which platform has the highest average daily usage hours?

SELECT Most_Used_Platform,
       AVG(Avg_Daily_Usage_Hours) AS Highest
FROM students
GROUP BY Most_Used_Platform
ORDER BY Highest DESC
LIMIT 1;

-- Q3. Identify the country with the lowest average mental health score.

SELECT Country, AVG(Mental_Health_Score) AS AVg_Score
FROM students
GROUP BY Country
ORDER BY Avg_Score ASC
LIMIT 1;

-- Q4. Categorize students into addiction levels (Low, Medium, High) and find the average number of conflicts in each category.

SELECT 
	CASE 
		WHEN Addicted_Score > 7 THEN 'High'
        WHEN Addicted_Score Between 4 AND 7 THEN 'Medium'
        ELSE 'Low'
	END AS Addiction_Levels,
AVG(Conflicts_Over_Social_Media) AS AVG_Conflict
FROM students
GROUP BY Addiction_Levels
ORDER BY AvG_Conflict ;


-- Q5. Which Academic Level and Gender combination shows the highest average Addicted_Score?

SELECT AVG(Addicted_Score) AS Avg_Addicted_Score, Gender, Academic_Level
FROM students
GROUP BY Gender, Academic_Level
ORDER BY Avg_Addicted_Score DESC
LIMIT 1;