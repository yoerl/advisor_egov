<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.ubintis.api.ApiUserService" %>
<%@ page import="com.ubintis.api.ApiPolicyService" %>

<%@ page import="com.ubintis.common.util.AddressUtil" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.framework.bean.AgentBean" %>
<%@ page import="com.ubintis.framework.config.AgentConfig" %>

<%

	String errorCode = "";
	String errorUrl = "";
	
	AgentBean agentBean = AgentConfig.getInstance().getAgentBean();
	String contextPath = "";
	if( agentBean != null ) {
		contextPath = request.getContextPath();
		errorUrl = request.getContextPath() + "/" + StrUtil.NVL( agentBean.getAgent_error_url() );
	}

	// SSO 연동 시 파라미터에서 인증 토큰 획득
	String pni_token = StrUtil.NVL( request.getParameter( "pni_token" ) );
	
	if( "".equals( pni_token ) ) {
		// 통합 로그인 시 세션에서 인증 토큰 획득
		pni_token = StrUtil.NVL( session.getAttribute( "pni_token" ) );
	}

	if( !"".equals( pni_token ) ) {
		// 사용자 IP 획득
		String local_ip = AddressUtil.getClientIp( request );
		
		// API를 이용하여 인증 토큰으로 사용자 정보 조회
		ApiUserService service = new ApiUserService();
		errorCode = service.executeUserData( pni_token, local_ip );
		
		if( "".equals( errorCode ) ) {
			String userData = service.getUserData();
			
			if( userData != null && !"".equals( userData ) ) {
				session.setAttribute( "user_data", userData );
				session.setAttribute( "pni_token", pni_token );
				
				// API를 이용하여 로그인 정책 정보 조회
				ApiPolicyService policyService = new ApiPolicyService();
				
				errorCode = policyService.executeLoginPolicy();
				if( "".equals( errorCode ) ) {
					String loginPolicy = policyService.getLoginPolicy();
					
					if( loginPolicy != null && !"".equals( loginPolicy ) ) {
						session.setAttribute( "login_policy", loginPolicy );
					}
				}
				
			} else {
				session.setAttribute( "pni_token", "" );
				session.removeAttribute( "pni_token" );
			}
			
		} else {
			session.setAttribute( "pni_token", "" );
			session.removeAttribute( "pni_token" );
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

<script type="text/javascript">

    function fSSOInitialize() {
    	var err_code = '<%=errorCode%>';
    	
    	if( err_code == '' ) {
    		// 로그인 처리 완료 시 메인화면으로 리턴
    		//location.href = 'main.jsp';
    		location.href = '<%= contextPath %>/api/page/login.do';
    	
    	} else if( err_code == 'EOP001' ) {
    		alert( '해당 시스템에 대한 접속 권한이 없습니다.\n\n관리자에게 문의하시기 바랍니다.' );
    		//location.href = 'main.jsp';
    		
    	} else {
    		location.href = '<%=errorUrl%>' + '?errorCode=' + err_code;
    	}
    }

</script>

</head>
<body onload="fSSOInitialize();">

</body>
</html>
