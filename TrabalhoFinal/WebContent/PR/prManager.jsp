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
		pageContext.forward("../PR/listarEspacos.jsp");
	}
	
	if(operacao.matches("escolhaEspaco")){
		pageContext.getRequest().setAttribute("id",request.getParameter("id"));
		pageContext.getRequest().setAttribute("nome",request.getParameter("nome"));
		pageContext.forward("../PR/reservasEspaco.jsp");
	}
	
	if(operacao.matches("listarReservasDoDia")){
		pageContext.getRequest().setAttribute("idEspaco",request.getParameter("idEspaco"));
		pageContext.getRequest().setAttribute("_dd", request.getParameter("_dd"));
		pageContext.getRequest().setAttribute("_mm", request.getParameter("_mm"));
		pageContext.getRequest().setAttribute("_aa", request.getParameter("_aa"));
		pageContext.getRequest().setAttribute("nomeEspaco",request.getParameter("nomeEspaco"));
		pageContext.forward("../PR/listarReservasDia.jsp");
	}
	
	if(operacao.matches("formReservar")){
		pageContext.getRequest().setAttribute("_dataReserva",request.getParameter("_dataReserva"));
		pageContext.getRequest().setAttribute("_nome",request.getParameter("_nome"));
		pageContext.getRequest().setAttribute("_id",request.getParameter("_id"));
		pageContext.forward("../PR/formReservar.jsp");
	}
	
	if(operacao.matches("formReservarMultipla")){
		pageContext.getRequest().setAttribute("_dataReserva",request.getParameter("_dataReserva"));
		pageContext.getRequest().setAttribute("_nome",request.getParameter("_nome"));
		pageContext.getRequest().setAttribute("_id",request.getParameter("_id"));
		pageContext.forward("../ResponsavelDeEspaco/formReservarMultipla.jsp");
	}
	
	if(operacao.matches("listarEspacosParametros")){
		pageContext.getRequest().setAttribute("_piso",request.getParameter("_piso"));
		pageContext.getRequest().setAttribute("_edificio",request.getParameter("_edificio"));
		pageContext.getRequest().setAttribute("_nPc",request.getParameter("_nPc"));
		pageContext.getRequest().setAttribute("_projetor",request.getParameter("_projetor"));
		pageContext.getRequest().setAttribute("_nLugares",request.getParameter("_nLugares"));
		/*pageContext.getRequest().setAttribute("_dd",request.getParameter("_dd"));
		pageContext.getRequest().setAttribute("_mm",request.getParameter("_mm"));
		pageContext.getRequest().setAttribute("_aa",request.getParameter("_aa"));
		pageContext.getRequest().setAttribute("_horaI",request.getParameter("_horaI"));
		pageContext.getRequest().setAttribute("_minI",request.getParameter("_minI"));
		pageContext.getRequest().setAttribute("_horaF",request.getParameter("_horaF"));
		pageContext.getRequest().setAttribute("_minF",request.getParameter("_minF"));*/
		pageContext.forward("../PR/listaEspacosReservar.jsp");
	}
	
	if(operacao.matches("adicionarReserva")){
		 
		 ReservaDAO ldao = DAOFactory.createReservaDAO();
	  	ldao.setConnection(con.getConnection());

	  	int res= ldao.novaReserva(request.getParameter("_dataReserva"),
	 			request.getParameter("_horaI")+":"+request.getParameter("_minI"),
	 			request.getParameter("_horaF")+":"+request.getParameter("_minF"),
	 			request.getParameter("_desUso"),
	 			Integer.parseInt(request.getParameter("_id")),
	 			Integer.parseInt(session.getAttribute("idUtilizador").toString()));
	  	 
	  	if (session.getAttribute("tipo").toString().equals("re")){
			response.sendRedirect("../ResponsavelDeEspaco/resEspaco.jsp");
		} else if (session.getAttribute("tipo").toString().equals("p")){
			response.sendRedirect("../Professor/professor.jsp");
		}
	}
	
	if(operacao.matches("removerReserva")){
		ReservaDAO ldao = DAOFactory.createReservaDAO();
	  	ldao.setConnection(con.getConnection());
  	
  		int res= ldao.eliminarReserva(Integer.parseInt(request.getParameter("idR").toString()));
	}
	
	if(operacao.matches("listarReservasU")){
		pageContext.getRequest().setAttribute("_estado",request.getParameter("_estado"));
		pageContext.forward("../PR/listaUtilizadorReserva.jsp");
	}
	
%>