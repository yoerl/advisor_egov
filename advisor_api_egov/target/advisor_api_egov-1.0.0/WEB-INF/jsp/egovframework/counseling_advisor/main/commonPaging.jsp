<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>농촌진흥청</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/font.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/pagenation.css'/>"/>
<script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
<body>
	<c:if test="${pagination != null && pagination.totalRecordCount != 0}">
		<div class="code-html pagenation">
			<div id="pagingDiv" class="tui-pagination">
				<c:if test="${pagination.prevBlock != 1}">
					<a href="javascript:fnSearch('1');" class="tui-page-btn tui-first">
						<span class="tui-ico-first">first</span>
					</a> 
					<a href="javascript:fnSearch('<c:out value='${pagination.prevBlock}'/>');" class="tui-page-btn tui-prev"> 
						<span class="tui-ico-prev">prev</span>
					</a> 
				</c:if>
				<c:forEach var="item" begin="${pagination.firstPage}" end="${pagination.lastPage}" >
					<a href="javascript:fnSearch('<c:out value='${item}'/>');" class="tui-page-btn <c:if test='${item == pagination.currentPage}'>tui-is-selected</c:if>" >${item}</a>
				</c:forEach>
				<c:if test="${pagination.lastPage < pagination.totalPageCount}">
					<a href="javascript:fnSearch('<c:out value='${pagination.nextBlock}'/>');" class="tui-page-btn tui-next"> 
						<span class="tui-ico-next">next</span>
					</a>
						<a href="javascript:fnSearch('<c:out value='${pagination.totalPageCount}' />');" class="tui-page-btn tui-last">
						<span class="tui-ico-last">last</span>
					</a>
				</c:if>
			</div>
		</div>
	</c:if>
</body>
</html>