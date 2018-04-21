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

<%
	EspacoDAO ud = DAOFactory.createEspacoDAO();
	ud.setConnection(con.getConnection());
    Espaco espaco =ud.pesquisaEspaco(Integer.parseInt(request.getParameter("idE")));
%>

<span id="resultadoMe"></span>
<form action="resManager.jsp" method="POST">
		<h1>Editar Espaço</h1>
		<label>Nome de Espaço:</label>
			<input type="text" name="_nomeEspaco" value="<%=espaco.getNomeEspaco()%>"/><br>
		<label>Piso:</label>
			<select name="_piso">
				<option value="0" <%if(espaco.getPiso()==0){%>selected<%}%>>Piso 0</option>
				<option value="1" <%if(espaco.getPiso()==1){%>selected<%}%>>Piso 1</option>
				<option value="2" <%if(espaco.getPiso()==2){%>selected<%}%>>Piso 2</option>
				<option value="3" <%if(espaco.getPiso()==3){%>selected<%}%>>Piso 3</option>
			</select><br>
		<label>Edifício:</label>
			<select name="_edificio">
				<option value="p" <%if(espaco.getEdificio().contains("p")){%>selected<%}%>>Edificio Principal</option>
				<option value="g" <%if(espaco.getEdificio().contains("g")){%>selected<%}%>>Ginasio</option>
				<option value="m" <%if(espaco.getEdificio().contains("m")){%>selected<%}%>>Edificio M</option>
			</select><br>
		<label>Número de Computadores:</label>
			<input type="number" name="_nPc" min="0" value="<%=espaco.getnComputadores()%>"/> <br>
		<label>Projetor:</label>
			<select name="_projetor">
				<option value="s" <%if(espaco.getProjetor().contains("s")){%>selected<%}%>>Sim</option>
				<option value="n" <%if(espaco.getProjetor().contains("n")){%>selected<%}%>>Não</option>
			</select><br>
		<label>Número de lugares:</label>
			<input type="number" name="_nLugares" min="0" value="<%=espaco.getnLugares()%>"/><br>
		<label>Outras Características:</label><br>
			<textarea rows="10" cols="60" name="_outrasCarav"><%=espaco.getOutrasCaracteristicas()%></textarea><br>
			
		<input type="hidden" name="operacao" value="alterarEspaco"/>
		<input type="hidden" name="_id" value="<%=espaco.getEspacoId()%>"/>
		<input type="submit" value="Alterar" onmousedown="alterarE('<%=espaco.getEspacoId()%>')"/>
</form>