<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ocorreu um erro</title>
	<link rel="stylesheet" type="text/css" href="../CSS/default.css" media="screen">
    <script type="text/javascript" src="../Javascript/ajax.js"></script>
    <script type="text/javascript" src="../Javascript/todos.js"></script>
    <script type="text/javascript" src="../Javascript/a.js"></script>
</head>
<body id="body">
	<div id="contentor">
		<!-- cabecalho -->
		<jsp:include page="cabecalho.jsp" flush="true"></jsp:include>

		<!-- menu -->
        <div id="menu">
            <h1>Menu</h1>
        </div>
         
		<!-- conteudo -->
        <div id="conteudos">
			<div class="padded">
				<% String mensagem= exception.getLocalizedMessage();
				mensagem ="Ocorreu um erro";%>
				<h1>Upps!!!</h1>
				<p><%=mensagem %></p>
				<input type="submit" value="Inicio" onmousedown="inicio('inicio')"/>
			</div>
		</div>
		
		<!-- rodape -->
        <jsp:include page="rodape.jsp" flush="true"></jsp:include>

		<div class="clearer"><span></span></div>
    </div>
</body>
</html>