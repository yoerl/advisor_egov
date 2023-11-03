<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String role_power = (String) session.getAttribute("role_power");

/* 외부의 입력값에 대한 검증을 수행함 */
if (role_power != null) {
role_power = role_power.replaceAll("<", "&lt;");
role_power = role_power.replaceAll(">", "&gt;");
role_power = role_power.replaceAll("&", "&amp;");
role_power = role_power.replaceAll("\"", "&quot;");
} else {
return;
}
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	 <script>
	$(document).ready(function() {
		
	    // AJAX 요청 보내기
	    $.ajax({
	        type: "GET",
	        url: "${path}/api/notice/<%= request.getParameter("notiSqno")%>.do",
	        success: function(jsonString) {
	            // 요청 성공 시 응답을 처리하는 함수 호출
	            

		        var jsonArray = JSON.parse(jsonString);
		
		        // 공지사항 내용 출력
		        var area_noti_content = document.querySelector(".board_view_inner");
		        if (area_noti_content) {
		            area_noti_content.innerHTML = jsonArray[0].notiCntn;
		        } else {
		            console.error(".board_view_inner 요소를 찾을 수 없습니다.");
		        }
		
		        // 공지사항 제목 출력
		        var area_noti_title = document.querySelector(".area_noti_title");
		        if (area_noti_title) {
		            area_noti_title.innerHTML = jsonArray[0].notiTitlNm;
		        } else {
		            console.error(".area_noti_title 요소를 찾을 수 없습니다.");
		        }
	        },
	        error: function(request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	    
	    

	    $(document).on("click", "#btn_edit", function() {
	        // data-noti_sqno 속성에서 notiSqno 값을 가져옴
	        var notiSqno = $(this).data("noti_sqno");

	        // data-noti_sqno 속성에서 notiSqno 값을 가져옴
	        var notiSqno = $(this).data("noti_sqno");
	        
	        
	        
	        javascript:fnPageLoad('${path}/page/notice_modify.do',"notiSqno=" + notiSqno);
	        
	    });
	});
	</script>

				<div class="right_title">
					<h2>
						<a href="javascript:fnPageLoad('${path}/page/notice.do','');">
							<img src="../images/icons/arrow-left.png" alt="">
						</a><span class="area_noti_title"></span></h2>
					<div class="btn_close"><span><a href="javascript:fnPageLoad('${path}/page/answer.do','');"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				
				</div>
				
				
				<div class="right_contents">
					<div class="view_con_inner">
						<div class="news_view_content">
							<div class="board_view_inner">
								<p> 
								</p>
							</div>
						</div>
						<!-- button -->
						<div class="board_bottom_btn">
						<%

						if( Integer.valueOf(role_power)>1)
						{

						%>
						
						<button type="button" id="btn_edit" class="btn" data-noti_sqno="<%= request.getParameter("notiSqno")%>">수정</button>


						<%
						
						}
						%>
						
						
						
						
						<%-- ${path}/page/news_modify.do --%>
						</div>
						
						
					
					</div>
				</div>