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
		location.href = '<%=contextPath%>/passni/sample/main.jsp';
	}

</script>

</head>
<body onload="fnIndex()">

</body>
</html>
