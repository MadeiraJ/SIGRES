<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../CSS/default.css" media="screen">
    <script type="text/javascript" src="../Javascript/ajax.js"></script>
    <script type="text/javascript" src="../Javascript/administrador.js"></script>
    <script type="text/javascript" src="../Javascript/todos.js"></script>
    
    <title>SGRE da ESGTS</title>
</head>
<body id="body">
	<div id="contentor">
		<!-- cabecalho -->
		<jsp:include page="../cabecalho.jsp" flush="true"></jsp:include>
		
		<!-- menu -->
        <div id="menu">
            <h1>Menu</h1>
            <ul>  
                <li><a id="adicionarUtilizador" href="#">Adicionar Utilizadores</a></li>
                <li><a id="removerUtilizador" href="#">Remover Utilizadores</a></li>
                <li><a id="alterarREspaco" href="#">Alterar Resp. de espaço</a></li>
            </ul>
        </div>
        
        <!-- conteudo -->
        <div id="conteudos">
			<div class="padded">
				<blockquote>
					<h1>Bem Vindo ao Sistema de Gestão de Espaços da ESGTS</h1>
					<p>Este sistema tem como objetivo melhorar a organização da reserva
					de salas para que seja eficiente.</p>
				</blockquote>
			</div>
		</div>
		
        <!-- rodape -->
        <jsp:include page="../rodape.jsp" flush="true"></jsp:include>

		<div class="clearer"><span></span></div>
    </div>
</body>
</html>