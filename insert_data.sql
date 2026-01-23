-- Inserts realistic sample data into provinces, doctors, patients, and admissions using generate_series + random values to create a larger dataset for reporting and analytics testing 
-- (specialties, demographics, diagnoses, and admission dates).


INSERT INTO provinces (province_name)
VALUES
    ('Ontario'),
    ('Quebec'),
    ('British Columbia'),
    ('Alberta'),
    ('Manitoba'),
    ('Saskatchewan'),
    ('Nova Scotia'),
    ('New Brunswick'),
    ('Newfoundland and Labrador'),
    ('Prince Edward Island');


INSERT INTO doctors (first_name, last_name, specialty)
SELECT
    'Doctor_' || gs,
    'Lastname_' || gs,
    (ARRAY[
        'Cardiology',
        'Neurology',
        'Orthopedics',
        'Pediatrics',
        'General Medicine',
        'Oncology',
        'Psychiatry'
    ])[1 + (random() * 6)::int]
FROM generate_series(1, 200) gs;


INSERT INTO patients (
    first_name,
    last_name,
    gender,
    birth_date,
    height,
    weight,
    province_id
)
SELECT
    'Patient_' || gs,
    'Lastname_' || gs,
    CASE WHEN random() < 0.5 THEN 'M' ELSE 'F' END,
    DATE '1950-01-01' + (random() * 25000)::int,
    (150 + random() * 40)::int,
    (50 + random() * 60)::int,
    (random() * 9 + 1)::int
FROM generate_series(1, 5000) gs;


INSERT INTO admissions (
    patient_id,
    attending_doctor_id,
    admission_date,
    discharge_date,
    diagnosis
)
SELECT
    (random() * 4999 + 1)::int,
    (random() * 199 + 1)::int,
    DATE '2022-01-01' + (random() * 900)::int,
    DATE '2022-01-01' + (random() * 900 + 1)::int,
    (ARRAY[
        'Flu',
        'Fracture',
        'Epilepsy',
        'Diabetes',
        'Hypertension',
        'Asthma'
    ])[1 + (random() * 5)::int]
FROM generate_series(1, 20000);

