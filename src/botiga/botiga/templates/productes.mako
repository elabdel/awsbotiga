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
      <h1>${projecte}</h1>
	  <form action="realitzarComanda" method="POST">
      <table border="1">
	  <tr><td>ID</td><td>Nom producte</td><td>Stock</td><td>Preu</td><td>Quantitat</td></tr>
      % for prod in productes:
			
		<tr>
         <td >${prod["id"]}</td>
		  <td name='${prod["nom"]}'>${prod["nom"]}</td>
		   <td id=${prod["stock"]}>${prod["stock"]} Kg</td>
		    <td id=${prod["preu"]}>${prod["preu"]} €/Kg</td>
			<td><input type="text" id='${prod["id"]}' name='${prod["id"]}' value=""/></td>
		 
		 <td><input type='button' name="sumar" value='+' onClick='Afegir(${prod["id"]}, ${prod["stock"]})'/></td>
		 
		</tr>
      % endfor
	  <tr>
	  <td><input type='submit' name="enviar" value="Realizar compra"/></td>
	  </tr>
      </table>
	  
	  </form>
   </body>
</html>
