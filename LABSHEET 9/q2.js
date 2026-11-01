
// Select or create database
db = db.getSiblingDB("CollegeDB");

// Create students collection
db.createCollection("students");

// Insert 5 student records
db.students.insertMany([
    {
        student_id: 101,
        name: "Aarav",
        age: 21,
        gender: "Male",
        department: "Computer Science",
        marks: 85
    },
    {
        student_id: 102,
        name: "Priya",
        age: 20,
        gender: "Female",
        department: "Information Technology",
        marks: 90
    },
    {
        student_id: 103,
        name: "Rahul",
        age: 22,
        gender: "Male",
        department: "Computer Science",
        marks: 72
    },
    {
        student_id: 104,
        name: "Neha",
        age: 19,
        gender: "Female",
        department: "Management",
        marks: 65
    },
    {
        student_id: 105,
        name: "Karan",
        age: 23,
        gender: "Male",
        department: "Information Technology",
        marks: 78
    }
]);

// Display all students
db.students.find().pretty();

print("Database and student records created successfully!");
