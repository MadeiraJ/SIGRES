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
	UtilizadorDAO ud = DAOFactory.createUtilizadorDAO();
	ud.setConnection(con.getConnection());
    List<Utilizador> utilizadores =ud.listarUtilizadores(request.getParameter("_tipoUser"));
%>
<span id="resultadoOp"></span>
<table action="userManager.jsp">
	<tr>
		<th>Nome de utilizador</th>
		<th>Tipo de Utilizador</th>
		<th>Nome Completo</th>
		<th>Email</th>
		<th>Eliminar Utilizador</th>
	</tr>
<%
	int i=0;
	for(Utilizador u:utilizadores){
%>
	<tr>
		<td><%=u.getNomeutilizador() %></td>
		<td><%=u.getTipoUser()%></td>
		<td><%=u.getNome()%></td>
		<td><%=u.getEmail()%></td>
		<td>
			<input type="hidden" name="operacao" value="eliminarUtilizador"/>
			<input type="hidden" name="id" value="<%=u.getNomeutilizador()%>"/>
			<input type="submit" value="Remover" onmousedown="remover(this.parentNode.parentNode,'<%=u.getNomeutilizador()%>')"/>
		</td>
	</tr>
	<%
 	i++;
	 }
	%>
	 
</table>