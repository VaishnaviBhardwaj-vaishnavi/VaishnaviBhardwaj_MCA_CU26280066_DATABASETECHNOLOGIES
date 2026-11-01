from flask import Flask, render_template_string
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]

@app.route("/")
def inventory_report():

    total_medicines = medicines.count_documents({})

    result = list(medicines.aggregate([
        {
            "$group": {
                "_id": None,
                "total_stock": {"$sum": "$stock"}
            }
        }
    ]))

    total_stock = result[0]["total_stock"] if result else 0

    low_stock = list(
        medicines.find(
            {"stock": {"$lt": 30}},
            {"_id": 0}
        )
    )

    expensive = medicines.find_one(
        sort=[("price", -1)]
    )

    cheapest = medicines.find_one(
        sort=[("price", 1)]
    )

    html = """
    <h1>Hospital Medicine Inventory Report</h1>

    <h2>Total Medicines: {{total_medicines}}</h2>

    <h2>Total Stock: {{total_stock}}</h2>

    <h2>Low Stock Medicines</h2>

    <table border="1" cellpadding="10">

    <tr>
        <th>Medicine ID</th>
        <th>Name</th>
        <th>Stock</th>
    </tr>

    {% for m in low_stock %}
    <tr>
        <td>{{m.medicine_id}}</td>
        <td>{{m.name}}</td>
        <td>{{m.stock}}</td>
    </tr>
    {% endfor %}

    </table>

    <h2>Most Expensive Medicine</h2>

    {% if expensive %}
    <p>{{expensive.name}} - ₹{{expensive.price}}</p>
    {% else %}
    <p>No medicine available.</p>
    {% endif %}

    <h2>Cheapest Medicine</h2>

    {% if cheapest %}
    <p>{{cheapest.name}} - ₹{{cheapest.price}}</p>
    {% else %}
    <p>No medicine available.</p>
    {% endif %}
    """

    return render_template_string(
        html,
        total_medicines=total_medicines,
        total_stock=total_stock,
        low_stock=low_stock,
        expensive=expensive,
        cheapest=cheapest
    )

if __name__ == "__main__":
    app.run(debug=True)