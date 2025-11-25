from flask import Flask, render_template, request
from dotenv import load_dotenv
import os
import mysql.connector

app = Flask(__name__)

app.config['MYSQL_HOST'] = os.getenv('MYSQL_HOST')
app.config['MYSQL_USER'] = os.getenv('MYSQL_USER')
app.config['MYSQL_PASSWORD'] = os.getenv('MYSQL_PASSWORD')
app.config['MYSQL_DB'] = os.getenv('MYSQL_DB')

conn = mysql.connector.connect(
host=app.config['MYSQL_HOST'],
user=app.config['MYSQL_USER'],
password=app.config['MYSQL_PASSWORD'],
database=app.config['MYSQL_DB']
)


cursor = conn.cursor()

@app.route("/login")
def login():
    return render_template('login.html')

@app.route("/homepage")
def homepage():
    return render_template('homepage.html')

@app.route("/register")
def register():
    return render_template('register.html')

@app.route("/registered", methods=['POST'])
def registered():
    if request.method == 'POST':

        name = request.form.get('name')
        email = request.form.get('email')
        password = request.form.get('password')

        cursor.execute('''INSERT INTO userstable (name, email, password, role) 
               VALUES (%s, %s, %s, %s)''', 
               (name, email, password, 'member'))
        conn.commit()

        data = {
          "first_name": name,
          "email": email
        }

    return render_template('registered.html', **data)

@app.route("/contact")
def contact():
    return render_template('contact.html')

@app.route("/submit", methods=['POST'])
def message():
    if request.method == 'POST':

        name = request.form.get('name')
        email = request.form.get('email')
        message = request.form.get('text')

        cursor.execute('''INSERT INTO contactstable (name, email, message) 
                       VALUES (%s, %s, %s)''', 
                       (name, email, message))
        conn.commit()

        data = {
          "first_name": name,
          "email": email,
          "message": message
        }

    return render_template('contacted.html', **data)



