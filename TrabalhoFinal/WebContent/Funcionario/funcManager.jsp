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

<jsp:useBean id="con" class="dataccess.ConnectionFactory" scope="session"/>
<% 
  String operacao = request.getParameter("operacao");
	
	if(operacao.matches("listarEspacosReservar")){
		pageContext.getRequest().setAttribute("_edificio",request.getParameter("_edificio"));
		pageContext.getRequest().setAttribute("_piso",request.getParameter("_piso"));
		pageContext.forward("listarEspacos.jsp");
	}
	
	if(operacao.matches("escolhaEspaco")){
		pageContext.getRequest().setAttribute("id",request.getParameter("id"));
		pageContext.getRequest().setAttribute("nome",request.getParameter("nome"));
		pageContext.forward("reservasEspaco.jsp");
	}
	
	if(operacao.matches("listarReservasDoDia")){
		pageContext.getRequest().setAttribute("idEspaco",request.getParameter("idEspaco"));
		pageContext.getRequest().setAttribute("_dd", request.getParameter("_dd"));
		pageContext.getRequest().setAttribute("_mm", request.getParameter("_mm"));
		pageContext.getRequest().setAttribute("_aa", request.getParameter("_aa"));
		pageContext.getRequest().setAttribute("nomeEspaco",request.getParameter("nomeEspaco"));
		pageContext.forward("listarReservasDia.jsp");
	}
%>