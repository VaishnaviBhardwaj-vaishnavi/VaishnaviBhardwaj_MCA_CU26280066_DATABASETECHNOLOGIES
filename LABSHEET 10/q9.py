from flask import Flask, request, render_template_string
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]

@app.route("/", methods=["GET", "POST"])
def delete_medicine():

    message = ""

    if request.method == "POST":

        medicine_id = int(request.form["medicine_id"])

        result = medicines.delete_one({
            "medicine_id": medicine_id
        })

        if result.deleted_count > 0:

            check = medicines.find_one({
                "medicine_id": medicine_id
            })

            if check is None:
                message = "Medicine Deleted Successfully!"

        else:
            message = "Medicine Not Found!"

    html = """
    <h1>Delete Medicine</h1>

    <form method="POST">

        <label>Medicine ID:</label>

        <input type="number"
        name="medicine_id" required>

        <button type="submit">Delete Medicine</button>

    </form>

    <h3>{{message}}</h3>
    """

    return render_template_string(html, message=message)

if __name__ == "__main__":
    app.run(debug=True)