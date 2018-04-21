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

<span id="resultadoPa"></span>
<form action="prManager.jsp" method="POST">
	<h1>Pesquisar Espaco a Reservar</h1>
	<label>Edifício:</label>
		<select id="_edificio" name="_edificio">
			<option value="p">Edificio Principal</option>
			<option value="g">Ginasio</option>
			<option value="m">Edificio M</option>
		</select><br>
	<label>Piso:</label>
		<select id="_piso" name="_piso">
			<option value="0">Piso 0</option>
			<option value="1">Piso 1</option>
			<option value="2">Piso 2</option>
			<option value="3">Piso 3</option>
		</select><br>
	<label>Número de Computadores:</label>
		<input type="number" id="_nPc" name="_nPc" min="0" value="0"><br>
	<label>Projetor:</label>
		<select id="_projetor" name="_projetor">
			<option value="s">Sim</option>
			<option value="n">Não</option>
		</select><br>
	<label>Número de lugares:</label>
		<input type="number" id="_nLugares" name="_nLugares" min="0" value="10"><br>
	<!--<label>Dia da reserva:</label></br>
		<label>Dia</label>
			<input type="number" id="_dd" name="_dd" min="1" max="31" 
				value="</%=Calendar.getInstance().get(Calendar.DAY_OF_MONTH) %>"/>
		<label>Mês</label>
			<input type="number" id="_mm" name="_mm" min="1" max="12"
				value="</%=Calendar.getInstance().get(Calendar.ERA) %>"/>
		<label>Ano</label>
			<input type="number" id="_aa" name="_aa" value="</%=Calendar.getInstance().getWeekYear()%>"
				min="</%=Calendar.getInstance().getWeekYear()%>"/></br>
	<label>Hora Inicio:</label>
		<select name="_horaI" id="_horaI">
			</%for(int i=8;i<24;i++){ %>
				<option value="</%=i%>"></%=i%></option>
			</%} %>
		</select>
		<select name="_minI" id="_minI">
			<option value="00">00</option>
			<option value="30">30</option>
		</select></br>
	<label>Hora Fim:</label>
		<select name="_horaF" id="_horaF">
			</%for(int i=8;i<24;i++){ %>
				<option value="</%=i%>"></%=i%></option>
			</%} %>
		</select>
		<select name="_minF" id="_minF">
			<option value="50">50</option>
			<option value="20">20</option>
		</select></br>-->
	<input type="hidden" name="operacao" value="listarEspacosParametros">
	<input type="button" value="Pesquisar" onclick="listarEspacosParametros()">
</form>
<div id="listagem">
 

</div>