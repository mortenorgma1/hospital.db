-- Shows daily admissions and change compared to the previous day

WITH daily_admissions AS (
    SELECT
        admission_date,
        COUNT(*) AS total_admissions
    FROM admissions
    GROUP BY admission_date
)
SELECT
    admission_date,
    total_admissions,
    total_admissions
        - LAG(total_admissions) OVER (ORDER BY admission_date)
        AS change_from_previous_day
FROM daily_admissions
ORDER BY admission_date;
