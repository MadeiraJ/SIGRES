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
<h1>Pesquisa por espaço</h1>
<form action="prManager.jsp" method="POST">
	<label>Edificio</label>
		<select name="_edificio" id="_edificio">
			<option value="p">Edificio Principal</option>
			<option value="g">Ginasio</option>
			<option value="m">Edificio M</option>
		</select>
	<label>Piso</label>
		<select name="_piso" id="_piso">
			<option value="0">piso 0</option>
			<option value="1">piso 1</option>
			<option value="2">piso 2</option>
			<option value="3">piso 3</option>
		</select>
	<input type="hidden" name="operacao" value="listarEspacosReservar">
	<input type="button" value="Pesquisar" onmousedown="listarEspacosReservar()">
 
</form>
<div id="listagem">
 

</div>