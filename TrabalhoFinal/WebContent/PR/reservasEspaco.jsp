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

<form action="prManager.jsp" method="POST">
	<h1>Listar Reservas do Espaco: <%=request.getParameter("nome") %></h1>
	<label>Dia</label>
		<input type="number" id="_dd" min="1" max="31" 
			value="<%=Calendar.getInstance().get(Calendar.DAY_OF_MONTH) %>"/>
	<label>Mes</label>
		<input type="number" id="_mm" min="1" max="12"
			value="<%=Calendar.getInstance().get(Calendar.ERA) %>"/>
	<label>Ano</label>
		<input type="number" id="_aa" value="<%=Calendar.getInstance().getWeekYear()%>"
			min="<%=Calendar.getInstance().getWeekYear()%>"/>
	
	<input type="hidden" name="idEspaco" value="<%=request.getParameter("id") %>">
	<input type="hidden" name="nomeEspaco" value="<%=request.getParameter("nome")%>">
	<input type="hidden" name="operacao" value="listarReservasDoDia">
	<input type="button" value="Pesquisar" 
		onmousedown="listarReservasDoDia('<%=request.getParameter("id") %>',
		'<%=request.getParameter("nome")%>')">
 
</form>
<div id="listagem">
 

</div>