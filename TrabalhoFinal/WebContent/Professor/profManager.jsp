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
	<% String operacao = request.getParameter("operacao");

%>