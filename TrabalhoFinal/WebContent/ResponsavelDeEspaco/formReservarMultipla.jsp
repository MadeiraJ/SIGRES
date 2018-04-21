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
	<span id="resultadoFrm"></span>
	<form action="resManager.jsp" method="POST">
		<h1>Adicionar Reserva</h1>
		<p>Este tipo de reserva irá reservar todas as semanas
		até à data definida no mesmo dia da semana que o dia da reserva defenida
		anteriormente.</p></br>
		<p>Espaco: <%=request.getParameter("_nome") %></p>
		<p>Dia da Reserva: <%=request.getParameter("_dataReserva") %></p>
		<label>Hora Inicio: </label>
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
		<label>Reservar até à data:</label></br>
			<label>Dia</label>
				<input type="number" name="_d" id="_d" min="1" max="31" 
					value="<%=Calendar.getInstance().get(Calendar.DAY_OF_MONTH) %>"/>
			<label>Mes</label>
				<input type="number" name="_m" id="_m" min="1" max="12"
					value="<%=Calendar.getInstance().get(Calendar.ERA) %>"/>
			<label>Ano</label>
				<input type="number" name="_a" id="_a" value="<%=Calendar.getInstance().getWeekYear()%>"
					min="<%=Calendar.getInstance().getWeekYear()%>"/></br>
		<input type="hidden" name="_dataReserva" value="<%=request.getParameter("_dataReserva")%>"/>
		<input type="hidden" name="_id" value="<%=request.getParameter("_id") %>"/>
		<input type="hidden" name="operacao" value="adicionarReservaMultipla"/>
		<input type="submit" value="Adicionar" 
			onmousedown="adicionarReservaMultipla('<%=request.getParameter("_id")%>','<%=request.getParameter("_dataReserva") %>')"/>
	</form>