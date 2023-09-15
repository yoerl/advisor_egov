<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ page import="com.ubintis.api.ApiUserService" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.common.util.AddressUtil" %>


<%
//http://localhost:8080/advisor_api_egov/api/auth/login.do
String errorCode = "";
String resultData = "";

String pni_token = StrUtil.NVL( request.getParameter( "pni_token" ) );
String local_ip = "";
String userData = "";
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
		//userData = "{\"user_id\":\"ID9999\",\"user_nm\":\"사용자1\",\"user_mbtlnum\":null,\"user_email\":\"ID9999@korea.kr\",\"user_data\":\"\"}";
		
		System.out.println( ">>>>>>>>>>debug... 11 :: " + userData );
		%>
		<jsp:forward page="/page/home.do"/>	
		<%
		
		
	}
	else
	{	
		//http://192.168.90.87:8080/advisor_api_egov/SSOService.do
			
		%>
		<jsp:forward page="/SSOService.do"/>	
		<%
		
	}
}


/* 
String pni_token = StrUtil.NVL( session.getAttribute( "pni_token" ) );

	if( !"".equals( pni_token ) ) {
		ApiUserService service = new ApiUserService();
		errorCode = service.executeUserLoginCheck( pni_token );
	if( "".equals( errorCode ) ) {
		boolean loginFlag = service.isLogin();
	if( !loginFlag ) {
		resultData = service.getResultData();
	}
}
} */
%>

<p>1111</p>
<p><%=pni_token %></p>
<p><%=userData %></p>
<p>22222</p>

