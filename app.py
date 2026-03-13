import os
from flask import Flask, jsonify
app = Flask(__name__)

@app.route("/")
def main():
    return jsonify({"message": "Welcome!"})

@app.route('/how-are-you')
def hello():
    return jsonify({"message": "I am good, how about you?"})

if __name__ == "__main__":
    port = int(os.environ.get("FLASK_RUN_PORT", 8080))
    app.run(host="0.0.0.0", port=port)
