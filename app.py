#!/usr/bin/python


from flask import Flask

app = Flask(__name__)

# def main():
#     pass

@app.route('/')
def serve_home():
    return '<h1>Michael Gallo portfolio</h1>'


# if __name__=="__main__":
#     main()