<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.ubintis.api.ApiPolicyService" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.framework.config.AgentConfig" %>

<%
	String loginPolicy = "";
	
	ApiPolicyService service = new ApiPolicyService();
	
	String errorCode = service.executeLoginPolicy();
	if( "".equals( errorCode ) ) {
		loginPolicy = service.getLoginPolicy();
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

<script type="text/javascript">

</script>

</head>
<body>

	<div class="wrap">
		<h1>&nbsp; &nbsp; &nbsp;Pass-Ni SSO Sample Page ( 보안 정책 조회 )</h1>
		
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
				<p><span class="tit">로그인 정책 조회</span><span class="cont">&nbsp;&nbsp; API 설명</span></p>
				<ul class="list-style">
					<li>
						<span class="tit color">String com.ubintis.api.ApiPolicyService.executeLoginPolicy()</span>
						<br/>
						<span class="cont">
							&nbsp; 로그인 정책을 조회한다.<br/>
							<br/>
							&nbsp; Returns:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; 에러 코드 ( 에러 코드가 "" 일 경우 정상 )<br/>
							<br/>
						</span>
					</li>
					<li>
						<span class="tit color">String com.ubintis.api.ApiPolicyService.getLoginPolicy()</span>
						<br/>
						<span class="cont" style="border: 1px;">
							&nbsp; 로그인 정책 정보를 획득한다.<br/>
							&nbsp; &nbsp;- executeLoginPolicy() 호출 후 에러코드가 ""인 경우에 로그인 정책 정보 획득<br/>
							<br/>
							&nbsp; Returns:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; 로그인 정책(json), 로그인 정책이 없을 경우 "none" 리턴<br/>
							<br/>
							<br/>
						</span>
					</li>
				</ul>
				<p><span class="tit">로그인 정책 조회</span><span class="cont">&nbsp;&nbsp; 예제</span></p>
				<ul class="list-style">
					<li>
						<span class="tit color">로그인 정책을 조회한다.</span>
						<br/>
						<span class="cont">
							&nbsp; ApiPolicyService service = new ApiPolicyService();<br/>
							&nbsp; String errorCode = service.executeLoginPolicy();<br/>
							<br/>
							&nbsp; if( "".equals( errorCode ) ) {<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; String loginPolicy = service.getLoginPolicy();<br/>
							&nbsp; }<br/>
							<br/>
						</span>
					</li>
					<li>
						<span class="tit color">예제 실행 결과</span>
						<br/>
						<span class="cont">
							&nbsp; [ ErrorCode ] <%=errorCode %><br/>
							&nbsp; [ 로그인 정책 ] <%=loginPolicy%><br/>
							&nbsp; &nbsp; &nbsp; - atmc_logout_yn(자동 로그아웃 사용 여부)<br/>
							&nbsp; &nbsp; &nbsp; - atmc_logout_time(자동 로그아웃 시간(분))<br/>
							&nbsp; &nbsp; &nbsp; - login_dup_yn(중복 로그인 여부)<br/>
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
