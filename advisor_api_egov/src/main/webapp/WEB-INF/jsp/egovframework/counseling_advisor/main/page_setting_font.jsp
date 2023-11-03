<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String user_id = (String) session.getAttribute("user_id");

%>

<script>

$(document).ready(  function() {
	
    $("#btn_save").click(function () {
        // 이곳에 클릭했을 때 실행할 코드를 작성합니다.
        //alert("버튼이 클릭되었습니다."); // 예시: 경고창을 띄움

        var jsonData = {
        		envrStupDivCd: 'font',          // 문자열 데이터
        		userId: '<%=user_id%>',          // 문자열 데이터
        		envrStupVl: $("input[name='font_family']:checked").val(),
        };

        $.ajax({
            url: "${path}/api/setting/font.do",  // 서버의 API 엔드포인트 URL
            type: "POST",              // HTTP 메서드 (POST, GET 등)
            async: false,                // 동기적 요청 활성화
            data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
            contentType: "application/json", // 요청 본문의 데이터 타입 설정
            success: function(response) {
                // 요청 성공 시 실행할 코드
                // JSON 데이터 파싱
                responseData = JSON.parse(response);
                $('#chg_font_popup').css('display', 'block');
         
            },
            error: function(xhr, status, error) {
                // 요청 실패 시 실행할 코드
                console.error("AJAX 오류: " + error);
            }
        });

    	fnChangeFont();

        
    });
    
	  
	// 첫 번째 AJAX 요청
	$.ajax({
	    url: "${path}/api/common/data/FontList.do", // 첫 번째 엔드포인트 URL
	    type: "GET", // HTTP GET 메서드 사용
	    success: function(response) {
	    	
	        var jsonArray = JSON.parse(response);
	        var newItemHTML = '';
	        for (var i = 0; i < jsonArray.length; i++) {
	            var item = jsonArray[i];
	            var newItemHTML = '<li><span class="radios"><input type="radio" id="font_rd'+i+'" name="font_family" value="'+item.comnCdVal+'"> <label for="font_rd'+i+'">'+item.comnCdValNm+'</label></span></li>';
	            
	            // 아이디가 "font_list"인 ul 요소에 새 항목 추가
	            $("#font_list").append(newItemHTML);
	        }

	        // 첫 번째 요청 완료 후 두 번째 AJAX 요청 실행
	        $.ajax({
	            url: "${path}/api/common/data/DefaltValue.do", // 두 번째 엔드포인트 URL
	            type: "GET", // HTTP GET 메서드 사용
	            success: function(response) {

	                // JSON 데이터 파싱
	                var responseData = JSON.parse(response);

	        	     // 원하는 value 값을 가진 라디오 버튼 선택하기
	    	        var desiredValue = "font_myeongjo"; // 원하는 value 값
	    	        $("input[name='font_family'][value='" + responseData.envrStupVl + "']").prop("checked", true);

	    	        
	    	        
	                // "comnCdValNm"이 "font"인 항목 찾기
	                for (var i = 0; i < responseData.length; i++) {
	                    var item = responseData[i];
	                    if (item.comnCdValNm === "font") {
	                        var comnCdVal = item.comnCdVal;
	                        

	                        $("input[name='font_family'][value="+comnCdVal+"]").prop("checked", true);

	                        break; // 값을 찾았으므로 반복문 종료
	                    }
	                }
	                

	            	fnChangeFont();
	    	        
	    	        
	            },
	            error: function(xhr, status, error) {
	                // 두 번째 요청 실패 시 실행할 코드
	                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	            }
	        });
	        

	        
	    },
	    error: function(xhr, status, error) {
	        // 첫 번째 요청 실패 시 실행할 코드
	        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	    }
	});


});



</script>

    <div class="right_title">
        <h2>설정</h2>
        	<div class="btn_close"><span><a href="javascript:fnPageLoad('${path}/page/answer.do','');"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				
    </div>
    <div class="right_contents">
        <div class="notice_con_inner">
            <div class="setting_keyword">
							<select name="" onchange="fnPageLoad(value,'');">
									<option id="" value="${path}/page/setting.do">선택</option>
									<option id="" value="${path}/page/setting_system.do">시스템 정보</option>
									<option id="" value="${path}/page/setting_font.do" selected>폰트종류</option>
									<option id="" value="${path}/page/setting_size.do">폰트크기</option>
									<option id="" value="${path}/page/setting_my.do">마이페이지</option>
							</select>
            </div>
            <div class="setting_content">
                <div class="font_choice">
                    <ul id="font_list">
                        <!-- 폰트 리스트를 동적으로 추가할 수 있음 -->
                    </ul>
                </div>
                <div id="btn_save" class="setting_btn">
                    <a href="#">저장</a>
                </div>
            </div>
        </div>
    </div>


