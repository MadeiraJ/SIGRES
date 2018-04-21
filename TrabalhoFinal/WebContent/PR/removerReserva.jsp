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
	ReservaDAO ud = DAOFactory.createReservaDAO();
	ud.setConnection(con.getConnection());
	List <Reserva> reservas= ud.listarTodasReservas("t",
			Integer.parseInt(session.getAttribute("idUtilizador").toString()));
%>
<span id="resultadoRr"></span>
<h1>Remover de Reservas</h1>
<table action="prManager.jsp">
	<tr>
		<th>Nome de Espaço</th>
		<th>Data de Reserva</th>
		<th>Hora de Início</th>
		<th>Hora de Fim</th>
		<th>Estado</th>
		<th>Descrição do Uso</th>
		<th>Remover Reserva</th>
	</tr>
<%
	int i=0;
	for(Reserva r:reservas){
%>
	<tr>
		<td><%=r.getNomeEspaco()%></td>
		<td><%=r.getDataReserva()%></td>
		<td><%=r.getHoraI()%></td>
		<td><%=r.getHoraF()%></td>
		<td><%=r.getEstado()%></td>
		<td><%=r.getDescricaoUso()%></td>
		<td>
			<input type="hidden" name="operacao" value="removerReserva"/>
			<input type="hidden" name="idR" value="<%=r.getReservaId()%>"/>
			<input type="submit" value="Remover" 
				onmousedown="removerReserva(this.parentNode.parentNode,'<%=r.getReservaId()%>')"/>
		</td>
	</tr>
	<%
 		i++;
	}
	%>
	 
</table>