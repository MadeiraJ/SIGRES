window.addEventListener("load",init,false);

function init(e){
	var conteudo = document.querySelector(".padded");
	var actionAdicionarUser= document.querySelector("#adicionarUtilizador");
	var actionRemoverUser= document.querySelector("#removerUtilizador");
	var actionAlterarREspaco= document.querySelector("#alterarREspaco");

	actionAdicionarUser.addEventListener("mousedown", adicionarUtilizador, false);
	actionRemoverUser.addEventListener("mousedown", removerUtilizador, false);
	actionAlterarREspaco.addEventListener("mousedown", alterarREspaco, false);
}

function adicionarUtilizador(e){
	AJAXRequest("adicionarUtilizador.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true);
}

function adicionarU(){
	var params="operacao=adicionarUtilizador";
		params+="&_user="+document.querySelector('#_user').value;
		params+="&_pass1="+document.querySelector('#_pass1').value;
		params+="&_pass2="+document.querySelector('#_pass2').value;
		params+="&_nome="+document.querySelector('#_nome').value;		
		params+="&_email="+document.querySelector('#_email').value;
		params+="&_tipoUser="+document.querySelector('#_tipoUser').options[document.querySelector('#_tipoUser').selectedIndex].value;
	AJAXRequest("userManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#resultadoAu");},true);
}

function removerUtilizador(e){
	AJAXRequest("removerUtilizador.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true);
}

function listarF(){
	var params="operacao=listarUtilizadores";
		params+="&_tipoUser="+document.querySelector('#_tipoUser').options[document.querySelector('#_tipoUser').selectedIndex].value;
	AJAXRequest("userManager.jsp","POST",params,
			function(e){actualizarResultados(e.responseText,"#listagem")},true);
}

function remover(linha, atributo){
	var params="operacao=eliminarUtilizador";
	params+="&id="+atributo;
	AJAXRequest("userManager.jsp","POST",params,
		function(e){
	linha.parentNode.removeChild(linha);
	actualizarResultados(e.responseText,"#resultadoOp")},true);
}

function alterarREspaco(e){
	AJAXRequest("alterarREspaco.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true);
}

function escolherResponsavel(linha, antigo){
	var params="operacao=escolherResponsavel";
	params+="&_antigoR="+antigo;
	AJAXRequest("userManager.jsp","POST",params,
		function(e){
	actualizarResultados(e.responseText,".padded")},true);
}

function alterarResponsavel(linha, antigo, novo){
	var params="operacao=alterarResponsavel";
	params+="&_antigoR="+antigo;
	params+="&_novoR="+novo;
	AJAXRequest("userManager.jsp","POST",params,
		function(e){
	actualizarResultados(e.responseText,"#resultadoEr")},true);
}

function actualizarResultados(dados,idLocal){
	var sitio = document.querySelector(idLocal);
	sitio.innerHTML=dados;
}