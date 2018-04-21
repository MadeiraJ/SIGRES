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
	<span id="resultadoAp"></span>
	<form action="../todos.jsp" method="POST">
		<h1>Alterar Palavra Passe</h1>
		<label>Password antiga:</label><input type="password" name="_passA"><br>
		<label>Nova Password:</label><input type="password" name="_pass1"><br>
		<label>Confirmar Password:</label><input type="password" name="_pass2"><br>
		<input type="hidden" name="operacao" value="alterarPasse"/>
		<input type="submit" value="Alterar" onmousedown="alterarPasse()"/>
	</form>