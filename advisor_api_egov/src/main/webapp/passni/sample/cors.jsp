<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>

<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.framework.bean.AgentBean" %>
<%@ page import="com.ubintis.framework.config.AgentConfig" %>

<%
	String svr_api_url = "";
	
	AgentBean agentBean = AgentConfig.getInstance().getAgentBean();
	
	if( agentBean != null ) {
		svr_api_url = agentBean.getServer_url() + agentBean.getServer_api_url();
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=900" />
<title>Pass-Ni SSO Sample Page</title>
	
	<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]--> 
	
	<!--[if lt IE 7]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE8.js"></script>
	<![endif]--> 
	
	<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
	
	<!--[if lt IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
		
<link rel="stylesheet" type="text/css" href="css/default.css" />

<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>

<script type="text/javascript">

	function fnLoginCheck() {
	
		var api_url = '<%=svr_api_url%>/cors/login/check';
		
		var responseData = fnServerRequest(api_url);
		
		if(responseData) {
			$('#code').val(responseData.code);
			$('#data').val(responseData.data);
		}
	}
	
	function fnGetUserIp() {
		
		var api_url = '<%=svr_api_url%>/cors/get/ip';
		
		var responseData = fnServerRequest(api_url);
		
		if(responseData) {
			$('#ip').val(responseData.client_ip);
		}
	}
	
	function fnServerRequest(api_url) {
		
		var res_data;
		
		$.ajax({
			url: api_url,
			xhrFields: { withCredentials: true },
			type: 'post',
			data: '',
			dataType: 'json',
			async: false,
			success: function (responseData)
			{
				res_data = responseData;
			},
			error: function(xhr, error, thrown)
			{
				alert(xhr + '-' + error + '-' + thrown);
			}
		});
		
		return res_data;
	}
	
</script>

</head>
<body>

	<div style="padding:50px 0 0 50px;">
		<h2><a href="javascript:fnLoginCheck();">로그인 체크</a></h2>
		<br/>
		CODE : <input type="text" id="code" style="width:70px" />&nbsp; &nbsp; &nbsp;
		DATA : <input type="text" id="data" style="width:120px" />
	</div>
	
	<div style="padding:50px 0 0 50px;">
		<h2><a href="javascript:fnGetUserIp();">사용자 IP</a></h2>
		<br/>
		IP : <input type="text" id="ip" style="width:120px" />
	</div>

</body>
</html>