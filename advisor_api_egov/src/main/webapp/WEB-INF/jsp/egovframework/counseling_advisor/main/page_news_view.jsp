<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <script>
    
	$(document).ready(function() {
	    // AJAX 요청 보내기
	    $.ajax({
	        type: "GET",
	        url: "${path}/api/news/<%= request.getParameter("newsSqno")%>.do",
	        success: function(jsonString) {
	            // 요청 성공 시 응답을 처리하는 함수 호출
	            
		        var jsonArray = JSON.parse(jsonString);
				
		        $("#newsTitlNm").html(jsonArray.newsTitlNm); // 알림 제목
		        $("#board_view_inner").html(jsonArray.newsCntn); // 알림 내용
		        $("#regInfo").text(jsonArray.rgsnDttm); // 작성자 명 | 작성
		        
	        },
	        error: function(request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	    
	    
	});
    
    
    </script>

				<div class="right_title">
					<h2>
						<a href="javascript:fnPageLoad('${path}/page/news.do','');">
							<img src="../images/icons/arrow-left.png" alt="">
						</a><span id="newsTitlNm"></span></h2>
					
					<div class="btn_close">
						<a href="${path}/page/home.do">
							<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
						</a>
					</div>
				</div>
				<div class="right_contents">
					<div class="view_con_inner">
						<div class="board_data"><p id="regInfo">작성자명&nbsp; | &nbsp;2023.01.01 12:12</p></div>
						<div class="news_view_content">
							<div id="board_view_inner" class="board_view_inner">
								<p></p>
							</div>
						</div>
						<!-- button -->
						<!-- button -->
					
					</div>
				</div>