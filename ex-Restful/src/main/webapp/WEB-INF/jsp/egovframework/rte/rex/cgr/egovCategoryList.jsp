<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @JSP Name : egovCategoryList.jsp
 * @Description : CategoryList 화면
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<title>restful 예제 | 카테고리 목록</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/egov.css'/>">

<script type="text/javaScript" language="javascript" defer="defer">

function fn_egov_addView() {
   	document.listForm.action = "<c:url value='/springrest/cgr/new.html'/>";
   	document.listForm.submit();		
}

/* 검색 function */
function fn_egov_selectList() {
	document.listForm.action = "<c:url value='/springrest/cgr.html'/>";
   	document.listForm.submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.listForm.action = "<c:url value='/springrest/cgr.html;'/>";
   	document.listForm.submit();
}

</script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
		
<!-- content 시작 -->
<div id="content_pop">
<form:form name="listForm" method="GET">
<%-- <form:form commandName="searchVO"  name="listForm" method="GET"> --%>
<input type="hidden" name="selectedId" />
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li><img src="<c:url value='/images/egovframework/rte/title_dot.gif'/>" alt=""/> <spring:message code="category.title" /></li>
		</ul>
	</div>
	<!-- // 타이틀 -->
	<!-- List -->
	<div id="table">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="카테고리를 확인 할 수 있습니다.	">
		<caption>카테고리 목록</caption>
			<colgroup>
				<col width="10" >				
				<col width="100" >				
				<col width="50">
				<col width="100">
			</colgroup>		  
			<thead>
			<tr>
				<th align="center"><spring:message code="cgr.header.no" /></th>
				<th align="center"><spring:message code="cgr.header.code" /></th>
				<th align="center"><spring:message code="cgr.header.nm" /></th>
				<th align="center"><spring:message code="cgr.header.dc" /></th>
			</tr>
			</thead>
			<c:forEach var="category" items="${categoryList}" varStatus="status">
			<tr>
				<td align="center" class="listtd"><c:out value="${status.count}"/></td>
				<td align="center" class="listtd">
						<spring:url value="/springrest/cgr/{id}.html" var="categoryUrl" htmlEscape="true">
							<spring:param name="id" value="${category.ctgryId}" />
						</spring:url>
						<a class="linkClass" href="${categoryUrl}"><c:out value="${category.ctgryId}"/></a></td>
				<td align="left" class="listtd"><c:out value="${category.ctgryNm}"/></td>
				<td align="center" class="listtd"><c:out value="${category.dc}"/></td>
			</tr>
			</c:forEach>
		</table>
	</div>
		<div id="sysbtn">
			<ul>
				<li><span class="btn_blue_l" title="<spring:message code="button.add" />"><a href="#link" onClick="fn_egov_addView(); return false;"><spring:message code="button.add" /></a><img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left:6px;" alt="등록"/></span>
				</li>
				<spring:url value="/springrest/cgr.json" var="jsonUrl" htmlEscape="true" />
				<li><span class="btn_blue_l" title="<spring:message code="button.json" />"><a href="${jsonUrl}"><spring:message code="button.json" /></a><img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left:6px;" alt="<spring:message code="button.json" />"/></span></li>
				<li><input type="submit" style="display:none" title="submit"/></li>
			</ul>
		</div>
</form:form>
</div>
<!-- //content 끝-->
</body>
</html>
