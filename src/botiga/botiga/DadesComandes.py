#!/usr/bin/python
# -*- coding: utf-8 -*-
class DadesComandes:
	def AfegirComanda(self, comanda):
		import os
		here = os.path.dirname(os.path.abspath(__file__))
		fitxer=open(here+'/comandes.txt','a')
		fitxer.write(comanda)
		fitxer.close()
	def getComandes(self):
		import os
		here = os.path.dirname(os.path.abspath(__file__))
		comandes=[]
		fitxer=open(here+'/comandes.txt','r')
		for linea in fitxer:
			comanda={}
			linea=linea.rstrip()
			IDcomanda,IDclient,quantitPepino,quantitEnciam,quantitPlatan,preuTotal=linea.split("/")
			comanda["IDcomanda"]=IDcomanda
			comanda["IDclient"]=IDclient
			comanda["quantitPepino"]=quantitPepino
			comanda["quantitEnciam"]=quantitEnciam
			comanda["quantitPlatan"]=quantitPlatan
			comanda["preuTotal"]=preuTotal
			comandes.append(comanda)
			print linea.split("/")
		fitxer.close()
		return comandes
	
	def AfegirIDcomanda(self, iddcomanda):
		import os
		here = os.path.dirname(os.path.abspath(__file__))
		fitxer=open(here+'/id-comanda.txt','w')
		fitxer.write(iddcomanda)
		fitxer.close()
	def getIDcomanda(self):
		import os
		here = os.path.dirname(os.path.abspath(__file__))
		fitxer=open(here+'/id-comanda.txt','r')
		iddcomanda = 0
		for linea in fitxer:
			iddcomanda = linea
		print iddcomanda
		fitxer.close()
		return iddcomanda