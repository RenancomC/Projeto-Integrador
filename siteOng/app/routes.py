from app import app
from flask import render_template

@app.route('/')
@app.route('/index')
def index():
  return render_template('index.html')

@app.route('/ajuda')
def ajuda():
  return render_template('ajuda.html')

@app.route('/doacao')
def doacao():
  return render_template('doacao.html')

@app.route('/bazar')
def bazar():
  return render_template('bazar.html')

@app.route('/contato')
def contato():
  return render_template('contato.html')

@app.route('/inst')
def inst():
  return render_template('inst.html')

@app.route('/parceiro')
def parceiro():
  return render_template('parceiro.html')

