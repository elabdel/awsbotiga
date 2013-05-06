<html>
<head>
<title>Productes</title>
<link rel="stylesheet" href="${request.static_url('botiga:static/style.css')}" type="text/css" media="screen" charset="utf-8" />
</head>
   <body>
   <script type="text/javascript">
	function Afegir(id, stock){
	var iid = document.getElementById(id).value;
	var stockk = document.getElementById(stock).innerHTML;
		stockk = Number(stockk);
		iid = Number(iid);
		if(iid < stock){
		iid=eval(iid+1);
		document.getElementById(id).value = iid;
		}
		}
   </script>
	  <form action="realitzarComanda" method="POST">
      <table border="0" class="taula">
	  <tr><td colspan="6"><center><h1>${projecte}</h1></center></td></tr>
	  <tr><td class="td">ID</td><td class="td">Nom producte</td><td class="td">Stock</td><td class="td">Preu</td><td class="td">Quantitat</td></tr>
      % for prod in productes:
			
		<tr>
         <td class="taula">${prod["id"]}</td>
		  <td name='${prod["nom"]}' class="taula">${prod["nom"]}</td>
		   <td id=${prod["stock"]} class="taula" >${prod["stock"]} Kg</td>
		    <td id=${prod["preu"]} class="taula" >${prod["preu"]} €/Kg</td>
			<td><input type="text" class="taula" id='${prod["id"]}' name='${prod["id"]}' value="" readonly /></td>
		 
		 <td><input type='button' class="button" name="sumar" value='+' onClick='Afegir(${prod["id"]}, ${prod["stock"]})'/></td>
		 
		</tr>
      % endfor
	  <tr>
	  <td><input type='submit' name="enviar" value="Realizar compra" class="button"/></td>
	  </tr>
      </table>
	  <input type="button" class="button" value="Inici" onclick="window.location.href='/'"></input>
	  </form>
   </body>
</html>
