window.addEventListener("load",init,false);

function init(e){

}


function verificarCredenciais(){
	var params="operacao=verificarCredenciais";
	AJAXRequest("verificaLogin.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#resultadoOp")},true);
}


