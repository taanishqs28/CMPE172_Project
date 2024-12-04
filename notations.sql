-- Basic Math Notation SQL equivalent for outputs:
use HospitalManagementSystem;
-- 1 Find all patients with asthma in their medical history
SELECT Name, PhoneNumber
FROM Patient
WHERE MedicalHistory = 'Asthma';

-- 2. Retrieve all appointments scheduled after '2023-01-01'
SELECT AppointmentID, Date, Time
FROM Appointment
WHERE Date > '2023-01-01';


-- 3 List all medications with a cost greater than $20
SELECT Name, Cost
FROM Medication
WHERE Cost > 20;

-- 4 Retrieve all unpaid bills
SELECT BillingID, Amount
FROM Billing
WHERE Status = 'Unpaid';

-- 5 Find all doctors specializing in 'Neurology'
SELECT Name
FROM Doctor
WHERE Specialty = 'Neurology';

-- intermediate
-- 1  List all patients and their assigned primary doctors, including patients without a doctor
SELECT Patient.Name AS PatientName, Doctor.Name AS DoctorName
FROM Patient
LEFT JOIN Doctor ON Patient.PrimaryDoctor = Doctor.DoctorID;

-- 2  Find the average cost of medications prescribed by each doctor
SELECT Prescription.DoctorID, AVG(Medication.Cost) AS AvgMedicationCost
FROM Prescription
JOIN Medication ON Prescription.MedicationID = Medication.MedicationID
GROUP BY Prescription.DoctorID;

-- advance notation
SELECT Doctor.Name, PatientCount
FROM (
         SELECT Prescription.DoctorID, COUNT(DISTINCT Prescription.PatientID) AS PatientCount
         FROM Prescription
         GROUP BY Prescription.DoctorID
         HAVING COUNT(DISTINCT Prescription.PatientID) = (
             SELECT MAX(PatientCount)
             FROM (
                      SELECT COUNT(DISTINCT PatientID) AS PatientCount
                      FROM Prescription
                      GROUP BY DoctorID
                  ) AS SubQuery
         )
     ) AS TopDoctors
         JOIN Doctor ON TopDoctors.DoctorID = Doctor.DoctorID;
