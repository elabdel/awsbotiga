# -*- coding: utf-8 -*-
from pyramid.view import view_config
from DadesProductes import DadesProductes
from DadesComandes import DadesComandes	
import random
@view_config(route_name='productes', renderer='productes.mako')
def productes_view(request):
   # aqui aniriem als arxius o la base de dades a buscar la informació
   # així ho simulem
   dades = DadesProductes()
   productes = dades.getProductes()
   proj = "Botigueta Pro"
   #prod = [ 'pepino' , 'enciam' , 'plàtan' ]
   #preus = { 'pepino':'2€/kg', 'enciam':'1€/peça', 'plàtan':'2.5€/kg' }
   # els retornarem amb:
   return { "projecte":proj, "productes":productes}
@view_config(route_name='home', renderer='home.mako')
def my_view(request):
    return {'Projecte':'simpleshop'}
@view_config(route_name='realitzarComanda', renderer='realitzarComanda.mako')
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
	return {"id_comanda":IDcomanda, "id_client":IDclient, "pepino":quantitPepino, "enciam":quantitEnciam, "platan":quantitPlatan, "preu":preuTotal}
@view_config(route_name='llistaComandes', renderer='llistaComandes.mako')
def llista_comandes_view(request):
	comandesClass = DadesComandes()
	comandas = comandesClass.getComandes()
	return {"comandas":comandas}
	
