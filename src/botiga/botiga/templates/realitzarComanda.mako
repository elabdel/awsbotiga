<html>
	<head>
		<title>La teva compra</title>
		<link rel="stylesheet" href="${request.static_url('botiga:static/style.css')}" type="text/css" media="screen" charset="utf-8" />
	</head>
   <body>
		
		
		<table border='1' class="taula">
				<tr><td colspan="6"><center><h1>La teva compra</h1></center></td></tr>
				<tr>
					<td class="button"><b>ID Comanda</b></td>
					<td class="button"><b>ID Client</b></td>
					<td class="button"><b>Pepino</b></td>
					<td class="button"><b>Enciam</b></td>
					<td class="button"><b>Platan</b></td>
					<td class="button"><b>Preu Total</b></td>
				</tr>
				
				<tr>
					<td><b>${id_comanda}</b></td>
					<td><b>${id_client}</b></td>
					<td><b>${pepino} Kg</b></td>
					<td><b>${enciam} Kg</b></td>
					<td><b>${platan} Kg</b></td>
					<td><b>${preu} €</b></td>
				</tr>
		</table>
		<br>
		<input type="button" class="button" value="Inici" onclick="window.location.href='/'"></input>
	</body>
</html>
