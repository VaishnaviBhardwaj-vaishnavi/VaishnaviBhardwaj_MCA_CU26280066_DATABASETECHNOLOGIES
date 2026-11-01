from flask import Flask
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/")

db = client["HospitalDB"]

medicines = db["medicines"]

@app.route("/")
def home():

    try:
        client.admin.command("ping")

        return "Successfully connected to HospitalDB MongoDB!"

    except Exception as e:
        return f"Connection failed: {e}"

if __name__ == "__main__":
    app.run(debug=True)