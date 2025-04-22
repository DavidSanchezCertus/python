from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return "¡Hola, mundo desde AWS EC2!"

if __name__ == '__main__':
    # 0.0.0.0 permite acceder desde cualquier IP
    # puerto 8080 es común para aplicaciones web
    app.run(host='0.0.0.0', port=8080)
