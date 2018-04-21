<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="false"%>
<%@ page import="java.sql.*"%>
<%@ page import="grh.espaco.*"%>
<%@ page import="grh.reserva.*"%>
<%@ page import="grh.utilizador.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dataccess.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<jsp:useBean id="con" class="dataccess.ConnectionFactory"/>
	<% 
	String operacao = request.getParameter("operacao");
	
	if(operacao!=null){
		if(operacao.matches("verificarCredenciais")){
			UtilizadorDAO ldao = DAOFactory.createUtilizadorDAO();
			ldao.setConnection(con.getConnection());
			try{
				session.removeAttribute("erroLogin");
				List<Utilizador> utilizadores = ldao.verificarCredencias(
						request.getParameter("_userName"),
						request.getParameter("_password"));
				int i = 0;
				for(Utilizador u:utilizadores){	
					session.setAttribute("userName",request.getParameter("_userName"));
					session.setAttribute("idUtilizador", u.getUtilizadorId());
					session.setAttribute("tipo", u.getTipoUser());
					if (u.getTipoUser().contentEquals("a")){
						response.sendRedirect("Administrador/administrador.jsp");
					} else if (u.getTipoUser().contentEquals("re")){
						response.sendRedirect("ResponsavelDeEspaco/resEspaco.jsp");
					} else if (u.getTipoUser().contentEquals("p")){
						response.sendRedirect("Professor/professor.jsp");
					} else if (u.getTipoUser().contentEquals("f")){
						response.sendRedirect("Funcionario/funcionario.jsp");
					}
					i++;	
				} 
			}catch (Exception e){
				session.setAttribute("erroLogin", "Erro no nome de utilizador ou password!");
				response.sendRedirect("login.jsp");
			}
		}
	}
%>