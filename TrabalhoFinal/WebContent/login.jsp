<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    response.setHeader("cache-control", "no-store" );
    response.setHeader("cache-control", "must-revalidate" );
    response.setHeader("cache-control", "no-cache");
    
    response.setHeader("pragma","no-cache");
    response.setDateHeader("max-age",-1);
    response.setDateHeader("expires",-1);
      
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>SGRE da ESGTS</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <script type="text/javascript" src="Javascript/ajax.js"></script>
    <script type="text/javascript" src="Javascript/login.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/CSSLogin.css" media="screen">
</head>

<body id="body">
	<div id="contentor">
        <div id="cabecalho">
            <img src="Imagens/logo.png">
            <h2>Sistema de Gestão de Espaços da ESGTS</h2>
        </div>
        <form id="login" action="verificaLogin.jsp" method="POST">
        	<%try{
        		if (session.getAttribute("erroLogin").toString()!= ""){%>
        			<div class="alertaErro">
               			<label><%=session.getAttribute("erroLogin").toString()%></label>
            		</div>
            	<%} 	
        	} catch (Exception e){
            	session.setAttribute("erroLogin", "");
            } 
            %>
            <div class="dadosLogin">
                <input type="text" id="_userName" name="_userName" placeholder="Nome de Utilizador"><br>
                <input type="password" id="_password" name="_password" placeholder="Palavra Passe">
            </div>
            <input type="hidden" name="operacao" value="verificarCredenciais">
            <input type="submit" value="Entrar" id="entrar" onmousedown="verificarCredenciais()">
        </form>
        <div class="clearer"><span></span></div>
    </div>
    
	<!-- rodapé -->
	<div id="rodape">
	<h5>Links Uteis</h5>
	<ul class="icons">
		<li><a href="http://si.esgt.ipsantarem.pt/esgt_si/web_page.Inicial"><img src="Imagens/sigarra.png" id="imagem">Sigarra</a></li>
		<li><a href="http://moodle.esgt.ipsantarem.pt/"><img src="Imagens/moodle.png" id="imagem">Moodle</a></li>
		<li><a href="http://eraizes.ipsantarem.pt/moodle/"><img src="Imagens/moodle.png" id="imagem">E-Raizes</a></li>
		<li><a href="https://login.microsoftonline.com/login.srf?wa=wsignin1.0&rpsnv=4&ct=1443867238&rver=6.6.6556.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.office.com%2fowa%2f%3frealm%3desg.ipsantarem.pt%26exch%3d1&id=260563&whr=esg.ipsantarem.pt&CBCXT=out&msafed=0#">
			<img src="Imagens/email.png" id="imagem">E-mail</a></li>
	</ul>
	<p>Copyright 2017 © Instituto Politécnico de Santarém - Escola Superior de Gestão e Tecnologia </p>
</div>
</body>
</html>