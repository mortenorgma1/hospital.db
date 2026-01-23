-- Creates the core hospital schema with relational tables (provinces, patients, doctors, admissions) 
-- and foreign key links to support patient location tracking, doctor assignments, and admission history analysis.


CREATE TABLE provinces (
    province_id SERIAL PRIMARY KEY,
    province_name TEXT NOT NULL
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender CHAR(1),
    birth_date DATE,
    height INTEGER,
    weight INTEGER,
    province_id INTEGER REFERENCES provinces(province_id)
);

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE admissions (
    admission_id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(patient_id),
    attending_doctor_id INTEGER REFERENCES doctors(doctor_id),
    admission_date DATE NOT NULL,
    discharge_date DATE,
    diagnosis TEXT
);

