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
<form action="resManager.jsp" method="POST">
	<h1>Editar de espaço</h1>
		<label>Edifício:</label>
		<select name="_edificio" id="_edificio">
			<option value="p">Edificio Principal</option>
			<option value="g">Ginasio</option>
			<option value="m">Edificio M</option>
		</select>
		<label>Piso:</label>
		<select name="_piso" id="_piso">
			<option value="0">Piso 0</option>
			<option value="1">Piso 1</option>
			<option value="2">Piso 2</option>
			<option value="3">Piso 3</option>
		</select>
	<input type="hidden" name="operacao" value="listarEspacos">
	<input type="button" value="Pesquisar" onmousedown="listarEspacos('e')">
 
</form>
<div id="listagem">
 

</div>