window.addEventListener("load",init,false);

function init(e){

}

function listarEspacosReservar(){
	var params="operacao=listarEspacosReservar";
		params+="&_edificio="+document.querySelector('#_edificio').options[document.querySelector('#_edificio').selectedIndex].value;
		params+="&_piso="+document.querySelector('#_piso').options[document.querySelector('#_piso').selectedIndex].value;
	AJAXRequest("../PR/prManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#listagem")},true);
}

function escolhaEspaco(id ,nome){
	var params="operacao=escolhaEspaco";
	params+="&id="+id;
	params+="&nome="+nome;
	AJAXRequest("../PR/prManager.jsp","POST",params,
		function(e){actualizarResultados(e.responseText,".padded")},true);
}

function listarReservasDoDia(idEspaco,nomeEspaco){
	var params="operacao=listarReservasDoDia";
		params+="&_dd="+document.querySelector('#_dd').value;
		params+="&_mm="+document.querySelector('#_mm').value;		
		params+="&_aa="+document.querySelector('#_aa').value;
		params+="&idEspaco="+idEspaco;
		params+="&nomeEspaco="+nomeEspaco;
	AJAXRequest("../PR/prManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#listagem")},true);
}

function formReservar(data ,nome, id){
	var params="operacao=formReservar";
	params+="&_dataReserva="+data;
	params+="&_nome="+nome;
	params+="&_id="+id;
	AJAXRequest("../PR/prManager.jsp","POST",params,
		function(e){actualizarResultados(e.responseText,".padded")},true);
}

function formReservarMultipla(data ,nome, id){
	var params="operacao=formReservarMultipla";
	params+="&_dataReserva="+data;
	params+="&_nome="+nome;
	params+="&_id="+id;
	AJAXRequest("../PR/prManager.jsp","POST",params,
		function(e){actualizarResultados(e.responseText,".padded")},true);
}

function adicionarReserva(id ,data){
	var params="operacao=adicionarReserva";
	params+="&_horaI="+document.querySelector('#_horaI').options[document.querySelector('#_horaI').selectedIndex].value;
	params+="&_minI="+document.querySelector('#_minI').options[document.querySelector('#_minI').selectedIndex].value;	
	params+="&_horaF="+document.querySelector('#_horaF').options[document.querySelector('#_horaF').selectedIndex].value;
	params+="&_minF="+document.querySelector('#_minF').options[document.querySelector('#_minF').selectedIndex].value;
	params+="&_desUso="+document.querySelector('#_desUso').value;
	params+="&_dataReserva="+data;
	params+="&_id="+id;
	params+="&_dd="+document.querySelector('#_dd').value;
	params+="&_mm="+document.querySelector('#_mm').value;		
	params+="&_aa="+document.querySelector('#_aa').value;
	AJAXRequest("../PR/prManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#resultadoFr")},true);
}

function listarEspacosParametros(){
	var params="operacao=listarEspacosParametros";
	params+="&_piso="+document.querySelector('#_piso').options[document.querySelector('#_piso').selectedIndex].value;
	params+="&_edificio="+document.querySelector('#_edificio').options[document.querySelector('#_edificio').selectedIndex].value;
	params+="&_nPc="+document.querySelector('#_nPc').value;
	params+="&_projetor="+document.querySelector('#_projetor').options[document.querySelector('#_projetor').selectedIndex].value;
	params+="&_nLugares="+document.querySelector('#_nLugares').value;
	/*params+="&_dd="+document.querySelector('#_dd').value;
	params+="&_mm="+document.querySelector('#_mm').value;		
	params+="&_aa="+document.querySelector('#_aa').value;
	params+="&_horaI="+document.querySelector('#_horaI').options[document.querySelector('#_horaI').selectedIndex].value;
	params+="&_minI="+document.querySelector('#_minI').options[document.querySelector('#_minI').selectedIndex].value;	
	params+="&_horaF="+document.querySelector('#_horaF').options[document.querySelector('#_horaF').selectedIndex].value;
	params+="&_minF="+document.querySelector('#_minF').options[document.querySelector('#_minF').selectedIndex].value;*/
AJAXRequest("../PR/prManager.jsp","POST",params,
				function(e){actualizarResultados(e.responseText,".padded")},true);
}

function removerReserva(linha, atributo){
	var params="operacao=removerReserva";
	params+="&idR="+atributo;
	AJAXRequest("../PR/prManager.jsp","POST",params,
		function(e){
	linha.parentNode.removeChild(linha);
	actualizarResultados(e.responseText,"#resultadoRr")},true);
}

function listarReservasU(){
	var params="operacao=listarReservasU";
		params+="&_estado="+document.querySelector('#_estado').options[document.querySelector('#_estado').selectedIndex].value;
	AJAXRequest("../PR/prManager.jsp","POST",params,
				function(e){actualizarResultados(e.responseText,"#listagem")},true);
}

function actualizarResultados(dados,idLocal){
	var sitio = document.querySelector(idLocal);
	sitio.innerHTML=dados;
}