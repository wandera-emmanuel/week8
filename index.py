from fastapi import FastAPI
import mysql.connector

# Connecting to the MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="yourpassword",
    database="clinic_db"
)
cursor = db.cursor()

app = FastAPI()

# CRUD: Create Patient
@app.post("/patients/")
def create_patient(fullName: str, dateOfBirth: str, contactNumber: str, email: str):
    query = "INSERT INTO Patients (fullName, dateOfBirth, contactNumber, email) VALUES (%s, %s, %s, %s)"
    cursor.execute(query, (fullName, dateOfBirth, contactNumber, email))
    db.commit()
    return {"message": "Patient added successfully"}

# CRUD: Read Patients
@app.get("/patients/")
def get_patients():
    cursor.execute("SELECT * FROM Patients")
    result = cursor.fetchall()
    return {"patients": result}

# CRUD: Update Patient
@app.put("/patients/{patientID}")
def update_patient(patientID: int, fullName: str, contactNumber: str):
    query = "UPDATE Patients SET fullName=%s, contactNumber=%s WHERE patientID=%s"
    cursor.execute(query, (fullName, contactNumber, patientID))
    db.commit()
    return {"message": "Patient details updated"}

# CRUD: Delete Patient
@app.delete("/patients/{patientID}")
def delete_patient(patientID: int):
    query = "DELETE FROM Patients WHERE patientID=%s"
    cursor.execute(query, (patientID,))
    db.commit()
    return {"message": "Patient deleted successfully"}

