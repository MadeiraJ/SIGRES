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
    List<Espaco> espacos =ud.listarEspaco(request.getParameter("_edificio"),
    		Integer.parseInt(request.getParameter("_piso")),
    		Integer.parseInt(session.getAttribute("idUtilizador").toString().toString()));
%>
<span id="resultadoLe"></span>
<table action="resManager.jsp" >
	<tr>
		<th>Nome do Espaco</th>
		<th>Nº Computadores</th>
		<th>Projetor</th>
		<th>Nº Lugares</th>
		<th>Outras Caracteristicas</th>
		<th>Editar Espaço</th>
	</tr>
<%
	int i=0;
	for(Espaco e:espacos){
%>
	<tr>
		<td><%=e.getNomeEspaco()%></td>
		<td><%=e.getnComputadores()%></td>
		<td><%=e.getProjetor()%></td>
		<td><%=e.getnLugares()%></td>
		<td><%=e.getOutrasCaracteristicas()%></td>
		<td>
			<input type="hidden" name="operacao" value="formAlterarEspaco"/>
			<input type="hidden" name="idE" value="<%=e.getEspacoId()%>"/>
			<input type="submit" value="Editar" 
				onmousedown="fromAlterarE(this.parentNode.parentNode,'<%=e.getEspacoId()%>')"/>
		</td>
	</tr>
	<%
 	i++;
	 }
	%>
	 
</table>