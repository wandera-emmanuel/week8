-- Creating Patients Table
CREATE TABLE Patients (
    patientID INT PRIMARY KEY AUTO_INCREMENT,
    fullName VARCHAR(100) NOT NULL,
    dateOfBirth DATE NOT NULL,
    contactNumber VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Creating Doctors Table
CREATE TABLE Doctors (
    doctorID INT PRIMARY KEY AUTO_INCREMENT,
    fullName VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    contactNumber VARCHAR(15) UNIQUE NOT NULL
);

-- Creating Appointments Table (Many-to-Many Relationship)
CREATE TABLE Appointments (
    appointmentID INT PRIMARY KEY AUTO_INCREMENT,
    patientID INT NOT NULL,
    doctorID INT NOT NULL,
    appointmentDate DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Canceled') DEFAULT 'Scheduled',
    FOREIGN KEY (patientID) REFERENCES Patients(patientID),
    FOREIGN KEY (doctorID) REFERENCES Doctors(doctorID)
);

-- Creating Prescriptions Table (One-to-Many Relationship with Patients)
CREATE TABLE Prescriptions (
    prescriptionID INT PRIMARY KEY AUTO_INCREMENT,
    patientID INT NOT NULL,
    doctorID INT NOT NULL,
    medication VARCHAR(255) NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    issueDate DATE NOT NULL,
    FOREIGN KEY (patientID) REFERENCES Patients(patientID),
    FOREIGN KEY (doctorID) REFERENCES Doctors(doctorID)
);

-- Data Insertion
INSERT INTO Patients (fullName, dateOfBirth, contactNumber, email) VALUES 
('paul papa', '1985-06-15', '0712345678', 'paul@gmail.com'),
('moses apel', '1990-03-22', '0723456789', 'moses@gmail.com');

INSERT INTO Doctors (fullName, specialty, contactNumber) VALUES
('Dr.tantuki', 'Cardiology', '0734567890'),
(' Dr.Emmanuel', 'Dermatology', '0745678901');

INSERT INTO Appointments (patientID, doctorID, appointmentDate) VALUES
(1, 1, '2025-05-10 10:00:00'),
(2, 2, '2025-05-11 14:00:00');

INSERT INTO Prescriptions (patientID, doctorID, medication, dosage, issueDate) VALUES
(1, 1, 'Atorvastatin', '10mg once daily', '2025-05-10'),
(2, 2, 'Hydrocortisone', 'Apply twice daily', '2025-05-11');
