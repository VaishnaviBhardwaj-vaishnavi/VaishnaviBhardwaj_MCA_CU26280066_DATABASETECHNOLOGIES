from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]

@app.route("/")
def home():
    return render_template("q2_form.html")

@app.route("/add", methods=["POST"])
def add_medicine():

    medicine = {
        "medicine_id": int(request.form["medicine_id"]),
        "name": request.form["name"],
        "category": request.form["category"],
        "price": float(request.form["price"]),
        "stock": int(request.form["stock"]),
        "manufacturer": request.form["manufacturer"]
    }

    if medicines.find_one({
        "medicine_id": medicine["medicine_id"]
    }):
        return "Medicine ID already exists!"

    medicines.insert_one(medicine)

    return "Medicine Added Successfully!"

if __name__ == "__main__":
    app.run(debug=True)