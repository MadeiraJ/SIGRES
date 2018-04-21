window.addEventListener("load",init,false);

function init(e){
	 var conteudos= document.querySelector(".padded");
	 var actionPesquisaAvancada= document.querySelector("#pesquisaAvancada");
	 var actionPesquisaPorEspaco= document.querySelector("#pesquisaPorEspaco");
	 var actionRemoverReservas= document.querySelector("#removerReservas");
	 var actionListarReservas= document.querySelector("#listarReservas");
	 
	 actionPesquisaAvancada.addEventListener("mousedown", pesquisaAvancada, false);
	 actionPesquisaPorEspaco.addEventListener("mousedown", pesquisaPorEspaco, false);
	 actionRemoverReservas.addEventListener("mousedown", removerReservas, false);
	 actionListarReservas.addEventListener("mousedown", listarReservas, false);
}

function pesquisaAvancada(e){
	AJAXRequest("../PR/pesquisaAvancada.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function pesquisaPorEspaco(e){
	AJAXRequest("../PR/pesquisaPorEspaco.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function removerReservas(e){
	AJAXRequest("../PR/removerReserva.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function listarReservas(e){
	AJAXRequest("../PR/listarReserva.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function actualizarResultados(dados,idLocal){
	var sitio = document.querySelector(idLocal);
	sitio.innerHTML=dados;
}