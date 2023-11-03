<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
String intt_cd = (String) session.getAttribute("intt_cd");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

				<div class="right_title">
					<h2>
						모니터링</h2>	
						<div class="btn_close"><span><a href="/advisor_api_egov/page/home.do"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				
					
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
						<div class="monitor_head">
							<button id="refresh" class="refresh" onClick="fnPageLoad('${path}/page/monitoring.do','');">새로고침</button>
								<select name='agent'>
								</select>	
						</div>	
						<div class="monitor_content">
							<div class="counseller_monitoring">
								<ul>
									
								</ul>
							</div>

						</div>
					</div>
				</div>
<script> 


$(document).ready(  function() {
	

    function selectUsers(intt_cd){
	    $.ajax({
	        url: "${path}/api/users.do",
			data : {"inttCd" : intt_cd },
	        type: "GET",
	        success: function(response) {
	
	            var jsonArray = JSON.parse(response);
	            // 요청 성공 시 실행될 함수
	                        var targetElement = document.querySelector(".counseller_monitoring ul");
	                        targetElement.innerHTML = ''; // ul 요소 초기화
	
	                        var jsonArray = JSON.parse(response);
	                        for (var i = 0; i < jsonArray.length; i++) {
	                        	
	                            var item = jsonArray[i];
	
	                            
	                            var element = document.createElement("li");
	
	                            if(item.consStatCd==null||item.consStatCd=="wait")
	                            {
		                            element.innerHTML += ''+
		                            '<div class="monitor_couseller" data-user-id="'+item.userId+'"><a href="#">'+
		                            '<span class="counsel_ready">통화대기</span>'+
		                            '<p>상담사 '+item.userNm+'</p></a>'+
		                            '</div>';
	                            }
	                            else
	                            {
	                            	element.innerHTML += ''+
		                            '<div class="monitor_couseller" data-user-id="'+item.userId+'"><a href="#">'+
		                            '<span class="counsel_ing">통화중</span>'+
		                            '<p>상담사 '+item.userNm+'</p></a>'+
		                            '</div>';
	                            }
	                            
	                            targetElement.appendChild(element);
	                        }
	                        
	                    	
	
	                        $('.monitor_couseller').on('click', function() {
	                        	
	                            var userId = $(this).attr('data-user-id');
	                            //alert(userId);
	                            // 가져온 userId를 사용하여 URL을 생성하거나 다른 작업 수행
	                            var popupURL = "${path}/page/monitoring_popup.do?user_id=" + userId;
	                            var popupName = "팝업 이름";
	                            window.open(popupURL, "_blank", "width=1200, height=600");
	                            
	                        });
	                        
	            
	
	        },
	        error: function(xhr, status, error) {
	            // 두 번째 Ajax 요청의 요청 실패 시 실행할 코드
	            alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
	        }
	    });
	  
	  
    }
	  
    
	  
    $.ajax({
        url: "${path}/api/common/agency.do", // 엔드포인트 URL
        type: "GET", // HTTP DELETE 메서드 사용
        success: function(response) {
        	
            // JSON 데이터 파싱
            var agencies = JSON.parse(response);

            // select 요소 선택
            var selectElement = $("select[name='agent']");

            // 기관명 옵션 추가
            selectElement.append("<option value=''>기관을 선택하세요.</option>");
            // 각 기관 옵션 추가
            for (var i = 0; i < agencies.length; i++) {
                var agency = agencies[i];
                
                
                selectElement.append("<option value='" + agency.comnCdVal + "'>" + agency.comnCdValNm + "</option>");
                
            }
            
            $("select[name='agent'] option[value='<%=intt_cd%>']").prop("selected", true);
            selectUsers($("select[name='agent']").val());

        },
        error: function(xhr, status, error) {
            // 요청 실패 시 실행할 코드
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
		
	  

	
	
    $("select[name='agent']").on("change", function() {
    		selectUsers($("select[name='agent']").val());
	});

    
	  
	  
	  
	  
	  

	  
});





</script>