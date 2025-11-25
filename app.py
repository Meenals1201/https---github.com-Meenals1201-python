from flask import Flask, render_template, request, session, redirect, url_for
from dotenv import load_dotenv
import os
import mysql.connector

app = Flask(__name__)
app.secret_key = os.getenv('SECRET_KEY')

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


@app.route("/like", methods=['POST'])
def like_article():
    if 'user_id' in session:
        user_id = session['user_id']
        article_id = request.form.get('article_id')
        
        
        cursor.execute('''SELECT * FROM likes WHERE user_id = %s AND article_id = %s''', 
                      (user_id, article_id))
        existing_like = cursor.fetchone()
        if not existing_like:
       
            cursor.execute('''INSERT INTO likes (user_id, article_id) 
                           VALUES (%s, %s)''', 
                          (user_id, article_id))
            conn.commit()
        
   
        return redirect('/member-page')
    else:
        return redirect('/login')



@app.route("/add-articles")
def add_article():
    if 'user_id' in session and session['user_role'] == 'admin':
        return render_template('add-articles.html')
    else:
        return "Access denied. Admins only."


@app.route("/add-articles", methods=['POST'])
def add_article_process():
    if 'user_id' in session and session['user_role'] == 'admin':

        title = request.form.get('title')
        content = request.form.get('content')
        
        if request.form.get('is_featured'):
            is_featured = "yes"
        else:
            is_featured = "no"

        author_id = session['user_id']
        
        cursor.execute('''INSERT INTO articles (title, content, is_featured, author_id) 
               VALUES (%s, %s, %s, %s)''', 
               (title, content, is_featured, author_id))
        conn.commit()
        
        return "Article added successfully! <a href='/admin-page'>Back to Dashboard</a>"
    else:
        return "Access denied. Admins only."
    
    
@app.route("/admin-contacts")
def admin_contacts():
    if 'user_id' in session and session['user_role'] == 'admin':
        cursor.execute('''SELECT * FROM contactstable''')
        contacts = cursor.fetchall()
        return render_template('admin-contacts.html', contacts=contacts)
    else:
        return "Access denied. Admins only."
    
@app.route("/member-page")
def member_page():
    if 'user_id' in session and session['user_role'] == 'member':
        name = session['user_name']

        cursor.execute('''SELECT * FROM articles''')
        articles = cursor.fetchall()

        like_counts = {}
        for article in articles:
            article_id = article[0]
            cursor.execute('''SELECT COUNT(*) FROM likes WHERE article_id = %s''', (article_id,))
            like_count = cursor.fetchone()[0]
            like_counts[article_id] = like_count

        return render_template('member-page.html', name=name, articles=articles, like_counts=like_counts)
    else:
        return redirect('/login')

@app.route("/admin-page")
def admin_page():
    if 'user_id' in session and session['user_role'] == 'admin':
        name = session['user_name']

        cursor.execute('''SELECT * FROM articles''')
        articles = cursor.fetchall()

        return render_template('admin-page.html', name=name, articles=articles)
    else:
        return "This page can only be accessed by admins."


@app.route("/dashboard")
def dashboard():

    if 'user_id' in session:
        name = session['user_name']
        role = session['user_role']
        return f"Welcome to Dashboard, {name}! (Role: {role})<br><a href='/logout'>Logout</a>"
    else:
        return redirect('/login')

@app.route("/logout")
def logout():
    session.clear()
    return redirect('/homepage')

@app.route("/login")
def login():
    return render_template('login.html')

@app.route("/login", methods=['POST'])
def login_process():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')

        cursor.execute('''SELECT * FROM userstable WHERE email = %s AND password = %s''', (email, password))
                     
        user = cursor.fetchone()
        if user:

            user_id, name, user_email, user_password, role, created_date = user 
            session['user_id'] = user_id
            session['user_name'] = name
            session['user_role'] = role
            
            if role == 'admin':
                return redirect('/admin-page')
            else:
                return redirect('/member-page')
            
        else:
            return "Invalid email or password. <a href='/login'>Try again</a>"

@app.route("/")
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
               VALUES (%s, %s, %s, %s)''', (name, email, password, 'member'))
               
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
                       VALUES (%s, %s, %s)''', (name, email, message))
                       
        conn.commit()

        data = {
          "first_name": name,
          "email": email,
          "message": message
        }

    return render_template('contacted.html', **data)



