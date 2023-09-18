<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String userID = getServletContext().getInitParameter("userID");
%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>농촌진흥청</title>
<meta name="description" content="">
<meta name="keywords" content="">
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/font.css'/>"/>


<script>



$(document).ready(  function() {
	
    $("#btn_save").click(function () {
        // 이곳에 클릭했을 때 실행할 코드를 작성합니다.
        alert("버튼이 클릭되었습니다."); // 예시: 경고창을 띄움

        var jsonData = {
        		envrStupDivCd: 'font',          // 문자열 데이터
        		userId: '<%=userID%>',          // 문자열 데이터
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
                console.log("11111");
                console.log(responseData);
                console.log("22222");
            },
            error: function(xhr, status, error) {
                // 요청 실패 시 실행할 코드
                console.error("AJAX 오류: " + error);
            }
        });
        
        location.reload();

        
    });
    
	  
	// 첫 번째 AJAX 요청
	$.ajax({
	    url: "${path}/api/common/data/FontList.do", // 첫 번째 엔드포인트 URL
	    type: "GET", // HTTP GET 메서드 사용
	    success: function(response) {
	        console.log("999999999999");
	        console.log(response);

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
	                console.log(response);

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

/* 로그인 유저의 환경설정 조회 함수 */
function fnChangeFont(){
	 // 서버로 보낼 JSON 데이터
    var jsonData = {
    		envrStupDivCd: 'font',          // 문자열 데이터
    		userId: '<%=userID%>',          // 문자열 데이터
    };
	 
	var responseData;
	
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
            responseData = JSON.parse(response);
            console.log("888888888888888888");
            console.log("qwd"+response);
            console.log("uuu"+response.length);

	        // 요청 성공 시 실행할 코드
	        // JSON 데이터 파싱
	        var responseData = JSON.parse(response);
	        console.log("response: " + response);
	        console.log("envrStupVl: " + responseData.envrStupVl); // "envrStupVl" 값 출력
	        
	     // 원하는 value 값을 가진 라디오 버튼 선택하기
	        $("input[name='font_family'][value='" + responseData.envrStupVl + "']").prop("checked", true);


	        $("#no_calling").addClass(responseData.envrStupVl);
            
        },
        error: function(xhr, status, error) {
            // 요청 실패 시 실행할 코드
            console.error("AJAX 오류: " + error);
        }
    });
    
    return responseData;
}


</script>
<style>
</style>

</head>

<body>
<div id="wrap">
	<!-- header -->
	<header id="header">
		<div id="logo">
			<a href="${path}/page/home.do">
				<img src="<c:url value='/images/icons/mark.png'/>" alt="">
				<span>농촌진흥청<i><img src="<c:url value='/images/icons/logo_arr.png'/>" alt=""></i></span>
			</a>
		</div>
		<nav id="gnb">
			<a href="${path}/page/summary.do"><i><img src="<c:url value='/images/icons/gnb_01.png'/>" alt=""></i> 요약</a>
			<a href="${path}/page/history.do"><i><img src="<c:url value='/images/icons/gnb_02.png'/>" alt=""></i> 이력</a>
			<a href="${path}/page/setting.do" class="active"><i><img src="<c:url value='/images/icons/gnb_03.png'/>" alt=""></i> 설정</a>
			<a href="${path}/page/monitoring.do"><i><img src="<c:url value='/images/icons/gnb_04.png'/>" alt=""></i> 모니터링</a>
			<a href="${path}/page/authority.do"><i><img src="<c:url value='/images/icons/gnb_05.png'/>" alt=""></i> 권한</a>
			<a href="#"><i><img src="<c:url value='/images/icons/gnb_06.png'/>" alt=""></i> 로그아웃</a>
		</nav>
		<div id="lnb">
			<a href="${path}/page/notice.do" class="call"></a>
			<a href="${path}/page/news.do" class="push"><span>99+</span></a>
		</div>
	</header>
	<!-- header -->
	<!-- body -->
	<div id="container">
		<!-- chating -->
						<section id="charting">
				<div class="chating_inner">
				
				<div id="no_calling" style="height: 100%; display: flex; justify-content: center; align-items: center;">
				    <p> 현재 통화 상태가 아닙니다. </p>
				</div>

				
				
				
				
				<!-- chating head -->
				<div id="chating_head" class="chating_head" style="display:none;">
<!-- 					<div class="chating_head_inner">
						<h2>010-1234-5678 고객님과 전화상담이 시작되었습니다.</h2>
						<p>시작일시 (2023.12.31.23.59.59)</p>
					</div> -->
				</div>
				<!-- chating head -->
				<!-- chating con -->
				<div class="chating_con">
					
					<div class="chating_contents">
						<ul>
						</ul>
					</div>
					</div>
					<!-- chating con -->
					<!-- chating bottom -->
					<div class="chating_bottom" style="display:none;">
					</div>
					<!-- chating bottom -->
					<!-- chating popup -->
					<div class="chating_popup" style="display:none;">
						<form name="" method="" action="">
						<h3><i><img src="<c:url value='/images/icons/smile_icon.png'/>" alt=""></i>상담요약</h3>
						<div class="chating_popup_con">
							<textarea placeholder="군입대에 대한 상담"></textarea>
							<button>저장</button>
						</div>
						</form>
					</div>
					<!-- chating popup -->
				
				</div>
			</section>
		<!-- chating -->
		<!-- right -->
			<section id="sub_right_con">
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
					<form name="" method="" action="">
						<div class="setting_keyword">
								<select name="" onchange="window.open(value,'_self');">
										<option id="" value="">선택</option>
										<option id="" value="${path}/page/setting_system.do">시스템 정보</option>
										<option id="" value="${path}/page/setting_font.do" selected>폰트종류</option>
										<option id="" value="${path}/page/setting_size.do">폰트크기</option>
										<option id="" value="${path}/page/setting_my.do">마이페이지</option>
								</select>	
						</div>	
						<div class="setting_content">
							<div class="font_choice">
								<ul id="font_list">
									
								</ul>
							</div>
							<div id="btn_save" class="setting_btn">
								<a href="#">저장</a>
							</div>

						</div>
					</form>
				</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>
</body>
</html>