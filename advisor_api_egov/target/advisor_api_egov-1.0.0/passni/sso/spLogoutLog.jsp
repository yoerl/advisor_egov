<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.ubintis.api.ApiLogService" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>

<%
	String pni_token = StrUtil.NVL( session.getAttribute( "pni_token" ) );

	if( !"".equals( pni_token ) ) {
		ApiLogService service = new ApiLogService();
		service.logoutLog( pni_token );
	}
%>