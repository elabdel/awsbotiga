# -*- coding: utf-8 -*-
from DadesProductes import DadesProductes
from DadesComandes import DadesComandes	
import random
from pyramid.httpexceptions import HTTPFound
from pyramid.view import (
    view_config,
    forbidden_view_config,
)
from pyramid.security import (
    remember,
    forget,
    authenticated_userid,
)
from .security import comprova_usuari

@view_config(route_name='productes', renderer='productes.mako', permission='view')
def productes_view(request):
   # aqui aniriem als arxius o la base de dades a buscar la informació
   # així ho simulem
   dades = DadesProductes()
   productes = dades.getProductes()
   proj = "Botigueta Pro"
   #prod = [ 'pepino' , 'enciam' , 'plàtan' ]
   #preus = { 'pepino':'2€/kg', 'enciam':'1€/peça', 'plàtan':'2.5€/kg' }
   # els retornarem amb:
   return { "projecte":proj, "productes":productes, 'page':"Productes", 'logged_in':authenticated_userid(request)}
@view_config(route_name='home', renderer='home.mako')
def my_view(request):
    return {'Projecte':'simpleshop', 'page':"home", 'logged_in':authenticated_userid(request) }
@view_config(route_name='realitzarComanda', renderer='realitzarComanda.mako', permission='client')
def comandes_view(request):
	if request.method == 'POST':
		dades = DadesProductes()
		comandes = DadesComandes()
		productes = dades.getProductes()
		IDcomanda = int(comandes.getIDcomanda())+1
		if request.POST.get('1'):
			quantitPepino = int(request.POST.get('1'))
			PreuPepino = float(productes[0]["preu"])*(quantitPepino)
		else:
			quantitPepino = 0
			PreuPepino = 0
		if request.POST.get('2'):
			quantitEnciam = int(request.POST.get('2'))
			PreuEnciam = float(productes[1]["preu"])*(quantitEnciam)
		else:
			quantitEnciam = 0
			PreuEnciam = 0
		if request.POST.get('3'):
			quantitPlatan = int(request.POST.get('3'))
			PreuPlatan = float(productes[2]["preu"])*(quantitPlatan)
		else:
			quantitPlatan = 0
			PreuPlatan = 0
		#IDcomanda = int(IDcomanda)+1
		IDclient = random.randrange(1,100)
		preuTotal = (PreuPepino + PreuEnciam + PreuPlatan)
		comanda = "%s/%s/%s/%s/%s/%s\n" %(IDcomanda,IDclient,quantitPepino,quantitEnciam,quantitPlatan,preuTotal)
		print comanda
		comandes.AfegirComanda(comanda)
		comandes.AfegirIDcomanda(str(IDcomanda))
	return {"id_comanda":IDcomanda, "id_client":IDclient, "pepino":quantitPepino, "enciam":quantitEnciam, "platan":quantitPlatan, "preu":preuTotal, 'page':"Realitzar Comanda", 'logged_in':authenticated_userid(request) }
@view_config(route_name='llistaComandes', renderer='llistaComandes.mako', permission='admin')
def llista_comandes_view(request):
	comandesClass = DadesComandes()
	comandas = comandesClass.getComandes()
	return {"comandas":comandas, 'page':"Llista de Comandes", 'logged_in':authenticated_userid(request) }

# aquest decorator és per establir la ruta per /login
@view_config( route_name='login', renderer='login.mako')
# aquest altre ens redirigirà aquí quan algú intenti entrar en una web que no té permís
@forbidden_view_config(renderer='login.mako')
def login(request):
    login_url = request.route_url('login')
    # detectem des de quina URL ve el visitant
    referrer = request.url
    # retornem l'usuari a la home page si ha vingut directe al login
    if referrer == login_url:
        referrer = '/' # never use the login form itself as came_from
    came_from = request.params.get('came_from', referrer)
    user = authenticated_userid(request)
    if user:
        lloc = came_from.split("/")
        message = "Ets %s, i com a tal no pots entrar a %s" % (user,lloc[len(lloc)-1])
    else:
        message = "Identifica't per entrar al sagrat mon d'Egipte"
    login = ''
    password = ''
    if 'form.submitted' in request.params:
        login = request.params['login']
        password = request.params['password']
        if comprova_usuari(login,password):
            headers = remember(request, login)
            return HTTPFound(location = came_from,
                             headers = headers)
        message = 'Failed login'

    return dict(
        message = message,
        url = request.application_url + '/login',
        came_from = came_from,
        login = login,
        password = password,
        user = authenticated_userid(request), # afegim usuari autenticat si l'hi ha
        )
    

@view_config(route_name='logout')
def logout(request):
    headers = forget(request)
    return HTTPFound(location = request.route_url('home'),
                     headers = headers)
                     

