<html>
<head>
<title>Prpductes</title>
<link rel="stylesheet" href="${request.static_url('botiga:static/style.css')}" type="text/css" media="screen" charset="utf-8" />
</head>
   <body>
   <script type="text/javascript">
    Llista = new Array();
   function Comandes(id, nom, preu){
		this.id=id;
		this.nom=nom;
		this.preu=preu;
		this.afegirProducte=afegirProducte;
   }
   function afegirProducte(){
	var id = document.getElementById("id").value;
	var nom = document.getElementById("nom").value;
	//var stock = document.getElementById("stock").value;
	var preu = document.getElementById("preu").value;
	comandes= new Comandes(id, nom, preu);
	Llista[Llista.length] = comandes;
	Mostrar();
	}
	function Mostrar(){
	document.getElementById("llista").innerHTML = "";
		document.getElementById("llista").innerHTML += "<h1>LLista de les comandes</h1>";
		for(var i=0; i<Llista.length;i++){
			document.getElementById("llista").innerHTML += "ID: "+Llista[i].id+"<br/>";
			document.getElementById("llista").innerHTML += "Nom: "+Llista[i].nom+"<br/>";
			document.getElementById("llista").innerHTML += "Preu: "+Llista[i].preu+"<br/>";

    }
	}
   </script>
      <h1>${projecte}</h1>
      <table border="1">
	  <tr><td>ID</td><td>Nom producte</td><td>Stock</td><td>Preu</td></tr>
      % for prod in productes:
			$id = ${prod["id"]}
		<tr>
         <td><input type='text' id='id' value=></td>
		  <td><input type='text' id='nom' value=${prod["nom"]}></td>
		   <td><input type='text' id='stock' value=${prod["stock"]}></td>
		    <td><input type='text' id='preu' value=${prod["preu"]}></td>
		 <!--<td id='nom'>${prod["nom"]}</td>
		 <td id='stock'>${prod["stock"]}</td>
		 <td id='preu'>${prod["preu"]} €/Kg</td>!-->
		 <td><input type='button' name=${prod["id"]} id=${prod["id"]} value='+' onClick='afegirProducte();'/></td>
		</tr>
      % endfor
	  
      </table>
	  <div id="llista"></div>
   </body>
</html>
