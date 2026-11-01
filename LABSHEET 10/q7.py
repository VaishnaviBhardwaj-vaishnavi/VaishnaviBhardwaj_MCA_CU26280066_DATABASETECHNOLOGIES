from flask import Flask, request, render_template_string
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]

@app.route("/", methods=["GET", "POST"])
def search():

    result = None
    message = ""

    if request.method == "POST":

        search_value = request.form["search"]

        try:
            medicine_id = int(search_value)

            result = medicines.find_one({
                "medicine_id": medicine_id
            })

        except ValueError:

            result = medicines.find_one({
                "name": {
                    "$regex": search_value,
                    "$options": "i"
                }
            })

        if result is None:
            message = "No Medicine Found!"

    html = """
    <h1>Search Medicine</h1>

    <form method="POST">

        <input type="text" name="search"
        placeholder="Enter Medicine ID or Name" required>

        <button type="submit">Search</button>

    </form>

    <h3>{{message}}</h3>

    {% if result %}
        <p>Medicine ID: {{result.medicine_id}}</p>
        <p>Name: {{result.name}}</p>
        <p>Category: {{result.category}}</p>
        <p>Price: {{result.price}}</p>
        <p>Stock: {{result.stock}}</p>
        <p>Manufacturer: {{result.manufacturer}}</p>
    {% endif %}
    """

    return render_template_string(
        html, result=result, message=message
    )

if __name__ == "__main__":
    app.run(debug=True)