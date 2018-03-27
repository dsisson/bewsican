from flask import Flask
import os
from beswican.api.phraser import api_blueprint
from beswican.web.web import website_bp

# configure flask app
app = Flask(__name__)
app.register_blueprint(website_bp, url_prefix='/')
app.register_blueprint(api_blueprint, url_prefix='/api')


if __name__ == '__main__':
    #app.run(host='0.0.0.0', port=5001, debug=True)
    app.run(host='0.0.0.0', port=int(os.getenv('PORT', 5000)))