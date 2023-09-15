<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.ubintis.api.ApiTokenService" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.framework.config.AgentConfig" %>

<%
	String errorCode = "";
	String pni_token = "";
	
	String user_id = "djkang";
	String local_ip = request.getRemoteAddr();

	/**
	 * API를 이용하여 토큰으로 사용자 정보 조회
	 */
	ApiTokenService service = new ApiTokenService();
	errorCode = service.createToken( user_id, local_ip );
	
	if( "".equals( errorCode ) ) {
		pni_token = service.getPni_token();
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
		<h1>&nbsp; &nbsp; &nbsp;Pass-Ni SSO Sample Page ( 인증토큰 생성 )</h1>
		
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
				<p><span class="tit">사용자 정보로 인증토큰 생성</span><span class="cont">&nbsp;&nbsp; API 설명</span></p>
				<ul class="list-style">
					<li>
						<span class="tit color">String com.ubintis.api.ApiTokenService.createToken(String user_id, String local_ip)</span>
						<br/>
						<span class="cont">
							&nbsp; 사용자 정보로 인증토큰을 생성한다.<br/>
							<br/>
							&nbsp; Parameters:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; user_id 사용자 아이디<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; local_ip 사용자 아이피<br/>
							&nbsp; Returns:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; 에러 코드 ( 에러 코드가 "" 일 경우 정상 )<br/>
							<br/>
						</span>
					</li>
					<li>
						<span class="tit color">String com.ubintis.api.ApiTokenService.getPni_token()</span>
						<br/>
						<span class="cont" style="border: 1px;">
							&nbsp; 인증토큰을 획득한다.<br/>
							&nbsp; &nbsp;- createToken() 호출 후 에러코드가 ""인 경우에 인증토큰 획득<br/>
							<br/>
							&nbsp; Returns:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; 인증토큰<br/>
							<br/>
							<br/>
						</span>
					</li>
				</ul>
				<p><span class="tit">사용자 정보로 인증토큰 생성한다.</span><span class="cont">&nbsp;&nbsp; 예제</span></p>
				<ul class="list-style">
					<li>
						<span class="tit color">인증 코튼 생성</span>
						<br/>
						<span class="cont">
							&nbsp; String user_id = "djkang";<br/>
							&nbsp; String local_ip = request.getRemoteAddr();<br/>
							<br/>
							&nbsp; ApiTokenService service = new ApiTokenService();<br/>
							&nbsp; String errorCode = service.createToken( user_id, local_ip );<br/>
							<br/>
							&nbsp; if( "".equals( errorCode ) ) {<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; String pni_token = service.getPni_token();<br/>
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
