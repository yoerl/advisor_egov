<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String role_power = (String) session.getAttribute("role_power");
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <script>
    $(document).ready(function() {
    	
    	
    	
    	fnSearch(1);
    	
    });

    	
    function fnSearch(currentPage) {

		$.ajax({
			type: "GET", // HTTP 요청 방식 (GET, POST 등)
			url: "${path}/api/notices.do",
			/* dataType: "json", // 응답 데이터 형식 (JSON, XML 등) */
			data : {"currentPage" : currentPage},
			success: function(jsonString) {
				var jsonArray = JSON.parse(jsonString);
				// 요청 성공 시 실행될 함수
				
	
				var ulElement = document.querySelector(".board-list");
				ulElement.innerHTML = '';
				
				for (var i = 0; i < jsonArray.length; i++) {
					
					var item = jsonArray[i];
					var liElement = document.createElement("li");
		
					liElement.innerHTML += '' +
					"<a href=javascript:fnPageLoad('${path}/page/notice_view.do','notiSqno="+item.notiSqno+"');>"	 +
					
					
					'<p>' + item.notiTitlNm + '</p>' +
					'<span class="notice_date">'+item.rgsnDttmStr+'</span>' +
					'</a>' +
					'<div class="manager">' +
					'<span>'+item.rgsrNm+'</span>' +
					
					<%

					if( Integer.valueOf(role_power)>1)
					{

					%>
					
					'<a href="#" id="btn_del" data-noti_sqno='+item.notiSqno+' class="btn_del_con">삭제</a>' +
					
					<%
					
					}
					%>
					'</div>';
					
					ulElement.appendChild(liElement);
					
				}
				// 페이징 적용
				fnPaging(jsonArray[0].pagination);
			},
			error: function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});

	}

    </script>
<div class="right_title">
					<h2>
						공지사항</h2>
					
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
						<%

						if( Integer.valueOf(role_power)>1)
						{

						%>
						
						<div class="board_write_btn">
								<a href="javascript:fnPageLoad('${path}/page/notice_write.do','');">등록</a>		
						</div>

						<%
						
						}
						%>
									
						<ul class="board-list">
							 <li>
							</li>
						</ul>

						
					<!-- pagenation -->
						
					
					<div class="code-html pagenation" id="pageArea">
					</div>
				</div>
				
				<script>
				

				$(document).on("click", "#btn_del", function() {
					$('#del_alert_popup').css('display', 'block');
		    	});
				
				</script>

</body>
</html>