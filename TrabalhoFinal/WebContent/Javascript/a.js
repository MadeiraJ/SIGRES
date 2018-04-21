window.addEventListener("load",init,false);

function init(e){
	var conteudo = document.querySelector(".padded");
	var actionInicio = document.querySelector("#inicio");
	
	actionInicio.addEventListener("mousedown", inicio, false);
}

function inicio(e){
	var params="operacao=inicio";
	AJAXRequest("../todos.jsp","POST",params,
		function(e){
		    if(e.responseText.trim()=='a'){
		    	window.location.replace('administrador.jsp');
		    } else if (e.responseText.trim()=='f'){
		    	window.location.replace('funcionario.jsp');
		    } else if (e.responseText.trim()=='p'){
		    	window.location.replace('professor.jsp');
		    } else if (e.responseText.trim()=='re'){
		    	window.location.replace('resEspaco.jsp');
		    }
		},true);
}
