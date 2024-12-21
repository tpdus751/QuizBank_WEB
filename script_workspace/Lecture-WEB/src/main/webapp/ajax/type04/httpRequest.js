/**
 * Ajax와 관련된 함수 집합
 */
let httpRequest = null;

function getXMLHttpRequest() {
	if(window.XMLHttpRequest) {
		return new XMLHttpRequest();
	}
	if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}

function sendProcess(method, url, params, callback) {
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = callback;
	
	let httpMethod = method.toUpperCase();
	if(httpMethod != 'GET' && httpMethod != 'POST')
		httpMethod = 'GET';
	
	httpParams = params;
	if(params == null || params == '')
		httpParams = '';
	if(typeof(params) == 'object') {
		// json => name=value&name=value
		httpParams = '';
		for(let key in params) {
			if(httpParams != '')
				httpParams += '&';
			httpParams += key + '=' + encodeURIComponent(params[key]);
		}
	}	
	
	httpUrl = url;
	if(httpMethod == 'GET' && httpParams != '') {
		httpUrl = url + '?' + httpParams;
	} 
		
	httpRequest.open(httpMethod, httpUrl, true);
	if(httpMethod == "POST") {
		httpRequest.setRequestHeader(
				'content-type', 'application/x-www-form-urlencoded');
	}
	httpRequest.send(httpMethod == 'GET' ? null : httpParams);
}















