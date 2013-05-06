#!/usr/bin/python
# -*- coding: utf-8 -*-
class DadesProductes:
	def getProductes(self):
		import os
		here = os.path.dirname(os.path.abspath(__file__))
		productes=[]
		fitxer=open(here+'/productes.txt','r')
		for linea in fitxer:
			producte={}
			linea=linea.rstrip()
			id,nom,stock,preu=linea.split("/")
			producte["id"]=id
			producte["nom"]=nom
			producte["stock"]=stock
			producte["preu"]=preu
			productes.append(producte)
			#print linea.split("/")
		fitxer.close()
		return productes
		
