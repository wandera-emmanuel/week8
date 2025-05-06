# Clinic Booking System 🏥

## Overview
The **Clinic Booking System** is a **relational database and RESTful API** designed to manage patient records, doctor details, appointments, and prescriptions efficiently. It ensures **data integrity** using structured SQL tables and facilitates **CRUD operations** via FastAPI.

## Features 🚀
✅ **Relational Database (MySQL)**
- Patients, Doctors, Appointments, and Prescriptions tables.
- Proper constraints (**PK, FK, NOT NULL, UNIQUE**) ensuring referential integrity.

✅ **RESTful API (FastAPI + MySQL)**
- CRUD operations for managing patients.
- Simple API endpoints for seamless data interaction.

## Database Schema 🗄️
### **Tables & Relationships**
- **Patients** (One-to-Many → Appointments, Prescriptions)
- **Doctors** (One-to-Many → Appointments, Prescriptions)
- **Appointments** (Many-to-Many → Patients & Doctors)
- **Prescriptions** (One-to-Many → Patients)

### **SQL Structure**
```sql
CREATE TABLE Patients (
    patientID INT PRIMARY KEY AUTO_INCREMENT,
    fullName VARCHAR(100) NOT NULL,
    dateOfBirth DATE NOT NULL,
    contactNumber VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Doctors (
    doctorID INT PRIMARY KEY AUTO_INCREMENT,
    fullName VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    contactNumber VARCHAR(15) UNIQUE NOT NULL
);
