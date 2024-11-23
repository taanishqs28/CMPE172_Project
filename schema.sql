DROP DATABASE IF EXISTS HospitalManagementSystem;
CREATE DATABASE HospitalManagementSystem;
use HospitalManagementSystem;

CREATE TABLE Insurance (
    InsuranceID     INT PRIMARY KEY,
    Name            VARCHAR(100) NOT NULL,
    Provider        VARCHAR(100) NOT NULL,
    ContactInfo     VARCHAR(100),
    PolicyNumber    VARCHAR(100),
    CoverageDetails TEXT
);

CREATE TABLE Doctor (
    DoctorID    INT PRIMARY KEY,
    Name        VARCHAR(100) NOT NULL,
    Specialty   VARCHAR(100),
    PhoneNumber VARCHAR(10),
    Email       VARCHAR(50)
);

CREATE TABLE Patient (
    PatientID      INT PRIMARY KEY,
    Name           VARCHAR(100) NOT NULL,
    DOB            DATE         NOT NULL,
    PhoneNumber    VARCHAR(10)  NOT NULL,
    MedicalHistory TEXT,
    InsuranceID    INT,
    PrimaryDoctor  INT,
    FOREIGN KEY (InsuranceID) REFERENCES Insurance (InsuranceID),
    FOREIGN KEY (PrimaryDoctor) REFERENCES Doctor (DoctorID)
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID     INT  NOT NULL,
    DoctorID      INT  NOT NULL,
    Date          DATE NOT NULL,
    Time          TIME NOT NULL,
    Reason        ENUM (
        'RegularCheckup',
        'Emergency',
        'FollowUp',
        'ChronicCondition',
        'Screening',
        'Vaccination',
        'Prenatal',
        'PT',
        'Dental'
        )NOT NULL DEFAULT ('RegularCheckup'),
    FOREIGN KEY (PatientID) REFERENCES Patient (PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor (DoctorID)
);

CREATE TABLE Medication (
    MedicationID INT PRIMARY KEY,
    Name         VARCHAR(100) NOT NULL,
    Description  TEXT,
    Manufacturer VARCHAR(255),
    SideEffects  TEXT,
    Cost         DECIMAL(10, 2)
);

CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY,
    PatientID      INT         NOT NULL,
    DoctorID       INT         NOT NULL,
    MedicationID   INT         NOT NULL,
    Dosage         VARCHAR(50) NOT NULL,
    Date           DATE        NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patient (PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor (DoctorID),
    FOREIGN KEY (MedicationID) REFERENCES Medication (MedicationID)
);

CREATE TABLE Billing (
    BillingID     INT PRIMARY KEY,
    AppointmentID INT,
    Amount        DECIMAL(10, 2)                     NOT NULL,
    Status        ENUM ('Paid', 'Unpaid', 'Pending') NOT NULL,
    PatientID     INT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment (AppointmentID),
    FOREIGN KEY (PatientID) REFERENCES Patient (PatientID)
);

CREATE TABLE LabTests (
    TestID    INT PRIMARY KEY,
    PatientID INT  NOT NULL,
    DoctorID  INT,
    TestType  ENUM (
        'Blood',
        'Urine',
        'X-Ray',
        'MRI',
        'CT',
        'Ultrasound',
        'EKG',
        'InfectiousDisease',
        'Cancer',
        'Thyroid'
        ) NOT NULL,
    Date      DATE NOT NULL,
    Result    TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient (PatientID)
);
