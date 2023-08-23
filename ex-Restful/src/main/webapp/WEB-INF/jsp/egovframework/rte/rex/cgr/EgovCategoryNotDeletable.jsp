<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @JSP Name : EgovCategoryNotDeletable.jsp
 * @Description : Category삭제 에러 화면
 * @Modification Information
 * 
 *   수정일         수정자                   수정내용
 *  -------    --------    ---------------------------
 *  2011.06.07  신혜연          최초 생성
 *
 * author 실행환경팀 
 * Copyright (C) 2011 by MOPAS  All right reserved.
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="ko">
<title>restful 예제 | 카테고리 삭제 오류</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/egov.css'/>"/>

<script type="text/javaScript" language="javascript" defer="defer">

</script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<!-- content 시작 -->
<div id="content_pop">
<spring:message code="cgr.msg.notDeletable" />
</div>
<!-- //content 끝-->
	</div>
	<!-- //container 끝-->
</body>
</html>
