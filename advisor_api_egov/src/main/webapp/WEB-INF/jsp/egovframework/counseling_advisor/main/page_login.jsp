<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.PropertyConfigurator" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="org.apache.log4j.Logger" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ page import="com.ubintis.api.ApiUserService" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.common.util.AddressUtil" %>
<%@ page import="com.fasterxml.jackson.databind.JsonNode" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="egovframework.counseling.user.service.UserService" %>
<%@ page import="egovframework.counseling.user.service.impl.UserServiceImpl" %>
<%@ page import="egovframework.counseling.user.service.impl.UserInfoVO" %>
<%@ page import="egovframework.counseling.user.service.impl.UserInfoVO" %>
<%@ page import="java.util.List" %>

<% 
Logger logger = Logger.getLogger(getClass());
String log4jConfigFile = getServletContext().getRealPath("/WEB-INF/log4j.xml");
PropertyConfigurator.configure(log4jConfigFile);
%>

			
<%

String errorCode = "";
String resultData = "";

String pni_token = StrUtil.NVL( request.getParameter( "pni_token" ) );


String local_ip = "";
String userData = "";

String user_id = "";
String user_nm = "";
int i = 0;



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
	
	request.setAttribute("pni_token", pni_token);

	
	if( "".equals( errorCode ) ) {
		userData = service.getUserData();
		//userData = "{\"user_id\":\"ID9999\",\"user_nm\":\"사용자1\",\"user_mbtlnum\":null,\"user_email\":\"ID9999@korea.kr\",\"user_data\":\"\"}";
		logger.debug("유저 아이디 :: " + userData );
		
		request.setAttribute("userData", userData);
        // Jackson ObjectMapper를 사용하여 JSON 파싱
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(userData);

        // "user_id" 필드의 값을 가져옴
        user_id = jsonNode.get("user_id").asText();
        session.setAttribute("user_id", user_id);

        user_nm = jsonNode.get("user_nm").asText();
        session.setAttribute("user_nm", user_nm);
		
        String redirectURL = request.getContextPath() + "/page/home.do";
		// HttpServletResponse를 사용하여 리다이렉트 수행
		response.sendRedirect(redirectURL);
		
	}
	else
	{
		String redirectURL = request.getContextPath() + "/SSOService.do?pname=spLogout";
		response.sendRedirect(redirectURL);

	}
	


}else{

	String redirectURL = request.getContextPath() + "/SSOService.do?pname=spLogout";
	response.sendRedirect(redirectURL);
}


%>

