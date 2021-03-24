from flask import Flask, request, url_for, redirect, render_template
from flask_frozen import Freezer

app = Flask(__name__) #name of the flask application

freezer = Freezer(app)

@app.route('/')
def home(): 
    return render_template('base.html')

@app.route('/sample_post.html')
def sample_post(): 
    return render_template('sample_post.html')


if __name__ == '__main__':
  #app.run(host='0.0.0.0', port=3245, debug=True)
  #app.run(debug=True)
  freezer.freeze()