<html>
	<head>
		<title>Llista de comandes</title>
		<link rel="stylesheet" href="${request.static_url('botiga:static/style.css')}" type="text/css" media="screen" charset="utf-8" />
	</head>
   <body>		
		<table border='1' class="taula">
				<tr><td colspan="6"><center><h1>Llistat de comandes</h1></center></td></tr>
				<tr>
					<td class="td"><b>ID Comanda</b></td>
					<td class="td"><b>ID Client</b></td>
					<td class="td"><b>Pepino</b></td>
					<td class="td"><b>Enciam</b></td>
					<td class="td"><b>Platan</b></td>
					<td class="td"><b>Preu Total</b></td>
				</tr>
		% for comanda in comandas:
				<tr>
					<td><b>${comanda["IDcomanda"]}</b></td>
					<td><b>${comanda["IDclient"]}</b></td>
					<td><b>${comanda["quantitPepino"]} Kg</b></td>
					<td><b>${comanda["quantitEnciam"]} Kg</b></td>
					<td><b>${comanda["quantitPlatan"]} Kg</b></td>
					<td><b>${comanda["preuTotal"]} €</b></td>
				</tr>
		% endfor
		</table>
		<br>
		 <input type="button" class="button" value="Inici" onclick="window.location.href='/'"></input>
	</body>
</html>
