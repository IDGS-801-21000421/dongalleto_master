from flask import Flask, render_template

app = Flask(__name__)

# Ruta para mostrar el 404.html
@app.route('/404')
def default():
    return render_template('404.html')

# Ruta para mostrar el index.html
@app.route('/')
def index():
    return render_template('index.html')

# Ruta para mostrar el login.html
@app.route('/login')
def login():
    return render_template('login.html')

# Ruta para mostrar el register.html
@app.route('/register')
def register():
    return render_template('register.html')

# Ruta para mostrar el forgot-password.html
@app.route('/reset-password')
def forgotpassword():
    return render_template('forgot-password.html')


if __name__ == '__main__':
    app.run(debug=True)
