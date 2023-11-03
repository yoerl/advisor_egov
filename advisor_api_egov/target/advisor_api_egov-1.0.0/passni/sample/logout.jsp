<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	// 세션 정보 삭제
	session.invalidate();

	String contextPath = request.getContextPath();
	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=900" />
<title>Pass-Ni SSO Sample Page</title>

<script type="text/javascript">

	function fnIndex() {
		//location.href = 'http://192.168.90.87:8080/advisor_api_egov/SSOService.do';
		location.href = '/advisor_api_egov/SSOService.do';
	}

</script>

</head>
<body onload="fnIndex()">
</body>
</html>
