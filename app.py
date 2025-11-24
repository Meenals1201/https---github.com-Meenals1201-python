from flask import Flask, render_template, request

app = Flask(__name__)

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

        data = {
          "first_name": name,
          "email": email
        }
        
    return render_template('registered.html', **data)



