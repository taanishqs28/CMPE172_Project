use HospitalManagementSystem;

INSERT INTO Insurance (InsuranceID, Name, Provider, ContactInfo, PolicyNumber, CoverageDetails)
VALUES (1, 'Health Plan A', 'Provider A', '123-456-7890', 'POL123', 'Full coverage'),
       (2, 'Health Plan B', 'Provider B', '098-765-4321', 'POL456', 'Partial coverage'),
       (3, 'Health Plan C', 'Provider C', '111-222-3333', 'POL789', 'No coverage'),
       (4, 'Health Plan D', 'Provider D', '444-555-6666', 'POL000', 'Partial coverage'),
       (5, 'Health Plan E', 'Provider E', '777-888-9999', 'POL999', 'Comprehensive coverage'),
       (6, 'Health Plan F', 'Provider F', '666-555-4444', 'POL666', 'Partial coverage');


INSERT INTO Doctor (DoctorID, Name, Specialty, PhoneNumber, Email)
VALUES (1, 'Dr. Alice Johnson', 'Cardiology', '1112223333', 'alice.johnson@example.com'),
       (2, 'Dr. Bob Brown', 'Pediatrics', '4445556666', 'bob.brown@example.com');


INSERT INTO Patient (PatientID, Name, DOB, PhoneNumber, MedicalHistory, InsuranceID, PrimaryDoctor)
VALUES (1, 'John Doe', '1980-01-01', '1234567890', 'None', 1, 1),
       (2, 'Jane Smith', '1990-02-02', '0987654321', 'Asthma', 2, 2);

INSERT INTO Appointment (AppointmentID, PatientID, DoctorID, Date, Time, Reason)
VALUES (1, 1, 1, '2023-01-01', '09:00:00', 'RegularCheckup'),
       (2, 2, 2, '2023-01-02', '10:00:00', 'FollowUp');

INSERT INTO Medication (MedicationID, Name, Description, Manufacturer, SideEffects, Cost)
VALUES (1, 'Aspirin', 'Pain reliever', 'Pharma Inc.', 'Nausea', 5.00),
       (2, 'Ibuprofen', 'Anti-inflammatory', 'Health Corp.', 'Dizziness', 10.00);

INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, MedicationID, Dosage, Date)
VALUES (1, 1, 1, 1, '1 tablet daily', '2023-01-01'),
       (2, 2, 2, 2, '2 tablets daily', '2023-01-02');

INSERT INTO Billing (BillingID, AppointmentID, Amount, Status, PatientID)
VALUES (1, 1, 100.00, 'Paid', 1),
       (2, 2, 150.00, 'Unpaid', 2);

INSERT INTO LabTests (TestID, PatientID, DoctorID, TestType, Date, Result)
VALUES (1, 1, 1, 'Blood', '2023-01-01', 'Normal'),
       (2, 2, 2, 'X-Ray', '2023-01-02', 'Fracture');


-- more

-- Insert more dummy data into Doctor table
INSERT INTO Doctor (DoctorID, Name, Specialty, PhoneNumber, Email)
VALUES (3, 'Dr. Charlie Green', 'Dermatology', '3334445555', 'charlie.green@example.com'),
       (4, 'Dr. Diana White', 'Neurology', '6667778888', 'diana.white@example.com'),
       (5, 'Dr. Edward Black', 'Orthopedics', '9990001111', 'edward.black@example.com'),
       (6, 'Dr. Fiona Blue', 'Gastroenterology', '2223334444', 'fiona.blue@example.com'),
       (7, 'Dr. George Red', 'Oncology', '5556667777', 'george.red@example.com'),
       (8, 'Dr. Hannah Yellow', 'Endocrinology', '8889990000', 'hannah.yellow@example.com'),
       (9, 'Dr. Ian Purple', 'Rheumatology', '1112223333', 'ian.purple@example.com'),
       (10, 'Dr. Julia Orange', 'Ophthalmology', '4445556666', 'julia.orange@example.com');

-- Insert more dummy data into Patient table
INSERT INTO Patient (PatientID, Name, DOB, PhoneNumber, MedicalHistory, InsuranceID, PrimaryDoctor)
VALUES (3, 'Alice Brown', '1985-03-03', '2345678901', 'Diabetes', 3, 3),
       (4, 'Bob White', '1975-04-04', '3456789012', 'Hypertension', 4, 4),
       (5, 'Charlie Black', '1965-05-05', '4567890123', 'Heart Disease', 5, 5),
       (6, 'Diana Green', '1995-06-06', '5678901234', 'Asthma', 6, 6),
       (7, 'Edward Blue', '2000-07-07', '6789012345', 'None', 1, 7),
       (8, 'Fiona Red', '1988-08-08', '7890123456', 'Allergies', 2, 8),
       (9, 'George Yellow', '1992-09-09', '8901234567', 'Arthritis', 3, 9),
       (10, 'Hannah Purple', '1983-10-10', '9012345678', 'Thyroid Issues', 4, 10);

-- Insert more dummy data into Appointment table
INSERT INTO Appointment (AppointmentID, PatientID, DoctorID, Date, Time, Reason)
VALUES (3, 3, 3, '2023-01-03', '11:00:00', 'FollowUp'),
       (4, 4, 4, '2023-01-04', '12:00:00', 'RegularCheckup'),
       (5, 5, 5, '2023-01-05', '13:00:00', 'Emergency'),
       (6, 6, 6, '2023-01-06', '14:00:00', 'ChronicCondition'),
       (7, 7, 7, '2023-01-07', '15:00:00', 'Screening'),
       (8, 8, 8, '2023-01-08', '16:00:00', 'Vaccination'),
       (9, 9, 9, '2023-01-09', '17:00:00', 'Prenatal'),
       (10, 10, 10, '2023-01-10', '18:00:00', 'PT');

-- Insert more dummy data into Medication table
INSERT INTO Medication (MedicationID, Name, Description, Manufacturer, SideEffects, Cost)
VALUES (3, 'Paracetamol', 'Pain reliever', 'Pharma Inc.', 'None', 3.00),
       (4, 'Metformin', 'Diabetes medication', 'Health Corp.', 'Nausea', 8.00),
       (5, 'Lisinopril', 'Blood pressure medication', 'Wellness Ltd.', 'Dizziness', 12.00),
       (6, 'Atorvastatin', 'Cholesterol medication', 'Medico Inc.', 'Muscle pain', 15.00),
       (7, 'Omeprazole', 'Acid reflux medication', 'Pharma Inc.', 'Headache', 7.00),
       (8, 'Amoxicillin', 'Antibiotic', 'Health Corp.', 'Rash', 10.00),
       (9, 'Levothyroxine', 'Thyroid medication', 'Wellness Ltd.', 'Insomnia', 20.00),
       (10, 'Albuterol', 'Asthma medication', 'Medico Inc.', 'Tremor', 25.00);

-- Insert more dummy data into Prescription table
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, MedicationID, Dosage, Date)
VALUES (3, 3, 3, 3, '1 tablet daily', '2023-01-03'),
       (4, 4, 4, 4, '2 tablets daily', '2023-01-04'),
       (5, 5, 5, 5, '1 tablet daily', '2023-01-05'),
       (6, 6, 6, 6, '2 tablets daily', '2023-01-06'),
       (7, 7, 7, 7, '1 tablet daily', '2023-01-07'),
       (8, 8, 8, 8, '2 tablets daily', '2023-01-08'),
       (9, 9, 9, 9, '1 tablet daily', '2023-01-09'),
       (10, 10, 10, 10, '2 tablets daily', '2023-01-10');

-- Insert more dummy data into Billing table
INSERT INTO Billing (BillingID, AppointmentID, Amount, Status, PatientID)
VALUES (3, 3, 200.00, 'Paid', 3),
       (4, 4, 250.00, 'Unpaid', 4),
       (5, 5, 300.00, 'Pending', 5),
       (6, 6, 350.00, 'Paid', 6),
       (7, 7, 400.00, 'Unpaid', 7),
       (8, 8, 450.00, 'Pending', 8),
       (9, 9, 500.00, 'Paid', 9),
       (10, 10, 550.00, 'Unpaid', 10);

-- Insert more dummy data into LabTests table
INSERT INTO LabTests (TestID, PatientID, DoctorID, TestType, Date, Result)
VALUES (3, 3, 3, 'Urine', '2023-01-03', 'Normal'),
       (4, 4, 4, 'X-Ray', '2023-01-04', 'Normal'),
       (5, 5, 5, 'MRI', '2023-01-05', 'Abnormal'),
       (6, 6, 6, 'CT', '2023-01-06', 'Normal'),
       (7, 7, 7, 'Ultrasound', '2023-01-07', 'Normal'),
       (8, 8, 8, 'EKG', '2023-01-08', 'Abnormal'),
       (9, 9, 9, 'InfectiousDisease', '2023-01-09', 'Negative'),
       (10, 10, 10, 'Cancer', '2023-01-10', 'Positive');

INSERT INTO Patient (PatientID, Name, DOB, PhoneNumber, MedicalHistory, InsuranceID, PrimaryDoctor)
VALUES (3, 'Alice Brown', '1985-03-03', '2345678901', 'Diabetes', 3, 1),
       (4, 'Bob White', '1975-04-04', '3456789012', 'Hypertension', 4, 2),
       (5, 'Charlie Black', '1965-05-05', '4567890123', 'Heart Disease', 5, 1),
       (6, 'Diana Green', '1995-06-06', '5678901234', 'Asthma', 6, 2),
       (7, 'Edward Blue', '2000-07-07', '6789012345', 'None', 1, 1),
       (8, 'Fiona Red', '1988-08-08', '7890123456', 'Allergies', 2, 2),
       (9, 'George Yellow', '1992-09-09', '8901234567', 'Arthritis', 3, 1),
       (10, 'Hannah Purple', '1983-10-10', '9012345678', 'Thyroid Issues', 4, 2),
       (11, 'Ivy Orange', '1991-11-11', '0123456789', 'Migraine', 5, 1),
       (12, 'Jack Blue', '1987-12-12', '1234509876', 'Back Pain', 6, 2);