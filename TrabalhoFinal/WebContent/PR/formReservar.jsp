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
	<span id="resultadoFr"></span>
	<form action="../PR/prManager.jsp" method="POST">
		<h1>Adicionar Reserva</h1>
		<p>Espaco: <%=request.getParameter("_nome") %></p>
		<p>Dia da Reserva: <%=request.getParameter("_dataReserva") %></p>
		<label>Hora Inicio:</label>
			<select name="_horaI" id="_horaI">
				<%for(int i=8;i<24;i++){ %>
					<option value="<%=i%>"><%=i%></option>
				<%} %>
			</select>
			<select name="_minI" id="_minI">
				<option value="00">00</option>
				<option value="30">30</option>
			</select></br>
		<label>Hora Fim:</label>
			<select name="_horaF" id="_horaF">
				<%for(int i=8;i<24;i++){ %>
					<option value="<%=i%>"><%=i%></option>
				<%} %>
			</select>
			<select name="_minF" id="_minF">
				<option value="50">50</option>
				<option value="20">20</option>
			</select></br>
		<label>Descrição do uso:</label><br>
			<textarea rows="10" cols="60" name="_desUso" id="_desUso">Aula</textarea><br>
		<input type="hidden" name="_dataReserva" value="<%=request.getParameter("_dataReserva")%>"/>
		<input type="hidden" name="_id" value="<%=request.getParameter("_id") %>"/>
		<input type="hidden" name="operacao" value="adicionarReserva"/>
		<input type="submit" value="Adicionar" 
			onmousedown="adicionarReserva('<%=request.getParameter("_id")%>','<%=request.getParameter("_dataReserva") %>')"/>
	</form>