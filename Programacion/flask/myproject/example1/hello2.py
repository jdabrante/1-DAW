from flask import Flask
from markupsafe import scape

@app.route("/<name>")
def hello(name):
    return f"Hello,{escape(name)}!"

