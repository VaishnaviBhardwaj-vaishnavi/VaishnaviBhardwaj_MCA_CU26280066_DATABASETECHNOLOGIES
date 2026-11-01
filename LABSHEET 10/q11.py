from flask import Flask, render_template_string
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]

@app.route("/")
def add_supplier():

    supplier_data = [
        {
            "medicine_id": 309,
            "name": "Dolo 650",
            "category": "Analgesic",
            "price": 30,
            "stock": 80,
            "manufacturer": "Micro Labs",
            "supplier": {
                "name": "Rahul Traders",
                "phone": "9876543210",
                "city": "Haridwar"
            }
        },
        {
            "medicine_id": 310,
            "name": "Allegra",
            "category": "Antihistamine",
            "price": 95,
            "stock": 60,
            "manufacturer": "Sanofi",
            "supplier": {
                "name": "Amit Medical Store",
                "phone": "9876543211",
                "city": "Roorkee"
            }
        },
        {
            "medicine_id": 311,
            "name": "Pantoprazole",
            "category": "Antacid",
            "price": 55,
            "stock": 45,
            "manufacturer": "Sun Pharma",
            "supplier": {
                "name": "Sharma Distributors",
                "phone": "9876543212",
                "city": "Dehradun"
            }
        }
    ]

    for medicine in supplier_data:

        medicines.update_one(
            {"medicine_id": medicine["medicine_id"]},
            {"$setOnInsert": medicine},
            upsert=True
        )

    data = list(
        medicines.find(
            {"supplier": {"$exists": True}},
            {"_id": 0}
        )
    )

    html = """
    <h1>Medicine and Supplier Details</h1>

    <table border="1" cellpadding="10">

    <tr>
        <th>Medicine</th>
        <th>Category</th>
        <th>Supplier Name</th>
        <th>Phone</th>
        <th>City</th>
    </tr>

    {% for m in data %}
    <tr>
        <td>{{m.name}}</td>
        <td>{{m.category}}</td>
        <td>{{m.supplier.name}}</td>
        <td>{{m.supplier.phone}}</td>
        <td>{{m.supplier.city}}</td>
    </tr>
    {% endfor %}

    </table>
    """

    return render_template_string(html, data=data)

if __name__ == "__main__":
    app.run(debug=True)