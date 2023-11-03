<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <script>
    
        $(document).ready(  function() {
			  
	    		/* document.getElementById("font_rd2").checked = true;
	    		document.getElementById("font_rd4").checked = true;
	    		document.getElementById("font_rd6").checked = true;
	    		document.getElementById("font_rd8").checked = true;
	    		document.getElementById("font_rd10").checked = true;
	    		document.getElementById("font_rd12").checked = true;
	    		document.getElementById("font_rd14").checked = true;
	    		document.getElementById("font_rd16").checked = true; */
	    		

            // AJAX DELETE 요청 보내기
            $.ajax({
            	///api/common/data.do
                //url: "${path}/api/common/agency.do", // 엔드포인트 URL
                
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
                    

                },
                error: function(xhr, status, error) {
                    // 요청 실패 시 실행할 코드
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
	    		
	    		
            $("#agentSelect").change(function() {
                var selectedAgent = $(this).val(); // 선택된 값 가져오기

                // 선택된 에이전트에 따라 다른 로직 수행 가능
                // 적절한 URL 및 AJAX 요청 등을 여기에 추가

                // 예: 선택된 에이전트 출력
                
                
                $.ajax({
                    url: "${path}/api/common/data/roleList.do",
                    type: "GET",
                    success: function(response) {

                        var jsonArray = JSON.parse(response);

                        var targetElement = document.querySelector(".group_menu ul");
                        targetElement.innerHTML = ''; // ul 요소 초기화

                        for (var i = 0; i < jsonArray.length; i++) {
                        	
                            var item = jsonArray[i];
                            

                            
                            var element = document.createElement("li");

                            element.innerHTML += '<a href="#" onclick="setActive(' + i + ')">' + item.comnCdValNm + '</a>';

                            targetElement.appendChild(element);
                        }
                        
                        
                        $("#group_autho_list").css("display", "block");

                        
                    },
                    error: function(xhr, status, error) {
                        // 요청 실패 시 실행할 코드
                        alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
                    }
                });
                
                
            });
            
            

    		
            
            
	    		
	
        });
		    
    </script>
    

				<div class="right_title">
					<h2>
						권한설정
					</h2>
						<div class="btn_close"><span><a href="javascript:fnPageLoad('${path}/page/answer.do','');"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
						<div class="setting_keyword">
						
							<select name="" onchange="fnPageLoad(value,'');">
									<option id="" value="${path}/page/authority.do" selected>선택</option>
									<option id="" value="${path}/page/authority_group.do">그룹권한</option>
									<option id="" value="${path}/page/authority_setting.do" >그룹 참여자 설정</option>
							</select>
							
							
						</div>	
						<p class="no-massage">메뉴를 선택해 주세요.</p>
				</div>
				</div>