<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ page import="com.ubintis.api.ApiUserService" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.common.util.AddressUtil" %>
<%@ page import="com.fasterxml.jackson.databind.JsonNode" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String user_id = (String) session.getAttribute("user_id");

%>

<script>

$(document).ready(function() {
	$.ajax({
	    url: "${path}/api/common/data/roleList.do",
	    type: "GET",
	    success: function(response) {

	        // JSON 데이터 파싱
	        var agencies = JSON.parse(response);

	        // select 요소 선택
	        var selectElement = $("select[name='role']");

	        // 기관명 옵션 추가
	        selectElement.append("<option value=''>그룹명</option>");
	        // 각 기관 옵션 추가
	        for (var i = 0; i < agencies.length; i++) {
	            var agency = agencies[i];
	            selectElement.append("<option value='" + agency.comnCdVal + "'>" + agency.comnCdValNm + "</option>");
	        }

	        // 첫 번째 Ajax 요청이 완료된 후에 두 번째 Ajax 요청 실행
	        $.ajax({
	            url: "${path}/api/user/<%=user_id%>.do",
	            type: "GET",
	            success: function(response) {

	                // 서버 응답을 JSON 파싱
	                var jsonResponse = JSON.parse(response);

	                var userId = jsonResponse[0].userId;
	                var userNm = jsonResponse[0].userNm;
	                var extnNo = jsonResponse[0].extnNo;
	                var userDivCd = jsonResponse[0].userDivCd;

	                // 추출한 값을 출력하거나 다른 용도로 사용할 수 있음

	                $("#userId").val(userId);
	                $("#userNm").val(userNm);
	                $("#extnNo").val(extnNo);
	                $("#role").val(userDivCd);
	            },
	            error: function(xhr, status, error) {
	                // 두 번째 Ajax 요청의 요청 실패 시 실행할 코드
	                alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
	            }
	        });

	    },
	    error: function(xhr, status, error) {
	        // 첫 번째 Ajax 요청의 요청 실패 시 실행할 코드
	        alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
	    }
	});

	   
	   
});


</script>

<script> 
/* 	$(document).ready(function(){ 
		$("#req_btn").click(function(){ 
		
	}); 
	$(".author_alert_btn a.bnt_cancle").click(function(){ 
		$("#req_alert_popup").css("display", "none"); 
	}); 
	}); 
	 */
	

	   
    function permissionReq() {
    	
    
        
        var jsonData = {
        		userId: $("#userId").val(),         // 문자열 데이터
        		athrTypeCd: $("#role").val(),         // 문자열 데이터
        		userNm: $("#userNm").val(),         // 문자열 데이터
    			extnNo: $("#extnNo").val(),       // 문자열 데이터
    			
        
        };
        
 	   $.ajax({
 	           url: "${path}/api/<%=user_id%>/permission/req/"+$("#role").val()+".do",
 	                    type: "POST",
 		                data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
 		                contentType: "application/json", // 요청 본문의 데이터 타입 설정
 	   	       
 	                    success: function(response) {
 	                    	
 	                    	if(response=="true")
 	                    	{
 	                    		$("#chg_group_popup").css("display", "block");
 	 	            
 	                    		
 	                    	}
 	                    	else
 	                    	{
 	 	                    	alert("요청이 실패하였습니다.");
 	 	       
 	                    		
 	                    	}
 	                        
 	                    },
 	                    error: function(xhr, status, error) {
 	                        // 요청 실패 시 실행할 코드
 	                        alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
 	                    }
 	                });
 	   
        // 만약 원래 링크의 동작을 중지하고 싶다면 (예: 페이지 이동을 방지)
       
    }
</script>


				<div class="right_title">
					<h2>설정</h2>
					
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
						<div class="setting_keyword">
								<select name="" onchange="fnPageLoad(value,'');">
									<option id="" value="${path}/page/setting.do">선택</option>
										<option id="" value="${path}/page/setting_system.do">시스템 정보</option>
										<option id="" value="${path}/page/setting_font.do">폰트종류</option>
										<option id="" value="${path}/page/setting_size.do">폰트크기</option>
										<option id="" value="${path}/page/setting_my.do" selected>마이페이지</option>
								</select>
						</div>	
					
						
						<div class="setting_content">
							<div class="my_choice">
								<ul>
									<li><label for="">사용자 ID</label><input id="userId" type="text" size="20" maxlength="30" name="" value="" readonly></li>
									<li><label for="">사용자 이름</label><input id="userNm" type="text" size="20" maxlength="30" name="" value="" readonly></li>
									<li><label for="">내선번호</label><input id="extnNo"type="text" size="20" maxlength="30" name="" value="" readonly></li>
									<li>
									<label for="">소속그룹</label>
										<select id="role" name='role'>
										</select>
									</li>
									<li>
									

									</li>
								</ul>
							</div>
							<div style="display:flex;direction: rtl;">
								<div id="req_btn" class="setting_btn" style="width:130px; height:50px;">
									<a href="#">권한 신청</a>
								</div>
							</div>

						</div>
							
						
				</div>
			</div>
			
<script>
$("#req_btn").click(function() {
    // 여기에 클릭했을 때 실행할 동작을 추가합니다.
    alert("권한 신청 버튼이 클릭되었습니다!");
    permissionReq();
    //$("#req_alert_popup").show();
    //$("#req_alert_popup").hide();
    
    
    // 다른 동작을 추가하려면 이곳에 코드를 작성합니다.
});


</script>

