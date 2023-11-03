<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- right -->
	<div class="right_title">
		<h2>설정</h2>
			<div class="btn_close"><span><a href="javascript:fnPageLoad('${path}/page/answer.do','');"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
					
	</div>
	<div class="right_contents">
		<div class="notice_con_inner">
			<div class="setting_keyword">
					<select name="" onchange="fnPageLoad(value,'');">
							<option id="" value="${path}/page/setting.do" selected>선택</option>
							<option id="" value="${path}/page/setting_system.do">시스템 정보</option>
							<option id="" value="${path}/page/setting_font.do">폰트종류</option>
							<option id="" value="${path}/page/setting_size.do">폰트크기</option>
							<option id="" value="${path}/page/setting_my.do">마이페이지</option>
					</select>
			</div>	
			<p class="no-massage">메뉴를 선택해 주세요.</p>
		</div>
	</div>
<!-- right -->
