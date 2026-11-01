from flask import Flask, request, render_template_string
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]

@app.route("/", methods=["GET", "POST"])
def update_stock():

    message = ""

    if request.method == "POST":

        medicine_id = int(request.form["medicine_id"])
        new_stock = int(request.form["new_stock"])

        result = medicines.update_one(
            {"medicine_id": medicine_id},
            {"$set": {"stock": new_stock}}
        )

        if result.matched_count > 0:
            message = "Stock Updated Successfully!"
        else:
            message = "Medicine Not Found!"

    html = """
    <h1>Update Medicine Stock</h1>

    <form method="POST">

        <label>Medicine ID:</label>
        <input type="number" name="medicine_id" required>

        <br><br>

        <label>New Stock:</label>
        <input type="number" name="new_stock" min="0" required>

        <br><br>

        <button type="submit">Update Stock</button>

    </form>

    <h3>{{message}}</h3>
    """

    return render_template_string(html, message=message)

if __name__ == "__main__":
    app.run(debug=True)