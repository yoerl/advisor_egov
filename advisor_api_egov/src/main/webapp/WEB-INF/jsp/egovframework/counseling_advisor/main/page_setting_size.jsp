<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String userID = getServletContext().getInitParameter("userID");
%>
<script>

$(document).ready(  function() { 
	  
	/* 폰트사이즈 등록 */
    $("#btn_save").click(function () {
        // 이곳에 클릭했을 때 실행할 코드를 작성합니다.

        var jsonData = {
        		envrStupDivCd: 'fontSize',          // 문자열 데이터
        		userId: '<%=userID%>',          // 문자열 데이터
        		envrStupVl: $("input[name='font_size']:checked").val(),
        };

        $.ajax({
            url: "${path}/api/setting/fontSize.do",  // 서버의 API 엔드포인트 URL
            type: "POST",              // HTTP 메서드 (POST, GET 등)
            async: false,                // 동기적 요청 활성화
            data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
            contentType: "application/json", // 요청 본문의 데이터 타입 설정
            success: function(response) {
                // 요청 성공 시 실행할 코드
                // JSON 데이터 파싱
                responseData = JSON.parse(response);
                console.log("btn_save success = " + responseData);
		        fnChangeFontSize();
            },
            error: function(xhr, status, error) {
                // 요청 실패 시 실행할 코드
                console.error("AJAX 오류: " + error);
            }
        });

    });
    
	// 첫 번째 AJAX 요청
	$.ajax({
	    url: "${path}/api/common/data/FontSizeList.do", // 첫 번째 엔드포인트 URL
	    type: "GET", // HTTP GET 메서드 사용
	    success: function(response) {
	        console.log(response);

	        var jsonArray = JSON.parse(response);
	        for (var i = 0; i < jsonArray.length; i++) {
	            var item = jsonArray[i];
	            var newItemHTML = '<li><span class="radios"><input type="radio" id="font_rd'+i+'" name="font_size" value="'+item.comnCdVal+'"> <label for="font_rd'+i+'">'+item.comnCdValNm+'</label></span></li>';
	            
	            // 아이디가 "size_list"인 ul 요소에 새 항목 추가
	            $("#size_list").append(newItemHTML);
	        }

	        // 첫 번째 요청 완료 후 두 번째 AJAX 요청 실행
	        $.ajax({
	            url: "${path}/api/common/data/DefaltValue.do", // 두 번째 엔드포인트 URL
	            type: "GET", // HTTP GET 메서드 사용
	            success: function(response) {
	                console.log(response);

	                // JSON 데이터 파싱
	                var responseData = JSON.parse(response);

	                // "comnCdValNm"이 "fontSize"인 항목 찾기
	                for (var i = 0; i < responseData.length; i++) {
	                    var item = responseData[i];
	                    if (item.comnCdValNm === "fontSize") {
	                        var comnCdVal = item.comnCdVal;
	                        console.log("fontSize 값:", comnCdVal);
	                        
	                        $("input[name='font_size'][value="+comnCdVal+"]").prop("checked", true);
	                        break; // 값을 찾았으므로 반복문 종료
	                    }
	                }
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


/* 로그인 유저의 환경설정(폰트사이즈) 조회 후 영역 css 변경 함수 */
function fnChangeFontSize(){
	 // 서버로 보낼 JSON 데이터
    var jsonData = {
    		envrStupDivCd: 'fontSize',          // 문자열 데이터
    		userId: '<%=userID%>',          // 문자열 데이터
    };
	 
    // AJAX 요청 설정
    $.ajax({
        url: "${path}/api/setting.do",  // 서버의 API 엔드포인트 URL
        type: "POST",              // HTTP 메서드 (POST, GET 등)
        async: false,                // 동기적 요청 활성화
        data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
        contentType: "application/json", // 요청 본문의 데이터 타입 설정
        success: function(response) {

        // 요청 성공 시 실행할 코드
        // JSON 데이터 파싱
        var responseData = JSON.parse(response);
        console.log("response: " + response);
        console.log("envrStupVl: " + responseData.envrStupVl); // "envrStupVl" 값 출력
	        
	     // 원하는 value 값을 가진 라디오 버튼 선택하기
	     $("input[name='font_size'][value='" + responseData.envrStupVl + "']").prop("checked", true);

	     $("#no_calling").css('font-size',responseData.envrStupVl+"px");
            
        },
        error: function(xhr, status, error) {
            // 요청 실패 시 실행할 코드
            console.error("AJAX 오류: " + error);
        }
    });
}

</script>

<!-- right -->
	<div class="right_title">
		<h2>
			<a href="javascript:history.go(-1);">
				<img src="../images/icons/arrow-left.png" alt="">
			</a>설정</h2>
		
		<div class="btn_close">
			<a href="${path}/page/home.do">
				<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
			</a>
		</div>
	</div>
	<div class="right_contents">
		<div class="notice_con_inner">
			<div class="setting_keyword">
					<select name="" onchange="window.open(value,'_self');">
							<option id="" value="">선택</option>
							<option id="" value="${path}/page/setting_system.do">시스템 정보</option>
							<option id="" value="${path}/page/setting_font.do">폰트종류</option>
							<option id="" value="${path}/page/setting_size.do" selected>폰트크기</option>
							<option id="" value="${path}/page/setting_my.do">마이페이지</option>
					</select>	
			</div>	
			<div class="setting_content">
				<div class="size_choice">
					<ul id="size_list">
						
					</ul>
				</div>
				<div id="btn_save" class="setting_btn">
					<a href="#none">저장</a>
				</div>

			</div>
	</div>
<!-- right -->
