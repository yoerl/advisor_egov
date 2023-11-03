<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>

<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.common.util.JsonParse" %>
<%@ page import="com.ubintis.framework.bean.AgentBean" %>
<%@ page import="com.ubintis.framework.config.AgentConfig" %>

<%@ page import="com.ubintis.api.ApiAgentService" %>

<%
	String contextPath = request.getContextPath();

	String actionUrl = contextPath + "/SSOService.do";
	String logoutUrl = contextPath + "/SSOService.do?pname=spLogout";
	
	String pni_token = StrUtil.NVL( session.getAttribute( "pni_token" ) );
	String user_data = StrUtil.NVL( session.getAttribute( "user_data" ) );
	String login_policy = StrUtil.NVL( session.getAttribute( "login_policy" ) );
	
	String agt_id = "";
	String agt_domain = "";
	String svr_cs_url = "";
	
	AgentBean agentBean = AgentConfig.getInstance().getAgentBean();
	
	if( agentBean != null ) {
		agt_id = agentBean.getAgent_id();
		agt_domain = agentBean.getAgent_domain();
		svr_cs_url = agentBean.getServer_url() + "/usr/client/login";
	}
	
	String errorCode = "";
	
	List<HashMap<String, Object>> agentList = null;

	ApiAgentService agentService = new ApiAgentService();
	errorCode = agentService.listAll();
	
	if( "".equals( errorCode ) ) {
		String strAgentList = StrUtil.NVL( agentService.getList() );
		
		if( !"".equals( strAgentList ) && !"none".equals( strAgentList ) ) {
			agentList = JsonParse.parseList( strAgentList );
		}
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
<link rel="stylesheet" type="text/css" href="css/style.css" />

<script type="text/javascript" src="js/countdown.js"></script>
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="js/passninx-client-4.0.js"></script>

<script type="text/javascript">

	var token = '<%=pni_token%>';
	
	$(document).ready(function(){
		
 		if( token != '' ) {
 			
 			var policy = '<%=login_policy%>';
 	 		if( policy != '' && policy != 'none' ) {
 	 			var objPolicy = JSON.parse( policy );
 	 			
 	 			var atmc_logout_yn = objPolicy.atmc_logout_yn;
 	 			var atmc_logout_time = objPolicy.atmc_logout_time;
 	 			var login_dup_yn = objPolicy.login_dup_yn;
 	 			
 	 			if( atmc_logout_yn == 'Y' ) {
 	 				fnAutoLogout( atmc_logout_time );
 	 			}

 	 			if( login_dup_yn == 'Y' ) {
 	 				fnLoginDupCheck();
 	 			}
 	 		}
 		}
	});

 	function fnAutoLogout( atmc_logout_time ) {
		$('#autologout').show();
			
		Countdown.start(atmc_logout_time, function() {
			procLogout();
			alert( '일정시간(' + atmc_logout_time + '분)동안 이용이 없어 자동로그아웃 되었습니다.' );
			location.href = '<%=logoutUrl%>';
		}, 'countdown');
	}

	function fnLoginDupCheck() {

		$.ajax({
			url: '<%=contextPath%>/passni/sso/spUserCheck.jsp',
			type: 'post',
			data: '',
			dataType: 'text',
			async: false,
			success: function (responseData)
			{
				var data = responseData.trim();
				
				if( data != '' ) {
					procLogout();
					
					if( data == 'none' ) {
						alert( '로그아웃 되었습니다.' );
						
					} else {
						alert( '[' + data + '] IP에서 접속하여 로그아웃 되었습니다.' );
					}
					
					location.href = '<%=logoutUrl%>';
				}
			},
			error: function(xhr, error, thrown)
			{
				alert(xhr + '-' + error + '-' + thrown);
			}
		});
		
		return;
	}
	
	function procLogout() {
		$.ajax({
			url: '<%=contextPath%>/passni/sso/spLogoutLog.jsp',
			type: 'post',
			async: false
		});
	}
	
	function fnLogin() {
		
		$('form[name=loginForm]').attr('action', '<%=actionUrl%>').submit();
	}
	
	function fnLogout() {
		
		if( token != '' ) {
			if( confirm( '로그아웃 하시겠습니까?' ) ) {
				location.href = '<%=logoutUrl%>';
			}
		
		} else {
			alert( '로그인 이후 실행하여 주십시요.' );
		}
	}
	
	function fnSSO( url ) {
		
		if( token != '' ) {
			$('form[name=ssoForm]').attr('action', url).submit();
		
		} else {
			alert( '로그인 이후 실행하여 주십시요.' );
		}
	}
	
	function fnCSLogin( tar_agt_id, pni_token ) {
		
		executeClientSSO( tar_agt_id, pni_token, '<%=svr_cs_url%>' );
	}

	function fnUserInfo() {
		
		location.href = 'userInfo.jsp';
	}
	
	function fnLoginCheck() {
		
		location.href = 'loginCheck.jsp';
	}
	
	function fnPolicyInfo() {
		
		location.href = 'policyInfo.jsp';
	}
	
	function fnAgentList() {
		
		location.href = 'agentList.jsp';
	}
	
	function fnPwdChange() {
		
		if( token != '' ) {
			var width = 800;
			var height = 490;
			
			var popid = window.open('', 'pop_change_pwd', 'width=' + width + ', height=' + height);
			
			$('#pname').val( 'spLoginAfterSelfPage' );
			$('#link_type').val( 'pwChangePop' );
			
			$('form[name=selfPageForm]').attr('target', 'pop_change_pwd');
			$('form[name=selfPageForm]').attr('action', '<%=actionUrl%>').submit();

			if ( popid )
			{
				popid.focus();
			}
		
		} else {
			alert( '로그인 이후 실행하여 주십시요.' );
		}
	}
	
</script>

</head>
<body>

	<form name="loginForm" id="loginForm" method="post" action="">
		<input type="hidden" name="param1" value="param1_value" />	<!-- 추가 파라미터가 있을 경우 -->
		<input type="hidden" name="param2" value="param2_value" />	<!-- 추가 파라미터가 있을 경우 -->
	</form>
	
	<form name="ssoForm" id="ssoForm" target="_blank" method="post" action="">
		<input type="hidden" name="pni_token" value="<%=pni_token%>" />	<!-- 토큰 -->
	</form>
	
	<form name="selfPageForm" id="selfPageForm" method="post" action="">
		<input type="hidden" name="pname" id="pname" />
		<input type="hidden" name="link_type" id="link_type" />
	</form>

	<div class="wrap">
		<h1>&nbsp; &nbsp; &nbsp;Pass-Ni SSO Sample Page ( 메인화면 )</h1>
		
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
				<p><span class="tit">사용자 정보</span></p>
				<ul class="list-style">
					<li><span class="tit color">인증 토큰<br/></span><span class="cont"><%=pni_token %></span></li>
					<li><span class="tit color">사용자 정보<br/></span><span class="cont"><%=user_data %></span></li>
					<li id="autologout" style="display:none;"><span class="tit color">자동 로그아웃<br/></span><span class="cont" id="countdown"></span></li>
				</ul>
			</div>
		</div>
		
		<div class="block3">
		
		<%
			if( "".equals( pni_token ) || "".equals( user_data ) ) {
		%>
		
			<div class="title">
				<h2>링크 예제</h2>
				<p class="line"></p>
				<p class="cont">( 통합로그인, 로그인 정책 조회(API) )</p>
			</div>
			
			<div style="height:200px;">
			
				<ul class="icon-bt first-child">
					<li><a href="javascript:fnLogin();"><img src="img/bt-2.jpg" alt="통합 로그인" /></a></li>
					<li class="tit"><a href="javascript:fnLogin();">통합 로그인</a></li>
					<li class="cont">통합 로그인 화면</li>
				</ul>
				
				<ul class="icon-bt">
					<li><a href="javascript:fnPolicyInfo();"><img src="img/bt-2.jpg" alt="로그인 정책 조회" /></a></li>
					<li class="tit"><a href="javascript:fnPolicyInfo();">로그인 정책 조회</a></li>
					<li class="cont">로그인 정책 조회(API)</li>
				</ul>
				
			</div>
		
		<%
			} else {
		%>
		
			<div class="title">
				<h2>링크 예제</h2>
				<p class="line"></p>
				<p class="cont">( 통합 로그아웃, 사용자 정보 조회(API), 로그인 체크(API), 연동시스템 조회(API), 비밀번호 변경 )</p>
			</div>
			
			<div style="height:160px;">
			
				<ul class="icon-bt first-child">
					<li><a href="javascript:fnLogout();"><img src="img/bt-2.jpg" alt="통합 로그아웃" /></a></li>
					<li class="tit"><a href="javascript:fnLogout();">통합 로그아웃</a></li>
					<li class="cont">연동된 모든 시스템 로그아웃</li>
				</ul>
				
				<ul class="icon-bt">
					<li><a href="javascript:fnUserInfo();"><img src="img/bt-2.jpg" alt="사용자 정보 조회" /></a></li>
					<li class="tit"><a href="javascript:fnUserInfo();">사용자 정보 조회</a></li>
					<li class="cont">사용자 정보 조회(API)</li>
				</ul>
				
				<ul class="icon-bt">
					<li><a href="javascript:fnLoginCheck();"><img src="img/bt-2.jpg" alt="로그인 체크" /></a></li>
					<li class="tit"><a href="javascript:fnLoginCheck();">로그인 체크</a></li>
					<li class="cont">토튼 유효, 중복로그인 등 체크(API)</li>
				</ul>
				
				<ul class="icon-bt">
					<li><a href="javascript:fnAgentList();"><img src="img/bt-2.jpg" alt="연동시스템 조회" /></a></li>
					<li class="tit"><a href="javascript:fnAgentList();">연동시스템 조회</a></li>
					<li class="cont">연동시스템 조회(API)</li>
				</ul>
			
			</div>
			
			<div style="height:200px;">
				
				<ul class="icon-bt first-child">
					<li><a href="javascript:fnPwdChange();"><img src="img/bt-2.jpg" alt="비밀번호 변경" /></a></li>
					<li class="tit"><a href="javascript:fnPwdChange();">비밀번호 변경</a></li>
					<li class="cont">비밀번호 변경 화면</li>
				</ul>
				
			</div>
			
		<%
				if( agentList != null && !agentList.isEmpty() ) {
		%>
			
			<div class="title">
				<h2>연동시스템 링크</h2>
				<p class="line"></p>
			</div>
			
		<%
					for( HashMap<String, Object> hm : agentList ) {
						String agtId = StrUtil.NVL( hm.get( "agt_id" ) );
						String agtNm = StrUtil.NVL( hm.get( "agt_nm" ) );
						String agtTy = StrUtil.NVL( hm.get( "agt_ty" ) );
						String ssoUrl = StrUtil.NVL( hm.get( "sso_url" ) );
						
						if( "CS".equals( agtTy ) ) {
		%>
				<ul class="icon-bt">
					<li><a href="javascript:fnCSLogin( '<%=agtId%>', '<%=pni_token%>' );"><img src="img/bt-2.jpg" alt="SSO 연동" /></a></li>
					<li class="tit"><a href="javascript:fnCSLogin( '<%=agtId%>', '<%=pni_token%>' );"><%=agtNm%>(<%=agtId%>)</a></li>
					<li class="cont"><%=agtNm%>으로 SSO 연동<br/><br/><br/></li>
				</ul>
		<%
						} else {
		%>
				<ul class="icon-bt">
					<li><a href="javascript:fnSSO( '<%=ssoUrl%>' );"><img src="img/bt-2.jpg" alt="SSO 연동" /></a></li>
					<li class="tit"><a href="javascript:fnSSO( '<%=ssoUrl%>' );"><%=agtNm%>(<%=agtId%>)</a></li>
					<li class="cont"><%=agtNm%>으로 SSO 연동<br/><br/><br/></li>
				</ul>
		<%
						}
					}
				}
			}
		%>
		
		</div>
		
	</div>

</body>
</html>