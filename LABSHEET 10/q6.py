from flask import Flask, render_template_string
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]

@app.route("/")
def view_medicines():

    data = list(medicines.find({}, {"_id": 0}))

    html = """
    <h1>All Medicines</h1>

    <table border="1" cellpadding="10">

    <tr>
        <th>Medicine ID</th>
        <th>Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Stock</th>
        <th>Manufacturer</th>
    </tr>

    {% for m in data %}
    <tr>
        <td>{{m.medicine_id}}</td>
        <td>{{m.name}}</td>
        <td>{{m.category}}</td>
        <td>{{m.price}}</td>
        <td>{{m.stock}}</td>
        <td>{{m.manufacturer}}</td>
    </tr>
    {% endfor %}

    </table>
    """

    return render_template_string(html, data=data)

if __name__ == "__main__":
    app.run(debug=True)