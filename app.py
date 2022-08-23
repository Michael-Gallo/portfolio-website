#!/usr/bin/python


from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def serve_home():
    return render_template("index.html")
