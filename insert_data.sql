SELECT COUNT(DISTINCT patient_id) FROM admissions;
SELECT COUNT(DISTINCT attending_doctor_id) FROM admissions;
SELECT MIN(admission_date), MAX(admission_date) FROM admissions;
