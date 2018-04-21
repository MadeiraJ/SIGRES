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
<h1>Listar reservas</h1>
<form action="prManager.jsp" method="POST">
	<label>Estado</label>
		<select name="_estado" id="_estado">
			<option value="t">Todas</option>
			<option value="a">Aceites</option>
			<option value="p">Pendentes</option>
		</select>
	<input type="hidden" name="operacao" value="listarReservasU">
	<input type="button" value="Pesquisar" onmousedown="listarReservasU()">
 
</form>
<div id="listagem">
 

</div>
 