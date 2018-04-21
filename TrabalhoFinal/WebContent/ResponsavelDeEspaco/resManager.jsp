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

<jsp:useBean id="con" class="dataccess.ConnectionFactory" scope="session"/>
	<%
	String operacao = request.getParameter("operacao");
	
	if(operacao.matches("inserirEspaco")){
	  	EspacoDAO ldao = DAOFactory.createEspacoDAO();
	  	ldao.setConnection(con.getConnection());
	  		
	  		int res= ldao.novoEspaco(
	 			request.getParameter("_nomeEspaco"),
	 			Integer.parseInt(request.getParameter("_piso")),
	 			request.getParameter("_edificio"),
	 			Integer.parseInt(request.getParameter("_nPc")),
	 			request.getParameter("_projetor"),
	 			Integer.parseInt(request.getParameter("_nLugares")),
	 			request.getParameter("_outrasCarav"),
	 			Integer.parseInt(session.getAttribute("idUtilizador").toString()));
	 				
	  	response.sendRedirect("resEspaco.jsp"); 
	}
	
  	if(operacao.matches("listarEspacos")){
		pageContext.getRequest().setAttribute("_edificio",request.getParameter("_edificio"));
		pageContext.getRequest().setAttribute("_piso",request.getParameter("_piso"));
		if(request.getParameter("_onde").contains("e")){
			pageContext.forward("listarEditarEspaco.jsp");
		} else if (request.getParameter("_onde").contains("r")){
			pageContext.forward("listarEspacoRemover.jsp");
		}
	}
  	
  	if(operacao.matches("formAlterarEspaco")){
		pageContext.getRequest().setAttribute("idE",request.getParameter("idE"));
		pageContext.forward("formEditarEspaco.jsp");
	}
  	
	if(operacao.matches("alterarEspaco")){
	  	EspacoDAO ldao = DAOFactory.createEspacoDAO();
	  	ldao.setConnection(con.getConnection());
	  
	 	int res= ldao.editarEspaco(
	 			Integer.parseInt(request.getParameter("_id")),
	 			request.getParameter("_nomeEspaco"),
	 			Integer.parseInt(request.getParameter("_piso")),
	 			request.getParameter("_edificio"),
	 			Integer.parseInt(request.getParameter("_nPc")),
	 			request.getParameter("_projetor"),
	 			Integer.parseInt(request.getParameter("_nLugares")),
	 			request.getParameter("_outrasCarav"),
	 			Integer.parseInt(session.getAttribute("idUtilizador").toString().toString()));
	 	
	  	response.sendRedirect("resEspaco.jsp"); 
	}
	 
	if(operacao.matches("removerEspaco")){
		EspacoDAO ldao = DAOFactory.createEspacoDAO();
	  	ldao.setConnection(con.getConnection());
  	
  		int res= ldao.eliminarEspaco(Integer.parseInt(request.getParameter("idE").toString()));
	}
	
	if(operacao.matches("adicionarReservaMultipla")){ 
		ReservaDAO ldao = DAOFactory.createReservaDAO();
	  	ldao.setConnection(con.getConnection());
	  	String data1 = request.getParameter("_d")+"/"+request.getParameter("_m")+"/"+request.getParameter("_a");
	
	  	int res= ldao.novaReservaMultipla(
	  			request.getParameter("_dataReserva"),
	 			request.getParameter("_horaI")+":"+request.getParameter("_minI"),
	 			request.getParameter("_horaF")+":"+request.getParameter("_minF"),
	 			request.getParameter("_desUso"),
	 			data1,
	 			Integer.parseInt(request.getParameter("_id")),
	 			Integer.parseInt(session.getAttribute("idUtilizador").toString()));
	  	 
	  	response.sendRedirect("resEspaco.jsp"); 
	}
	
	if(operacao.matches("aceitarReserva")){
	  	ReservaDAO ldao = DAOFactory.createReservaDAO();
	  	ldao.setConnection(con.getConnection());
	  
	  	int res= ldao.confirmarReserva(
	  			Integer.parseInt(request.getParameter("idR").toString()),"a");
	}
	
	if(operacao.matches("recusarReserva")){
	  	ReservaDAO ldao = DAOFactory.createReservaDAO();
	  	ldao.setConnection(con.getConnection());
	  
	  	int res= ldao.confirmarReserva(
	  			Integer.parseInt(request.getParameter("idR").toString()),"r");
	}
%>