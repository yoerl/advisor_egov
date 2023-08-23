<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @JSP Name : view.jsp
 * @Description : 파일업로드 화면
 * @Modification Information
 * 
 *   수정일         수정자                   수정내용
 *  -------    --------    ---------------------------
 *  2011.06.07  이영진          최초 생성
 *
 * author 실행환경팀 
 * Copyright (C) 2011 by MOPAS  All right reserved.
 */
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">

<title>파일업로드 예제</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egov.css'/>">

<script type="text/javaScript" language="javascript" defer="defer">

function fn_egov_save() {	

	frm = document.uploadForm;
	inputImage = frm.image.value;
	
    frm.action = "<c:url value='/fileUpload.do'/>";
    frm.submit();
}

</script>
</head>
<body style="text-align: center; margin: 0 auto; display: inline; padding-top: 100px;">
	<div id="title" style="padding-top: 100px;">
		파일업로드 예제 (이미지 파일을 업로드 해주세요) <br />
		한글파일명을 사용하기위해서는 서버의 인코딩방식을 utf-8로 바꿔야합니다
	</div>

	<!-- 전체 레이어 시작 -->
	<div id="wrap">
		<!-- container 시작 -->
		<div id="container">

			<!-- content 시작 -->
			<div id="content_pop">
				<form:form name="uploadForm" method="post" enctype="multipart/form-data">
					<!-- 타이틀 -->
					<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;" summary="이미지 업로드 정보를 입력합니다.">
						<caption>파일 업로드 예제</caption>
						<tr>
							<td>
								<input type="file" name="image" size="60" title="file"/>
								<input type="button" name="btnSubmit" value="업로드"  onclick="fn_egov_save()" />
								
							</td>
						</tr>	
					</table>
					<c:if test="${fileName != null}">
						<img src="<c:url value='/imageSrc.do?physical=${fileName}'/>" alt="image"/>
					</c:if>	
					</form:form>
			</div>
		</div>
		<!-- //container 끝-->
	</div>
	<!--// 전체 레이어 끝 -->
</body>
</html>

