/*
Classifies patients as obese or not using BMI.
BMI >= 30 is considered obese.
*/
SELECT
    CASE
        WHEN weight / ((height / 100.0) * (height / 100.0)) >= 30 THEN 'Obese'
        ELSE 'Not Obese'
    END AS obesity_status,
    COUNT(*) AS total_patients
FROM patients
GROUP BY obesity_status;
