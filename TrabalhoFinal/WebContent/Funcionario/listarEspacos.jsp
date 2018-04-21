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
    List<Espaco> espacos =ud.pesquisaEspaco(request.getParameter("_edificio"),
    		Integer.parseInt(request.getParameter("_piso")));
%>
<table action="funcManager.jsp">
	<tr>
		<th>Espaço</th>
		<th>Responsavel</th>
		<th>Ver reservas</th>
	</tr>
<%
	int i=0;
	for(Espaco e:espacos){
%>
	<tr>
		<td><%=e.getNomeEspaco()%></td>
		<td><%=e.getNomeResponsavel() %></td>
		<td>
			<input type="hidden" name="operacao" value="escolhaEspaco"/>
			<input type="hidden" name="id" value="<%=e.getEspacoId()%>"/>
			<input type="hidden" name="nome" value="<%=e.getNomeEspaco()%>"/>
			<input type="submit" value="Ver reservas" 
				onmousedown="escolhaEspaco('<%=e.getEspacoId()%>','<%=e.getNomeEspaco()%>')"/>
		</td>
	</tr>
	<%
 	i++;
	 }
	%>
	 
</table>