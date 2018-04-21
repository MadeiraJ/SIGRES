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
	List <Reserva> reservas= ud.listarTodasReservasPendentes(
			Integer.parseInt(session.getAttribute("idUtilizador").toString()));
%>
<span id="resultadoCr"></span>
<h1>Confirmar Reservas</h1>
<table action="resManager.jsp">
	<tr>
		<th>Nome de Espaço</th>
		<th>Data de Reserva</th>
		<th>Hora de Início</th>
		<th>Hora de Fim</th>
		<th>Descrição do Uso</th>
		<th>Dono da Reserva</th>
		<th>Confirmar Reserva</th>
		<th>Recusar Reserva</th>
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
		<td><%=r.getDescricaoUso()%></td>
		<td><%=r.getNomeUtilizador()%></td>
		<td>
			<input type="hidden" name="operacao" value="aceitarReserva"/>
			<input type="hidden" name="idR" value="<%=r.getReservaId()%>"/>
			<input type="submit" value="Confirmar" 
				onmousedown="aceitarReserva(this.parentNode.parentNode,'<%=r.getReservaId()%>')"/>
		</td>
		<td>
			<input type="hidden" name="operacao" value="recusarReserva"/>
			<input type="hidden" name="idR" value="<%=r.getReservaId()%>"/>
			<input type="submit" value="Remover" 
				onmousedown="recusarReserva(this.parentNode.parentNode,'<%=r.getReservaId()%>')"/>
		</td>
	</tr>
	<%
 		i++;
	}
	%>
	 
</table>
