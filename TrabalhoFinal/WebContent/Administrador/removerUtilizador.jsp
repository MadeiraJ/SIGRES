<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="grh.utilizador.*"%>
<%@ page import="grh.reserva.*"%>
<%@ page import="grh.espaco.*"%>
<%@ page import="dataccess.*"%>
<%@ page import="java.util.*"%> 

<jsp:useBean id="con" class="dataccess.ConnectionFactory" /> 
 
<h1>Remover de Utilizadores</h1>
<form action="userManager.jsp" method="POST">
	<label>Tipo de utilizador</label>
		<select name="_tipoUser" id="_tipoUser">
			<option value="t">Todos</option>
			<option value="re">Responsável de espaço</option>
			<option value="p">Professor</option>
			<option value="f">Funcionario</option>
		</select>
	<input type="hidden" name="operacao" value="listarUtilizadores">
	<input type="button" value="Pesquisar" onclick="listarF()">
 
</form>
<div id="listagem">
 

</div>

 