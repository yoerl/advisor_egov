<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.ubintis.api.ApiUserService" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.framework.config.AgentConfig" %>

<%
	String errorCode = "";
	boolean loginFlag = false;
	String resultData = "";

	String pni_token = StrUtil.NVL( session.getAttribute( "pni_token" ) );

	if( !"".equals( pni_token ) ) {
		ApiUserService service = new ApiUserService();
		errorCode = service.executeUserLoginCheck( pni_token );
		
		if( "".equals( errorCode ) ) {
			loginFlag = service.isLogin();
			
			if( !loginFlag ) {
				resultData = service.getResultData();
			}
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

<script type="text/javascript">

</script>

</head>
<body>

	<div class="wrap">
		<h1>&nbsp; &nbsp; &nbsp;Pass-Ni SSO Sample Page ( 로그인 체크 )</h1>
		
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
				<p><span class="tit">로그인 체크</span><span class="cont">&nbsp;&nbsp; API 설명</span></p>
				<ul class="list-style">
					<li>
						<span class="tit color">String com.ubintis.api.ApiUserService.executeUserLoginCheck(String pni_token)</span>
						<br/>
						<span class="cont">
							&nbsp; 토큰으로 사용자 로그인 체크를 한다.<br/>
							<br/>
							&nbsp; Parameters:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; pni_token 인증 서버에서 발급한 토큰<br/>
							&nbsp; Returns:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; 에러 코드 ( 에러 코드가 "" 일 경우 정상 )<br/>
							<br/>
						</span>
					</li>
					<li>
						<span class="tit color">boolean com.ubintis.api.ApiUserService.isLogin()</span>
						<br/>
						<span class="cont" style="border: 1px;">
							&nbsp; 로그인 여부를 획득한다.<br/>
							&nbsp; &nbsp;- executeUserLoginCheck() 호출 후 에러 코드가 없는 경우에 사용<br/>
							<br/>
							&nbsp; Returns:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; true:로그인, false:로그아웃<br/>
							<br/>
						</span>
					</li>
					<li>
						<span class="tit color">String com.ubintis.api.ApiUserService.getResultData()</span>
						<br/>
						<span class="cont" style="border: 1px;">
							&nbsp; 로그인 여부가 false 일 경우 해당 정보를 획득한다.<br/>
							<br/>
							&nbsp; Returns:<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; 'none':유효하지 않은 토큰, 이 외값 : 중복로그인으로 접속 아이피<br/>
							<br/>
							<br/>
						</span>
					</li>
				</ul>
				<p><span class="tit">로그인 체크</span><span class="cont">&nbsp;&nbsp; 예제</span></p>
				<ul class="list-style">
					<li>
						<span class="tit color">토큰으로 현재 로그인 상태 체크</span>
						<br/>
						<span class="cont">
							&nbsp; String pni_token = StrUtil.NVL( session.getAttribute( "pni_token" ) );<br/>
							<br/>
							&nbsp; if( !"".equals( pni_token ) ) {<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; ApiUserService service = new ApiUserService();<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; String errorCode = service.executeUserLoginCheck( pni_token );<br/>
							<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; if( "".equals( errorcode ) ) {<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; boolean loginFlag = service.isLogin();<br/>
							<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if( !loginFlag ) {<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; String resultData = service.getResultData();<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br/>
							&nbsp; &nbsp; &nbsp; &nbsp; }<br/>
							&nbsp; }<br/>
							<br/>
						</span>
					</li>
					<li>
						<span class="tit color">예제 실행 결과</span>
						<br/>
						<span class="cont">
							&nbsp; [ Token ] <%=pni_token%><br/>
							&nbsp; [ ErrorCode ] <%=errorCode %><br/>
							&nbsp; [ LoginFlag ] <%=loginFlag%><br/>
							&nbsp; [ ResultData ] <%=resultData%><br/>
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
