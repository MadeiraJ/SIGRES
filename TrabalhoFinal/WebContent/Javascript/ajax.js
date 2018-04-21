
/* page:	página requerida
 * method: 	GET|POST
 * params: 	tuplos de parâmetros separados por &. Exemplo id=123&nome=joaquim&apelido=morais
 * callback:função a ser chamada quando os resultados chegarem
 * async: 	modo de chamada. true= assíncrono| false=síncrono (não aconselhável)
*/

function AJAXRequest(page,method,params,callback,async){
	var xhr;  
	var lparam="";
	
	if(method.toLowerCase()==='get'){
		lparam=null;
		page+=params===null?"":"?"+params;
	}
	else{
		lparam=params; 
	}
	 
	xhr= new XMLHttpRequest();
	xhr.open(method,page,async);
 
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");

	xhr.onload=function(){callback(xhr);};
	xhr.send(lparam);
}