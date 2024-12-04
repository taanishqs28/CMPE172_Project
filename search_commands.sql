use HospitalManagementSystem;

# 5 basic queries
-- 1. Retrieve all doctors and their specialties
SELECT Name, Specialty FROM Doctor;

-- 2. List all patients along with their primary doctor's name
SELECT Patient.Name AS PatientName, Doctor.Name AS DoctorName
FROM Patient
JOIN Doctor ON Patient.PrimaryDoctor = Doctor.DoctorID;

-- 3. Find all appointments for a specific patient (e.g., PatientID = 1)
SELECT * FROM Appointment
WHERE PatientID = 1;

-- 4. Get all medications prescribed to a specific patient (e.g., PatientID = 1)
SELECT Medication.Name, Prescription.Dosage, Prescription.Date
FROM Prescription
JOIN Medication ON Prescription.MedicationID = Medication.MedicationID
WHERE Prescription.PatientID = 1;

-- 5. List all lab tests conducted by a specific doctor (e.g., DoctorID = 1)
SELECT * FROM LabTests
WHERE DoctorID = 1;


# 5 intermediate queries
-- 1. Retrieve all patients along with their primary doctor's name and insurance details
SELECT Patient.Name AS PatientName, Doctor.Name AS DoctorName, Insurance.Name AS InsuranceName, Insurance.Provider
FROM Patient
JOIN Doctor ON Patient.PrimaryDoctor = Doctor.DoctorID
JOIN Insurance ON Patient.InsuranceID = Insurance.InsuranceID;

-- 2. List all appointments with patient name, doctor name, and appointment details
SELECT Appointment.Date, Appointment.Time, Appointment.Reason, Patient.Name AS PatientName, Doctor.Name AS DoctorName
FROM Appointment
JOIN Patient ON Appointment.PatientID = Patient.PatientID
JOIN Doctor ON Appointment.DoctorID = Doctor.DoctorID;

-- 3. Find all prescriptions with patient name, doctor name, and medication details
SELECT Patient.Name AS PatientName, Doctor.Name AS DoctorName, Medication.Name AS MedicationName, Prescription.Dosage, Prescription.Date
FROM Prescription
JOIN Patient ON Prescription.PatientID = Patient.PatientID
JOIN Doctor ON Prescription.DoctorID = Doctor.DoctorID
JOIN Medication ON Prescription.MedicationID = Medication.MedicationID;

-- 4. Get all lab tests with patient name, doctor name, and test details
SELECT LabTests.Date, LabTests.TestType, LabTests.Result, Patient.Name AS PatientName, Doctor.Name AS DoctorName
FROM LabTests
JOIN Patient ON LabTests.PatientID = Patient.PatientID
LEFT JOIN Doctor ON LabTests.DoctorID = Doctor.DoctorID;

-- 5. List all billing records with patient name, appointment details, and billing status
SELECT Billing.Amount, Billing.Status, Patient.Name AS PatientName, Appointment.Date AS AppointmentDate, Appointment.Time AS AppointmentTime
FROM Billing
JOIN Patient ON Billing.PatientID = Patient.PatientID
JOIN Appointment ON Billing.AppointmentID = Appointment.AppointmentID;


# 5 advanced queries
-- 1. Retrieve the names of patients who have been prescribed medications by doctors specializing in 'Cardiology'
SELECT Patient.Name
FROM Patient
WHERE PatientID IN (
    SELECT Prescription.PatientID
    FROM Prescription
    JOIN Doctor ON Prescription.DoctorID = Doctor.DoctorID
    WHERE Doctor.Specialty = 'Cardiology'
);

-- 2. List all doctors who have appointments with patients who have 'Asthma' in their medical history
SELECT Doctor.Name
FROM Doctor
WHERE DoctorID IN (
    SELECT Appointment.DoctorID
    FROM Appointment
    JOIN Patient ON Appointment.PatientID = Patient.PatientID
    WHERE Patient.MedicalHistory LIKE '%Asthma%'
);

-- 3. Find the total amount billed for each patient along with their name
SELECT Patient.Name, (
    SELECT SUM(Billing.Amount)
    FROM Billing
    WHERE Billing.PatientID = Patient.PatientID
) AS TotalBilled
FROM Patient;

-- 4. Get the details of the most recent lab test for each patient
SELECT Patient.Name, LabTests.TestType, LabTests.Date, LabTests.Result
FROM Patient
JOIN LabTests ON Patient.PatientID = LabTests.PatientID
WHERE LabTests.Date = (
    SELECT MAX(Date)
    FROM LabTests AS lt
    WHERE lt.PatientID = Patient.PatientID
);

-- 5. List all patients who have had more than one appointment with the same doctor
SELECT Patient.Name
FROM Patient
WHERE PatientID IN (
    SELECT PatientID
    FROM Appointment
    GROUP BY PatientID, DoctorID
    HAVING COUNT(*) > 1
);