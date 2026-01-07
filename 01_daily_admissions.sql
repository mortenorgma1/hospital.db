SELECT
    admission_date,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY admission_date
ORDER BY admission_date;
