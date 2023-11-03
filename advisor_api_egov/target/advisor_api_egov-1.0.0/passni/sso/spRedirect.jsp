<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Enumeration" %>

<%@ page import="com.ubintis.common.util.StrUtil" %>

<%
	String[] noParamKeys = { "actionUrl", "agt_id", "agt_url", "agt_r" };

	String actionUrl = StrUtil.NVL( request.getAttribute( "actionUrl" ) );
	HashMap dataMap = (HashMap) request.getAttribute( "dataMap" );
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title></title>

<script type="text/javascript">

function fSSOInitialize() {
	document.frmSSO.submit();
}

</script>

</head>
<body onload="fSSOInitialize();">

<form id="frmSSO" name="frmSSO" method="post" action="<%=actionUrl %>">
	
	<%
		if( dataMap != null ) {
			for( Object objkey : dataMap.keySet() ){
				String key = StrUtil.NVL( objkey );
				String value = StrUtil.NVL( dataMap.get( key ) );
	        
	%>
				<input type="hidden" id="<%=key%>" name="<%=key%>" value="<%=value%>" />
	<%
			}
		}
	%>
	
	<%
		Enumeration enuParam = request.getParameterNames();
		if( enuParam != null ) {
			while ( enuParam.hasMoreElements() ) {
				boolean keyFlag = false;
				
				String key = StrUtil.NVL( enuParam.nextElement() );
		    	String value = StrUtil.NVL( request.getParameter( key ) );
		    	
		    	for( String noParamKey : noParamKeys ) {
					if( noParamKey.equals( key ) ) {
						keyFlag = true;
						break;
					}
				}
				
				if( !keyFlag ) {
	%>
				<input type="hidden" id="<%=key%>" name="<%=key%>" value="<%=value%>" />
	<%
		    	}
	    	}
		}
	%>
	
</form>

</body>
</html>
