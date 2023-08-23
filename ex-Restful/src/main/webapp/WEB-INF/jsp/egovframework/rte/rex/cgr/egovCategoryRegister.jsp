<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @JSP Name : egovCategoryRegister.jsp
 * @Description : 카테고리 등록,수정 화면
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<c:set var="registerFlag" value="${empty categoryVO.ctgryId ? '등록' : '수정'}"/>
<title>restful 예제 | 카테고리 <c:out value="${registerFlag}"/> </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/egov.css'/>">

<!--For Commons Validator Client Side-->
<%-- <script type="text/javascript" src="<c:url value='/com/validator.do'/>"></script> --%>
<%-- <validator:javascript formName="categoryVO" staticJavascript="false" xhtml="true" cdata="false"/> --%>

<script type="text/javaScript" language="javascript" defer="defer">

function fncSubmit(method) {
		if(method != 'post') {
			document.detailForm._method.value=method;
			
			if(method == 'delete') {
				if(!confirm("<spring:message code="msg.del" />")) {
					return;
				}
			}
			if(method == 'put') {
				if(!confirm("<spring:message code="msg.update" />")) {
					return;
				}
			}
		}
		<c:if test="${empty categoryVO.ctgryId}">
			if(!confirm("<spring:message code="msg.insert" />")) {
				return;
			}
			document.detailForm.action = "<c:url value='/springrest/cgr.html'/>";
		</c:if>
		
		document.detailForm.submit();
}

function fn_egov_selectList(method){
	document.detailForm._method.value=method;
	document.detailForm.action = "<c:url value='/springrest/cgr.html'/>";
	document.detailForm.submit();
}
		
</script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<!-- content 시작 -->
<div id="content_pop">
<form:form commandName="categoryVO" name="detailForm">
	<input type="hidden" name="_method" />
		<c:if test="${not empty categoryVO.ctgryId}">
			<form:hidden name="ctgryId" path="ctgryId"/>
		</c:if>
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li><img src="<c:url value='/images/egovframework/rte/title_dot.gif'/>" alt="" /><spring:message code="category" /> <c:out value="${registerFlag}"/></li>
		</ul>
	</div>
	<!-- // 타이틀 -->
	<div id="table">
	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;"  summary="카테고리를 등록하거나 수정할 수 있습니다.">
		<caption>카테고리 등록 및 수정</caption>
		<colgroup>
			<col width="150" >
			<col width="" >
		</colgroup>
		<tr>
			<td class="tbtd_caption"><spring:message code="cgr.header.nm" /></td>
			<td class="tbtd_content">
				<form:input path="ctgryNm" maxlength="30" cssClass="txt" style="width:95%;" title="카테고리 명"/>
				&nbsp;<form:errors path="ctgryNm" />
			</td>
		</tr>
		<tr>
			<td class="tbtd_caption"><spring:message code="cgr.header.dc" /></td>
			<td class="tbtd_content">
				<form:textarea path="dc" rows="5" cols="58" />
					&nbsp;<form:errors path="dc" /></td>
		</tr>
	</table>
  </div>
	<div id="sysbtn">
		<ul>
			<li><span class="btn_blue_l" title="목록"><a href="#link" onClick="fn_egov_selectList('get'); return false;">목록</a><img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left:6px;" alt="목록"/></span></li>
			<c:if test="${empty categoryVO.ctgryId}">
				<li><span class="btn_blue_l" title="<c:out value='${registerFlag}'/>"><a  href="#link" onClick="fncSubmit('post'); return false;"><c:out value='${registerFlag}'/></a><img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left:6px;" alt="<c:out value='${registerFlag}'/>"/></span></li>
				<li><span class="btn_blue_l" title="<spring:message code="button.reset" />"><a href="#link" onClick="document.detailForm.reset(); return false;"><spring:message code="button.reset" /></a><img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left:6px;" alt="<spring:message code="button.reset" />"/></span></li>
			</c:if>
			<c:if test="${not empty categoryVO.ctgryId}">
				<li><span class="btn_blue_l" title="<c:out value='${registerFlag}'/>"><a href="#link" onClick="fncSubmit('put'); return false;"><c:out value='${registerFlag}'/></a><img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left:6px;" alt="<c:out value='${registerFlag}'/>"/></span></li>
				<li><span class="btn_blue_l" title="<spring:message code="button.delete" />"><a href="#link" onClick="fncSubmit('delete'); return false;"><spring:message code="button.delete" /></a><img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left:6px;" alt="<spring:message code="button.delete" />"/></span></li>
				<li><span class="btn_blue_l" title="<spring:message code="button.reset" />"><a href="#link" onClick="javascript:document.detailForm.reset(); return false;"><spring:message code="button.reset" /></a><img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left:6px;" alt="<spring:message code="button.reset" />"/></span></li>
				<spring:url value="/springrest/cgr/{id}.xml" var="xmlUrl" htmlEscape="true" >
					<spring:param name="id" value="${categoryVO.ctgryId}" />
				</spring:url>
				<li><span class="btn_blue_l" title="<spring:message code="button.xml" />"><a href="${xmlUrl}"><spring:message code="button.xml" /></a><img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left:6px;" alt="xml"/></span></li>
				<spring:url value="/springrest/cgr/{id}.json" var="jsonUrl" htmlEscape="true" >
					<spring:param name="id" value="${categoryVO.ctgryId}" />
				</spring:url>
				<li><span class="btn_blue_l" title="<spring:message code="button.defalutJson" />"><a href="${jsonUrl}"><spring:message code="button.defalutJson" /></a><img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left:6px;" alt="json"/></span></li>
			</c:if>
			<li><input type="submit" style="display:none" title="submit"/></li>
		</ul>
	</div>
</form:form>
</div>

<!-- //content 끝-->
</body>
</html>

