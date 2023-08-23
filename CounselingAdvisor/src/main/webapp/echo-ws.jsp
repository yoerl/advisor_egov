<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Websocket Echo</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#sendBtn').click(function() { sendMessage(); });
	});
	
	var wsocket;
	function sendMessage() {
		//wsocket = new WebSocket("ws://localhost:9000/echo-ws");
		var serverUrl = $("#serverUrl").val();
		alert("Call Websocket URL : "+serverUrl);
		wsocket = new WebSocket(serverUrl);
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
		wsocket.onopen = function() {
			wsocket.send( $("#message").val() );
		};
	}
	function onMessage(evt) {
		var data = evt.data;
		alert("Receive Echo Data : " + data);
		wsocket.close();
	}
	function onClose(evt) {
		alert("Websocket Closed !!!");
	}
</script>
</head>
<body>

	Websocket Server URL : <input type="text" id="serverUrl" value="ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/echo-ws" style="width:400px"><br>
    Send Message : <input type="text" id="message">
    <input type="button" id="sendBtn" value="Send Message">
</body>
</html>