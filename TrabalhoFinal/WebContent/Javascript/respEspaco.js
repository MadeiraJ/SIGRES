window.addEventListener("load",init,false);

function init(e){
	 var conteudos= document.querySelector(".padding");
	 var actionAdicionarEspaco= document.querySelector("#adicionarEspaco");
	 var actionEditarEspaco= document.querySelector("#editarEspaco");
	 var actionRemoverEspaco= document.querySelector("#removerEspaco");
	 
	 var actionPesquisaAvancada= document.querySelector("#pesquisaAvancada");
	 var actionPesquisaPorEspaco= document.querySelector("#pesquisaPorEspaco");
	 var actionRemoverReservas= document.querySelector("#removerReservas");
	 var actionListarReservas= document.querySelector("#listarReservas");
	 var actionConfirmarReservas= document.querySelector("#confirmarReservas");
 
	 actionAdicionarEspaco.addEventListener("mousedown", adicionarEspaco, false);
	 actionEditarEspaco.addEventListener("mousedown", editarEspaco, false);
	 actionRemoverEspaco.addEventListener("mousedown", removerEspaco, false);
	 
	 actionPesquisaAvancada.addEventListener("mousedown", pesquisaAvancada, false);
	 actionPesquisaPorEspaco.addEventListener("mousedown", pesquisaPorEspaco, false);
	 actionRemoverReservas.addEventListener("mousedown", removerReservas, false);
	 actionListarReservas.addEventListener("mousedown", listarReservas, false);
	 actionConfirmarReservas.addEventListener("mousedown", confirmarReservas, false);
}


function adicionarEspaco(e){
	AJAXRequest("adicionarEspaco.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function adicionarE(){
	var params="operacao=inserirEspaco";
		params+="&_nomeEspaco="+document.querySelector('#_nomeEspaco').value;
		params+="&_piso="+document.querySelector('#_piso').options[document.querySelector('#_piso').selectedIndex].value;
		params+="&_edificio="+document.querySelector('#_edificio').options[document.querySelector('#_edificio').selectedIndex].value;
		params+="&_nPc="+document.querySelector('#_nPc').value;
		params+="&_projetor="+document.querySelector('#_projetor').options[document.querySelector('#_projetor').selectedIndex].value;
		params+="&_nLugares="+document.querySelector('#_nLugares').value;		
		params+="&_outrasCarav="+document.querySelector('#_outrasCarav').value;
	AJAXRequest("resManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#resultadoAp")},true);
}

function editarEspaco(e){
	AJAXRequest("editarEspaco.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function listarEspacos(onde){
	var params="operacao=listarEspacos";
		params+="&_edificio="+document.querySelector('#_edificio').options[document.querySelector('#_edificio').selectedIndex].value;
		params+="&_piso="+document.querySelector('#_piso').options[document.querySelector('#_piso').selectedIndex].value;
		params+="&_onde="+onde;
	AJAXRequest("resManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#listagem")},true);
}

function fromAlterarE(linha, atributo){
	var params="operacao=formAlterarEspaco";
	params+="&idE="+atributo;
	AJAXRequest("resManager.jsp","POST",params,
		function(e){
	actualizarResultados(e.responseText,".padded")},true);
}

function alterarE(idEspaco){
	var params="operacao=alterarEspaco";
		params+="&_id="+idEspaco;
		params+="&_nomeEspaco="+document.querySelector('#_nomeEspaco').value;
		params+="&_piso="+document.querySelector('#_piso').options[document.querySelector('#_piso').selectedIndex].value;
		params+="&_edificio="+document.querySelector('#_edificio').options[document.querySelector('#_edificio').selectedIndex].value;
		params+="&_nPc="+document.querySelector('#_nPc').value;
		params+="&_projetor="+document.querySelector('#_projetor').options[document.querySelector('#_projetor').selectedIndex].value;
		params+="&_nLugares="+document.querySelector('#_nLugares').value;		
		params+="&_outrasCarav="+document.querySelector('#_outrasCarav').value;
	AJAXRequest("resManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#resultadoMe")},true);
}

function removerEspaco(e){
	AJAXRequest("removerEspaco.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function removerE(linha, atributo){
	var params="operacao=removerEspaco";
	params+="&idE="+atributo;
	AJAXRequest("resManager.jsp","POST",params,
		function(e){
	linha.parentNode.removeChild(linha);
	actualizarResultados(e.responseText,"#resultadoLr")},true);
}

function pesquisaAvancada(e){
	AJAXRequest("../PR/pesquisaAvancada.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function pesquisaPorEspaco(e){
	AJAXRequest("../PR/pesquisaPorEspaco.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function adicionarReservaMultipla(id ,data){
	var params="operacao=adicionarReservaMultipla";
	params+="&_horaI="+document.querySelector('#_horaI').options[document.querySelector('#_horaI').selectedIndex].value;
	params+="&_minI="+document.querySelector('#_minI').options[document.querySelector('#_minI').selectedIndex].value;	
	params+="&_horaF="+document.querySelector('#_horaF').options[document.querySelector('#_horaF').selectedIndex].value;
	params+="&_minF="+document.querySelector('#_minF').options[document.querySelector('#_minF').selectedIndex].value;
	params+="&_desUso="+document.querySelector('#_desUso').value;
	params+="&_d="+document.querySelector('#_d').value;
	params+="&_m="+document.querySelector('#_m').value;		
	params+="&_a="+document.querySelector('#_a').value;
	params+="&_dataReserva="+data;
	params+="&_id="+id;
	AJAXRequest("resManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#resultadoFrm")},true);
}


function removerReservas(e){
	AJAXRequest("../PR/removerReserva.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function listarReservas(e){
	AJAXRequest("../PR/listarReserva.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function confirmarReservas(e){
	AJAXRequest("confirmarReservas.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}

function aceitarReserva(linha, atributo){
	var params="operacao=aceitarReserva";
	params+="&idR="+atributo;
	AJAXRequest("resManager.jsp","POST",params,
		function(e){
	linha.parentNode.removeChild(linha);
	actualizarResultados(e.responseText,"#resultadoCr")},true);
}

function recusarReserva(linha, atributo){
	var params="operacao=recusarReserva";
	params+="&idR="+atributo;
	AJAXRequest("resManager.jsp","POST",params,
		function(e){
	linha.parentNode.removeChild(linha);
	actualizarResultados(e.responseText,"#resultadoCr")},true);
}

function actualizarResultados(dados,idLocal){
	var sitio = document.querySelector(idLocal);
	sitio.innerHTML=dados;
}