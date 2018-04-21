window.addEventListener("load",init,false);

function init(e){
	var conteudo = document.querySelector(".padded")
	var actionListarReservas= document.querySelector("#listarReservas");
	 
	 actionListarReservas.addEventListener("mousedown", listarReservas, false);
}

function listarReservas(e){
	AJAXRequest("listarReservas.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true)
}


function listarEspacosReservar(){
	var params="operacao=listarEspacosReservar";
		params+="&_edificio="+document.querySelector('#_edificio').options[document.querySelector('#_edificio').selectedIndex].value;
		params+="&_piso="+document.querySelector('#_piso').options[document.querySelector('#_piso').selectedIndex].value;
	AJAXRequest("funcManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#listagem")},true);
}

function escolhaEspaco(id ,nome){
	var params="operacao=escolhaEspaco";
	params+="&id="+id;
	params+="&nome="+nome;
	AJAXRequest("funcManager.jsp","POST",params,
		function(e){actualizarResultados(e.responseText,".padded")},true);
}

function listarReservasDoDia(idEspaco,nomeEspaco){
	var params="operacao=listarReservasDoDia";
		params+="&_dd="+document.querySelector('#_dd').value;
		params+="&_mm="+document.querySelector('#_mm').value;		
		params+="&_aa="+document.querySelector('#_aa').value;
		params+="&idEspaco="+idEspaco;
		params+="&nomeEspaco="+nomeEspaco;
	AJAXRequest("funcManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#listagem")},true);
}


function actualizarResultados(dados,idLocal){
	var sitio = document.querySelector(idLocal);
	sitio.innerHTML=dados;
}