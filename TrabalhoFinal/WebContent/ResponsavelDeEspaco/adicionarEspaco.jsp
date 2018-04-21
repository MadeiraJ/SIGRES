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

<span id="resultadoAp"></span>
<form action="resManager.jsp" method="POST">
		<h1>Adicionar Espaço</h1>
		<label>Nome de Espaço:</label>
			<input type="text" name="_nomeEspaco"/><br>
		<label>Piso:</label>
			<select name="_piso">
				<option value="0">Piso 0</option>
				<option value="1">Piso 1</option>
				<option value="2">Piso 2</option>
				<option value="3">Piso 3</option>
			</select><br>
		<label>Edifício:</label>
			<select name="_edificio">
				<option value="p">Edificio Principal</option>
				<option value="g">Ginasio</option>
				<option value="m">Edificio M</option>
			</select><br>
		<label>Número de Computadores:</label>
			<input type="number" name="_nPc" min="0" value="0"/> <br>
		<label>Projetor:</label>
			<select name="_projetor">
				<option value="s">Sim</option>
				<option value="n">Não</option>
			</select><br>
		<label>Número de lugares:</label>
			<input type="number" name="_nLugares" min="0" value="10"/><br>
		<label>Outras Características:</label><br>
			<textarea rows="10" cols="60" name="_outrasCarav"></textarea><br>
			
		<input type="hidden" name="operacao" value="inserirEspaco"/>
		<input type="submit" value="Criar" onmousedown="adicionarE()"/>
</form>	