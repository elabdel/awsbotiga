# -*- coding: utf-8 -*-
from pyramid.view import view_config
from DadesProductes import DadesProductes	
    
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
