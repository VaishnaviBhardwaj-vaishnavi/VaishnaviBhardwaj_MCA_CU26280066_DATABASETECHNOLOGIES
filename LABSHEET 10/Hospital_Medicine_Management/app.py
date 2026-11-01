from flask import Flask, render_template, request, redirect, url_for
from pymongo import MongoClient

app = Flask(__name__)

# MongoDB Connection
client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]


# Home Page
@app.route("/")
def home():
    return render_template("index.html", page="home")


# Add Medicine
@app.route("/add", methods=["GET", "POST"])
def add_medicine():

    message = ""

    if request.method == "POST":

        medicine = {
            "medicine_id": int(request.form["medicine_id"]),
            "name": request.form["name"],
            "category": request.form["category"],
            "price": float(request.form["price"]),
            "stock": int(request.form["stock"]),
            "manufacturer": request.form["manufacturer"],
            "supplier": {
                "name": request.form.get("supplier_name", ""),
                "phone": request.form.get("supplier_phone", ""),
                "city": request.form.get("supplier_city", "")
            }
        }

        if medicines.find_one({
            "medicine_id": medicine["medicine_id"]
        }):
            message = "Medicine ID already exists!"

        else:
            medicines.insert_one(medicine)
            message = "Medicine Added Successfully!"

    return render_template(
        "index.html",
        page="add",
        message=message
    )


# View Medicines
@app.route("/view")
def view_medicines():

    data = list(medicines.find({}, {"_id": 0}))

    return render_template(
        "index.html",
        page="view",
        data=data
    )


# Search Medicine
@app.route("/search", methods=["GET", "POST"])
def search_medicine():

    result = None
    message = ""

    if request.method == "POST":

        value = request.form["search"]

        try:
            result = medicines.find_one({
                "medicine_id": int(value)
            })

        except ValueError:
            result = medicines.find_one({
                "name": {
                    "$regex": value,
                    "$options": "i"
                }
            })

        if result is None:
            message = "Medicine Not Found!"

    return render_template(
        "index.html",
        page="search",
        result=result,
        message=message
    )


# Update Stock
@app.route("/update", methods=["GET", "POST"])
def update_stock():

    message = ""

    if request.method == "POST":

        medicine_id = int(request.form["medicine_id"])
        new_stock = int(request.form["stock"])

        result = medicines.update_one(
            {"medicine_id": medicine_id},
            {"$set": {"stock": new_stock}}
        )

        if result.matched_count:
            message = "Stock Updated Successfully!"
        else:
            message = "Medicine Not Found!"

    return render_template(
        "index.html",
        page="update",
        message=message
    )


# Delete Medicine
@app.route("/delete", methods=["GET", "POST"])
def delete_medicine():

    message = ""

    if request.method == "POST":

        medicine_id = int(request.form["medicine_id"])

        result = medicines.delete_one({
            "medicine_id": medicine_id
        })

        if result.deleted_count:
            message = "Medicine Deleted Successfully!"
        else:
            message = "Medicine Not Found!"

    return render_template(
        "index.html",
        page="delete",
        message=message
    )


# Low Stock Medicines
@app.route("/low-stock")
def low_stock():

    data = list(
        medicines.find(
            {"stock": {"$lt": 30}},
            {"_id": 0}
        )
    )

    return render_template(
        "index.html",
        page="low",
        data=data
    )


# Inventory Report
@app.route("/report")
def inventory_report():

    total_medicines = medicines.count_documents({})

    stock_result = list(medicines.aggregate([
        {
            "$group": {
                "_id": None,
                "total": {"$sum": "$stock"}
            }
        }
    ]))

    total_stock = (
        stock_result[0]["total"] if stock_result else 0
    )

    low_count = medicines.count_documents({
        "stock": {"$lt": 30}
    })

    expensive = medicines.find_one(
        sort=[("price", -1)]
    )

    cheapest = medicines.find_one(
        sort=[("price", 1)]
    )

    return render_template(
        "index.html",
        page="report",
        total_medicines=total_medicines,
        total_stock=total_stock,
        low_count=low_count,
        expensive=expensive,
        cheapest=cheapest
    )


if __name__ == "__main__":
    app.run(debug=True)