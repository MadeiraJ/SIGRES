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
	/*String data = request.getParameter("_dd")+"/"+request.getParameter("_mm")+"/"+request.getParameter("_aa");
	String horaI = request.getParameter("_horaI")+":"+request.getParameter("_minI");
	String horaF = request.getParameter("_horaF")+":"+request.getParameter("_minF");*/
	ReservaDAO ud = DAOFactory.createReservaDAO();
	ud.setConnection(con.getConnection());
    List<Reserva> reservas=ud.listarEspacosDisponiveis(Integer.parseInt(request.getParameter("_piso")),
    		request.getParameter("_edificio"),Integer.parseInt(request.getParameter("_nPc")),
    		request.getParameter("_projetor"),Integer.parseInt(request.getParameter("_nLugares")));
%>
<h1>Pesquisar Espaco a Reservar</h1>
<table action="prManager.jsp">
	<tr>
		<th>Nome do Espaco</th>
		<th>Outras Caracteristicas</th>
		<th>Responsavel</th>
		<th>Reservar Espaco</th>
	</tr>
<%
	int i=0;
	for(Reserva r:reservas){
%>
	<tr>
		<td><%=r.getNomeEspaco()%></td>
		<td><%=r.getDescricaoEspaco()%></td>
		<td><%=r.getNomeResponsavel()%></td>
		<td>
			<input type="hidden" name="operacao" value="escolhaEspaco"/>
			<input type="hidden" name="id" value="<%=r.getIdEspaco()%>"/>
			<input type="hidden" name="nome" value="<%=r.getNomeEspaco()%>"/>
			<input type="submit" value="Ver reservas" 
				onmousedown="escolhaEspaco('<%=r.getIdEspaco()%>','<%=r.getNomeEspaco()%>')"/>
		</td>
	</tr>
	<%
 		i++;
	}
	%>
	 
</table>