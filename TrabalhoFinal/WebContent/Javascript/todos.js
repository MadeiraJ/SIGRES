history.go(1);// apagar se der problemas
window.addEventListener("load",init,false);

function init(e){
	var conteudo = document.querySelector(".padded");
	var actionAlterarPass = document.querySelector("#alterarU");
	var actionInicial = document.querySelector("#inicial");
	var actionPaginaLogin = document.querySelector("#paginaLogin");
	 
	actionAlterarPass.addEventListener("mousedown", alterarU, false);
	actionInicial.addEventListener("mousedown", inicial, false);
	actionPaginaLogin.addEventListener("mousedown", paginaLogin, false);
	  
}

function paginaLogin(e){
	var params="operacao=paginaLogin";
	AJAXRequest("../todos.jsp","POST",params,
		function(e){
		    if(e.responseText.trim()=='login_ok');
				window.location.replace('../login.jsp');
		},true);
}

function alterarU(e){
	AJAXRequest("../alterarPass.jsp","GET",null,
			function(e){actualizarResultados(e.responseText,".padded")},true);
}

function alterarPasse(){
	var params="operacao=alterarPasse";
	params+="&_passA="+document.querySelector('#_passA').value;
	params+="&_pass1="+document.querySelector('#_pass1').value;
	params+="&_pass2="+document.querySelector('#_pass2').value;
AJAXRequest("../todos.jsp","POST",params,
		function(e){actualizarResultados(e.responseText,"#resultadoAp")},true);
}

function inicial(){
	var params="operacao=inicial";
AJAXRequest("../todos.jsp","GET",params,
		function(e){actualizarResultados(e.responseText,"#resultadoI")},true);
}
