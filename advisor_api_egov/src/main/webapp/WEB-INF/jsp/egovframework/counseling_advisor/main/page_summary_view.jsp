<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%
// 맥락 파라미터 'userID' 값을 가져오기
String taServer = getServletContext().getInitParameter("taServer");
%>

				<div class="right_title">
					<h2>
						<a href="javascript:fnPageLoad('${path}/page/summary.do','');">
							<img src="../images/icons/arrow-left.png" alt="">
						</a><span id="text_title"></span></h2>
					
					<div class="btn_close">
						<a href="javascript:fnPageLoad('${path}/page/answer.do','');">
							<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
						</a>
					</div>
				</div>
				<div class="right_contents">
					<div class="view_con_inner">
						<div class="board_data"><p id="date_summary">2023.01.01 12:12</p></div>
						<div class="board_view_content">
							<p id="text_content">  </p>
						</div>
						<!-- button -->
						
						
						
					
					</div>
				</div>
				
				<script>
				
				
				
				

				  $.ajax({
				      type: "GET",
					  url: "${path}/api/ext-api/one/summary.do",
					  data : {"callId" : "<%= request.getParameter("callId")%>"},
				      success: function(jsonString) {

							var jsonArray = JSON.parse(jsonString);
							// 요청 성공 시 실행될 함수
				

							$("#date_summary").text(jsonArray[0].consSttTime);
							//$("#text_content").text(jsonArray[0].aiBrfCntn);
							$("#text_content").text(jsonArray[0].kmsMemoCntn);
							
							$("#text_title").text(jsonArray[0].userNm+"("+jsonArray[0].recpNo+")");
							
							//01012341234/상담사명(1234)
				
				      },
				      error: function(request, status, error) {
				          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				      }
				  });
			
				  
				  
				</script>