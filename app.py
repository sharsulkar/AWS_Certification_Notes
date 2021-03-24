from flask import Flask, request, url_for, redirect, render_template

app = Flask(__name__) #name of the flask application

@app.route('/')
def home(): #home page - static webpage
    return render_template('index.html')

@app.route('/sample_post') 
def take_user_input():
    return render_template('./content/html/sample_post.html')

if __name__ == '__main__':
  #app.run(host='0.0.0.0', port=3245, debug=True)
  app.run()