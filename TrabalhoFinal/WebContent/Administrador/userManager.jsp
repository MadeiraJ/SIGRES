<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../erro.jsp"
 isErrorPage="false"%>
    <%@ page import="java.sql.*"%>
<%@ page import="grh.espaco.*"%>
<%@ page import="grh.reserva.*"%>
<%@ page import="grh.utilizador.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dataccess.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.util.ArrayList"%>
   <script type="text/javascript" src="../Javascript/ajax.js"></script>
   <script type="text/javascript" src="../Javascript/todos.js"></script>
   <script type="text/javascript" src="../Javascript/a.js"></script>
<jsp:useBean id="con" class="dataccess.ConnectionFactory" scope="session"/>
<% 
  String operacao = request.getParameter("operacao");

  	if(operacao.matches("adicionarUtilizador")){
	  	UtilizadorDAO ldao = DAOFactory.createUtilizadorDAO();
	  	ldao.setConnection(con.getConnection());
	    
	  	if (request.getParameter("_pass1").contains(request.getParameter("_pass2"))){
			int res= ldao.novoUtilizador(request.getParameter("_user"),
				request.getParameter("_pass1"),
				request.getParameter("_tipoUser"),
				request.getParameter("_nome"),	
				request.getParameter("_email"));
	  	}	

		response.sendRedirect("administrador.jsp");	  	
  	}
  
  	if(operacao.matches("listarUtilizadores")){
		pageContext.getRequest().setAttribute("_tipoUser",request.getParameter("_tipoUser"));
		pageContext.forward("listarUtilizadoresRemover.jsp");
	}
  	
  	if(operacao.matches("eliminarUtilizador")){
	  	UtilizadorDAO ldao = DAOFactory.createUtilizadorDAO();
	  	ldao.setConnection(con.getConnection());
	    
		String id = request.getParameter("id");
		int res= ldao.eliminarUtilizador(id);
	 
  	}
  	
  	if(operacao.matches("escolherResponsavel")){
		pageContext.getRequest().setAttribute("_antigoR",request.getParameter("_antigoR"));
		pageContext.forward("escolherResponsavel.jsp");
	}
  	 	
  	if(operacao.matches("alterarResponsavel")){
	  	EspacoDAO ldao = DAOFactory.createEspacoDAO();
	  	ldao.setConnection(con.getConnection());
	    
	  	String antigo = request.getParameter("_antigoR");
	  	String novo = request.getParameter("_novoR");
	  	
		int res= ldao.alterarResponsavelEspaco(antigo,novo);
				
	  	response.sendRedirect("administrador.jsp");  
  	}
 %>