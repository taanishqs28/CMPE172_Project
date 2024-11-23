use HospitalManagementSystem;

INSERT INTO Insurance (InsuranceID, Name, Provider, ContactInfo, PolicyNumber, CoverageDetails)
VALUES (1, 'Health Plan A', 'Provider A', '123-456-7890', 'POL123', 'Full coverage'),
       (2, 'Health Plan B', 'Provider B', '098-765-4321', 'POL456', 'Partial coverage');

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
