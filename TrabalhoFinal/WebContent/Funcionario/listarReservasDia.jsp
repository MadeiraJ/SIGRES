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
	String data = request.getParameter("_dd")+"/"+request.getParameter("_mm")+"/"+request.getParameter("_aa");
	ReservaDAO ud = DAOFactory.createReservaDAO();
	ud.setConnection(con.getConnection());
    List<Reserva> reservas =ud.pesquisarReserva(data,
    		Integer.parseInt(request.getParameter("idEspaco")));
%>
<table>
	<tr>
		<th>Hora Inicio</th>
		<th>Hora Fim</th>
		<th>Uso</th>
		<th>Dono da reserva</th>
	</tr>
	<%
	int i=0;
	for(Reserva r:reservas){
	%>
	<tr>
		<td><%=r.getHoraI()%></td>
		<td><%=r.getHoraF()%></td>
		<td><%=r.getDescricaoUso()%></td>
		<td><%=r.getNomeUtilizador()%></td>
	</tr>
	<%
 		i++;
	}
	%>
	 
</table>
