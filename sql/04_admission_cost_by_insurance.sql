/*
Calculates total admission cost by insurance status.
Insurance is inferred from patient_id parity.
*/
SELECT
    CASE
        WHEN a.patient_id % 2 = 0 THEN 'Yes'
        ELSE 'No'
    END AS has_insurance,
    SUM(
        CASE
            WHEN a.patient_id % 2 = 0 THEN 10
            ELSE 50
        END
    ) AS total_admission_cost
FROM admissions a
GROUP BY has_insurance;
