<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
	<%@ page import="grh.espaco.*"%>
	<%@ page import="grh.reserva.*"%>
	<%@ page import="grh.utilizador.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="dataccess.*"%>
	<%@ page import="oracle.jdbc.OracleTypes"%>
	<jsp:useBean id="con" class="dataccess.ConnectionFactory"/>
	
	<%
	UtilizadorDAO ud = DAOFactory.createUtilizadorDAO();
	ud.setConnection(con.getConnection());
    List<Utilizador> utilizadores =ud.listarTodosResponsaveis(request.getParameter("_antigoR"));	
	%>
<span id="resultadoEr"></span>
<table action="userManager.jsp">
	<h1>Alterar Responsavel de Espaço</h1>
	<tr>
		<th>Nome de utilizador</th>
		<th>Nome Completo</th>
		<th>Email</th>
		<th>Nº Espaços Responsavel</th>
		<th>Escolher</th>
	</tr>
<%
	int i=0;
	for(Utilizador u:utilizadores){
%>
	<tr>
		<td><%=u.getNomeutilizador()%></td>
		<td><%=u.getNome()%></td>
		<td><%=u.getEmail()%></td>
		<td><%=u.getnEspacos()%></td>
		<td>
			<input type="hidden" name="operacao" value="alterarResponsavel"/>
			<input type="hidden" name="_novoR" value="<%=u.getNomeutilizador()%>"/>
			<input type="hidden" name="_antigoR" value="<%=request.getParameter("_antigoR")%>"/>
			<input type="submit" value="Escolher" 
				onmousedown="alterarResponsavel(this.parentNode.parentNode,
				'<%=u.getNomeutilizador()%>','<%=request.getParameter("_antigoR")%>')"/>
		</td>
	</tr>
	<%
 		i++;
	}
	%>
	 
</table>