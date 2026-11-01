
from flask import Flask, render_template, request, redirect, url_for
from pymongo import MongoClient

app = Flask(__name__)

# Connect to MongoDB
client = MongoClient("mongodb://localhost:27017/")

# Select database and collection
db = client["CollegeDB"]
students = db["students"]

# Verify MongoDB connection
try:
    client.admin.command("ping")
    print("MongoDB connected successfully!")
except Exception as e:
    print("MongoDB connection failed:", e)


# Home Page
@app.route("/")
def home():
    return render_template("index.html")


# Q6 - Add Student
@app.route("/add", methods=["GET", "POST"])
def add_student():
    if request.method == "POST":
        student = {
            "student_id": int(request.form["student_id"]),
            "name": request.form["name"],
            "age": int(request.form["age"]),
            "gender": request.form["gender"],
            "department": request.form["department"],
            "marks": float(request.form["marks"])
        }

        if students.find_one({"student_id": student["student_id"]}):
            return "Student ID already exists!"

        students.insert_one(student)

        return "Student added successfully!"

    return render_template("add_student.html")


# Q7 - View All Students
@app.route("/view")
def view_students():
    all_students = list(students.find())
    return render_template("students.html", students=all_students)


# Q8 - Search Student
@app.route("/search", methods=["GET", "POST"])
def search_student():
    student = None
    message = ""

    if request.method == "POST":
        student_id = int(request.form["student_id"])

        student = students.find_one(
            {"student_id": student_id}
        )

        if student is None:
            message = "Student not found!"

    return render_template(
        "search.html",
        student=student,
        message=message
    )


# Q9 - Update Student
@app.route("/update", methods=["GET", "POST"])
def update_student():
    message = ""

    if request.method == "POST":
        student_id = int(request.form["student_id"])

        result = students.update_one(
            {"student_id": student_id},
            {
                "$set": {
                    "name": request.form["name"],
                    "age": int(request.form["age"]),
                    "department": request.form["department"],
                    "marks": float(request.form["marks"])
                }
            }
        )

        if result.matched_count > 0:
            message = "Student updated successfully!"
        else:
            message = "Student not found!"

    return render_template("update.html", message=message)


# Q10 - Delete Student
@app.route("/delete", methods=["GET", "POST"])
def delete_student():
    message = ""

    if request.method == "POST":
        student_id = int(request.form["student_id"])

        result = students.delete_one(
            {"student_id": student_id}
        )

        if result.deleted_count > 0:
            message = "Student deleted successfully!"
        else:
            message = "Student not found!"

    return render_template("delete.html", message=message)


# Q11 - MongoDB Filtering
@app.route("/filters")
def filters():
    department = students.find(
        {"department": "Computer Science"}
    )

    high_marks = students.find(
        {"marks": {"$gt": 75}}
    )

    marks_range = students.find(
        {"marks": {"$gte": 50, "$lte": 80}}
    )

    older_students = students.find(
        {"age": {"$gt": 20}}
    )

    return render_template(
        "filters.html",
        department=list(department),
        high_marks=list(high_marks),
        marks_range=list(marks_range),
        older_students=list(older_students)
    )


# Run Flask Application
if __name__ == "__main__":
    app.run(debug=True)
