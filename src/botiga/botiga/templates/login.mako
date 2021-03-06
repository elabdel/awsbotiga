<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"
      xmlns:tal="http://xml.zope.org/namespaces/tal">
<head>
  <title>Login - Pyramid tutorial</title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <meta name="keywords" content="python web application" />
  <meta name="description" content="pyramid web application" />
  <link rel="shortcut icon"
        href="${request.static_url('botiga:static/favicon.ico')}" />
  <link rel="stylesheet"
        href="${request.static_url('botiga:static/style.css')}"
        type="text/css" media="screen" charset="utf-8" />
  <!--[if lte IE 6]>
  <link rel="stylesheet"
        href="${request.static_url('botiga:static/ie6.css')}"
        type="text/css" media="screen" charset="utf-8" />
  <![endif]-->
</head>
<body>
  <center><div id="wrap">
    <div id="top-small">
      <div class="top-small align-center">
        <div>
          <img width="220" height="50" alt="pyramid"
        src="${request.static_url('botiga:static/logo.png')}" />
        </div>
      </div>
    </div>
    <div id="middle">
      <div class="text">
        <div id="left">
          <b>Login</b> | <a href="${request.route_url('home')}">Anar a la Home Page</a><br/>
          % if message:
            ${message}
          % endif
        </div>
        <div id="right" class="app-welcome align-right"></div>
      </div>
    </div>
    <div id="bottom">
      <div >
        <center><form action="${url}" method="post" >
          <input type="hidden" name="came_from"  value="${came_from}"/>
          <input type="text" name="login" class="taula" value="${login}"/><br/>
          <input type="password" name="password" class="taula"
                 value="${password}"/><br/>
          <input type="submit" class="button" name="form.submitted" value="Accedir"/>
        </form></center>
      </div>
    </div>
  </div>
  <br><br><br>
  <div id="footer">
    <div class="footer">CopyRight Abdel 2013.</div>
  </div>
  </center>
</body>
</html>
