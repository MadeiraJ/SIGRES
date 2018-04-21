<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    response.setHeader("cache-control", "no-store" );
    response.setHeader("cache-control", "must-revalidate" );
    response.setHeader("cache-control", "no-cache");
    
    response.setHeader("pragma","no-cache");
    response.setDateHeader("max-age",-1);
    response.setDateHeader("expires",-1);
     if(session.getAttribute("userName")==null) 
    	out.print("<script>window.location.replace('../login.jsp')</script>");
    %>
    
<span id="resultadoI"></span>
<div id="cabecalho">
	<a id="inicial" href=""><img src="../Imagens/logo.png"></a>
		<input type="hidden" name="operacao" value="inicial">
    <div id="credencias">
	    <p class="sairI"><a id="paginaLogin" href="#">LogOut</a></p>
	    <p class="identidade">Utilizador:<a id="alterarU" href="#"><%= session.getAttribute("userName")%></a></p>
    </div>
    	
    <h1>Sistema de Gestão de Espaços da ESGTS</h1>	
</div>