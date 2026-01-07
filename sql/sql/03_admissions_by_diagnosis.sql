/*
Shows total number of admissions per diagnosis
Used to identify the most common medical conditions
*/
SELECT
    diagnosis,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY diagnosis
ORDER BY total_admissions DESC;
