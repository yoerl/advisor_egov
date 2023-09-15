<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.ubintis.api.ApiUserService" %>
<%@ page import="com.ubintis.common.util.AddressUtil" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.framework.config.AgentConfig" %>

<%
	String errorCode = "";
	String userData = "";

	/**
	 * parameter 에서 인증 토큰 획득
	 */
	String pni_token = StrUtil.NVL( request.getParameter( "pni_token" ) );
	String local_ip = "";
	
	if( "".equals( pni_token ) ) {
		pni_token = StrUtil.NVL( session.getAttribute( "pni_token" ) );
	}

	if( !"".equals( pni_token ) ) {
		local_ip = AddressUtil.getClientIp( request );
		
		/**
		 * API를 이용하여 토큰으로 사용자 정보 조회
		 */
		ApiUserService service = new ApiUserService();
		errorCode = service.executeUserData( pni_token, local_ip );
		
		if( "".equals( errorCode ) ) {
			userData = service.getUserData();
		}
	}
	
	String agt_id = "";
	String agt_domain = "";
	
	if( AgentConfig.getInstance().getAgentBean() != null ) {
		agt_id = AgentConfig.getInstance().getAgentBean().getAgent_id();
		agt_domain = AgentConfig.getInstance().getAgentBean().getAgent_domain();
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
<link rel="stylesheet" type="text/css" href="css/style2.css" />

<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>

<script type="text/javascript">

</script>

</head>
<body>

	<div class="wrap">
		<h1>&nbsp; &nbsp; &nbsp;Pass-Ni SSO Sample Page ( 사용자 정보 조회 )</h1>
		
		<div class="block0">
			<p><span class="tit">연동시스템 정보</span></p>
			<ul class="list-style">
				<li>
					<span class="tit color">Agent 도메인 </span><span class="cont">&nbsp;&nbsp; <%=agt_domain %></span>
					&nbsp; &nbsp; &nbsp; &nbsp;
					<span class="tit color">Agent 아이디 </span><span class="cont">&nbsp;&nbsp; <%=agt_id %></span>
				</li>
			</ul>
		</div>
		
		<div class="bg-section">
			<div class="block1">
				<p><span class="tit">토큰으로 사용자 정보 조회</span><span class="cont">&nbsp;&nbsp; API 설명</span></p>
				<ul class="list-style">
					<li>
						<span class="tit color">String com.ubintis.api.ApiUserService.executeUserData(String pni_token, String local_ip)</span>
						<br/>
						<span class="cont">
							&nbsp; 토큰으로 사용자 정보를 조회한다.<br/>
							<br/>
							&nbsp; Parameters:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; pni_token 인증 서버에서 발급한 토큰<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; local_ip 사용자 아이피<br/>
							&nbsp; Returns:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; 에러 코드 ( 에러 코드가 "" 일 경우 정상 )<br/>
							<br/>
						</span>
					</li>
					<li>
						<span class="tit color">String com.ubintis.api.ApiUserService.getUserData()</span>
						<br/>
						<span class="cont" style="border: 1px;">
							&nbsp; 사용자 정보를 획득한다.<br/>
							&nbsp; &nbsp;- executeUserData() 호출 후 에러코드가 ""인 경우에 사용자 정보 획득<br/>
							<br/>
							&nbsp; Returns:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; 사용자 정보(json)<br/>
							<br/>
							<br/>
						</span>
					</li>
				</ul>
				<p><span class="tit">토큰으로 사용자 정보 조회</span><span class="cont">&nbsp;&nbsp; 예제</span></p>
				<ul class="list-style">
					<li>
						<span class="tit color">사용자 정보를 조회한다.</span>
						<br/>
						<span class="cont">
							&nbsp; String pni_token = StrUtil.NVL( session.getAttribute( "pni_token" ) );<br/>
							<br/>
							&nbsp; if( !"".equals( pni_token ) ) {<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; String local_ip = AddressUtil.getClientIp( request );<br/>
							<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; ApiUserService service = new ApiUserService();<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; String errorCode = service.executeUserData( pni_token, local_ip );<br/>
							<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; if( "".equals( errorCode ) ) {<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; String userData = service.getUserData();<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; }<br/>
							&nbsp; }<br/>
							<br/>
						</span>
					</li>
					<li>
						<span class="tit color">예제 실행 결과</span>
						<br/>
						<span class="cont">
							&nbsp; [ ErrorCode ] <%=errorCode %><br/>
							&nbsp; [ 인증 토큰 ] <%=pni_token%><br/>
							&nbsp; [ 사용자 아이피 ] <%=local_ip%><br/>
							&nbsp; [ 사용자 정보 ] <%=userData%><br/>
						</span>
					</li>
				</ul>
			</div>
		</div>
		
		<br/><br/><br/>
		
		<a href="main.jsp">Pass-Ni SSO Sample Page(메인화면)로 이동</a>
		
		<br/><br/><br/><br/><br/>
		
	</div>

</body>
</html>
