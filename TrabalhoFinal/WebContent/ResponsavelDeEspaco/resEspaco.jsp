<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../CSS/default.css" media="screen">
    <script type="text/javascript" src="../Javascript/ajax.js"></script>
    <script type="text/javascript" src="../Javascript/respEspaco.js"></script>
    <script type="text/javascript" src="../Javascript/todos.js"></script>
    <script type="text/javascript" src="../Javascript/PR.js"></script> 
    <title>SGRE da ESGTS</title>
</head>
<body id="body">
<div id="contentor">
		<span id="resultadoI"></span>
		<!-- cabecalho -->
		<jsp:include page="../cabecalho.jsp" flush="true"></jsp:include>
        
        <!-- menu -->
        <div id="menu">
            <h1>Menu</h1>
            <ul>
				<li class="gerir"><label>Gerir Espaço</label>
					<div class="sub">
						<ul>
							<li><a id="adicionarEspaco" href="#">Adicionar Espaço</a></li>
							<li><a id="editarEspaco" href="#">Editar Espaço</a></li>
							<li><a id="removerEspaco" href="#">Remover Espaço</a></li>
						</ul>
					</div>
				</li>
				<li class="gerir"><label>Adicionar Reserva</label>
					<div class="sub">
						<ul>
							<li><a id="pesquisaAvancada" href="#">Pesquisa avançada</a></li>
							<li><a id="pesquisaPorEspaco" href="#">Pesquisa por Espaço</a></li>
						</ul>
					</div>
				</li>
                <li><a id="listarReservas" href="#">Listar Reservas</a></li>
				<li><a id="removerReservas" href="#">Remover Reservas</a></li>
				<li><a id="confirmarReservas" href="#">Confirmar Reservas</a></li>
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