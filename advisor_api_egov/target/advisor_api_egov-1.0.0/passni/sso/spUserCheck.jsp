<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.ubintis.api.ApiUserService" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.framework.config.AgentConfig" %>

<%
	String errorCode = "";
	String resultData = "";

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
	}
%>
<%=resultData%>