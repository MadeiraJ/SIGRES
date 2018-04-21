<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="grh.espaco.*"%>
<%@ page import="grh.reserva.*"%>
<%@ page import="grh.utilizador.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dataccess.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<jsp:useBean id="con" class="dataccess.ConnectionFactory" scope="session"/>
	<span id="resultadoAu"></span>
	<form action="userManager.jsp" method="POST" id="adu">
		<h1>Adicionar utilizador</h1>
		<label>Nome de Utilizador:</label>
			<input type="text" name="_user"><br>
		<label>Password:</label>
			<input type="password" name="_pass1"><br>
		<label>Confirmar Password:</label>
			<input type="password" name="_pass2"><br>
		<label>Nome Completo:</label>
			<input type="text" name="_nome"><br>
		<label>E-mail:</label>
			<input type="email" name="_email"><br>
		<label>Tipo de utilizador</label>
			<select name="_tipoUser">
				<option value="re">Responsavel de espaço</option>
				<option value="p">Professor</option>
				<option value="f">Funcionario</option>
			</select> 
		<input type="hidden" name="operacao" value="adicionarUtilizador"/>
		<input type="submit" value="Criar" onmousedown="adicionarU()"/>
	</form>