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
	String operacao = request.getParameter("operacao");
	
	if(operacao.matches("paginaLogin")){
		session.removeAttribute("userName");
		session.removeAttribute("idUtilizador");
		session.removeAttribute("tipo");
		session.invalidate();
		response.setContentType("text/text");
		out.print("logout_ok");
	}
	
	if(operacao.matches("alterarPasse")){
		UtilizadorDAO ldao = DAOFactory.createUtilizadorDAO();
		ldao.setConnection(con.getConnection());
		
  		if (request.getParameter("_pass1").contains(request.getParameter("_pass2"))){
			int res = ldao.modificarPass(Integer.parseInt(session.getAttribute("idUtilizador").toString()),
					request.getParameter("_passA"),
					request.getParameter("_pass1"));
			
			String tipo = session.getAttribute("tipo").toString();
			if (tipo.contains("a")){
				response.sendRedirect("Administrador/administrador.jsp");
			} else if (tipo.contains("f")){
				response.sendRedirect("Funcionario/funcionario.jsp");
			} else if (tipo.contains("p")){
				response.sendRedirect("Professor/professor.jsp");
			} else if (tipo.contains("re")){
				response.sendRedirect("ResponsavelDeEspaco/resEspaco.jsp");
			} 
  		}
	}
	
	if(operacao.matches("inicial")){
		String tipo = session.getAttribute("tipo").toString();
		if (tipo.contains("a")){
			response.sendRedirect("Administrador/administrador.jsp");
		} else if (tipo.contains("f")){
			response.sendRedirect("Funcionario/funcionario.jsp");
		} else if (tipo.contains("p")){
			response.sendRedirect("Professor/professor.jsp");
		} else if (tipo.contains("re")){
			response.sendRedirect("ResponsavelDeEspaco/resEspaco.jsp");
		} 
	}
	
	if(operacao.matches("inicio")){
		String tipo = session.getAttribute("tipo").toString();
		if (tipo.contains("a")){
			out.print("a");
		} else if (tipo.contains("f")){
			out.print("f");
		} else if (tipo.contains("p")){
			out.print("p");
		} else if (tipo.contains("re")){
			out.print("re");
		}
	}
%>