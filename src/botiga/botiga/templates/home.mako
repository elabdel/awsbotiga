<html>
<head>
<title>Productes</title>
<link rel="stylesheet" href="${request.static_url('botiga:static/style.css')}" type="text/css" media="screen" charset="utf-8" />
</head>
<body>
   <h1>Benvinguts a la nostra botiga SimpleShop</h1>
   <input type="button" class="button" value="Productes" onclick="window.location.href='/productes'"></input>
   <input type="button" class="button" value="Llistat de comandes" onclick="window.location.href='/llistaComandes'"></input>
   <span tal:condition="logged_in"><br><br>
   <a href="${request.application_url}/logout">Tancar sessió</a>
</span>
</body>
</html>  
