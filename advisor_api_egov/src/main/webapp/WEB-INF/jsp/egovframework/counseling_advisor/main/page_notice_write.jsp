<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>범정부통합콜센터</title>
<meta name="description" content="">
<meta name="keywords" content="">
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    <script>
	$(document).ready(function() {


        
        
        
	    	
	        // 버튼 클릭 이벤트 핸들러
	        $("#btn_save").click(function() {
	            // 서버로 보낼 JSON 데이터
	            var jsonData = {
	                    notiSqno: "",          // 문자열 데이터
	                    userId: "test_userId",        // 문자열 데이터
	                    userNm: "test_userNm",       // 문자열 데이터
	                    notiDivNm: "",    // 문자열 데이터
	                    notiTitlNm: document.getElementById("area_noti_title").value, // 문자열 데이
	                    notiCntn: document.getElementById("area_noti_content").value, // 문자열 데이터
	                    useYn: '',               // 문자 데이터 (char)
	                    amndId: "",       // 문자열 데이터
	                    amndNm: "",          // 문자열 데이터
	                    amntDttm: "", // Timestamp 형식의 문자열 데이터
	                    rgsrId: "",        // 문자열 데이터
	                    rgsrNm: "",     // 문자열 데이터
	                    rgsnDttm: "" // Timestamp 형식의 문자열 데이터
	            };
	            
	            // AJAX 요청 설정
	            $.ajax({
	                url: "${path}/api/notice.do",  // 서버의 API 엔드포인트 URL
	                type: "POST",              // HTTP 메서드 (POST, GET 등)
	                async: false,                // 동기적 요청 활성화
	                data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
	                contentType: "application/json", // 요청 본문의 데이터 타입 설정
	                success: function(response) {
	                    // 요청 성공 시 실행할 코드
	                    console.log(response);
	                   	if(response=="true")
	                   	{
	                   		alert("등록 완료 하였습니다.");
	                   	 	window.location.href = "${path}/page/notice.do";
	                   	}
	                   	else
	                   	{
	                   		alert("등록 실패 하였습니다");
	                   	}
	                   	
	                   	
	                },
	                error: function(xhr, status, error) {
	                    // 요청 실패 시 실행할 코드
	                    console.error("AJAX 오류: " + error);
	                }
	            });
	        });
	        
	    
		 // "취소" 버튼 클릭 이벤트 핸들러
	    document.getElementById("btn_cancel").addEventListener("click", function() {
	        // 페이지 자동 이동
	        window.location.href = "${path}/page/notice.do";
	    });

	    
	    
	});
    </script>
</head>

<body>
<div id="wrap">
	<!-- header -->
	<header id="header">
		<div id="logo">
			<a href="${path}/page/home.do">
				<img src="<c:url value='/images/icons/mark.png'/>" alt="">
				<span>범정부통합콜센터<i><img src="<c:url value='/images/icons/logo_arr.png'/>" alt=""></i></span>
			</a>
		</div>
		<nav id="gnb">
			<a href="${path}/page/summary.do" class="active"><i><img src="<c:url value='/images/icons/gnb_01.png'/>" alt=""></i> 요약</a>
			<a href="${path}/page/history.do"><i><img src="<c:url value='/images/icons/gnb_02.png'/>" alt=""></i> 이력</a>
			<a href="${path}/page/setting.do"><i><img src="<c:url value='/images/icons/gnb_03.png'/>" alt=""></i> 설정</a>
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
				<!-- chating head -->
				<div class="chating_head">
					<div class="chating_head_inner">
						<h2>010-1234-5678 고객님과 전화상담이 시작되었습니다.</h2>
						<p>시작일시 (2023.12.31.23.59.59)</p>
					</div>
				</div>
				<!-- chating head -->
				<!-- chating con -->
				<div class="chating_con">
					
					<div class="chating_contents">
						<ul>
							<li class="guest">
								<em>010-1234-5678 (2023.12.31.23.59.59)</em>
								<div class="chattok"><p>안녕하세요</p></div>
							</li>
							<li class="guest">
								<em>010-1234-5678 (2023.12.31.23.59.59)</em>
								<div class="chattok"><p>군대 지원하려고 합니다.<br />어떻게 할까요?</p></div>
							</li>
							<li class="counseller">
								<em>상담사 이아름(1234) (2023.12.31.23.59.59)</em>
								<div class="chattok"><p>네  안녕하세요.<br />
									병역의무 이행<br />
									•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
									•상근예비역(18개월)<br />
									•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
									•사회복무요원(21개월)<br />
									•산업기능요원 현역 입영대상사(34개월)<br />
									우선 모집일정,지원자격 등<br />
									확인 후 지원특기.......	</p>
								</div>
							</li>
							<li class="guest">
								<em>010-1234-5678 (2023.12.31.23.59.59)</em>
								<div class="chattok">
									<span class="dengerus"><i>!</i>위험키워드 #탈영</span>
								<p>안녕하세요</p></div>
							</li>
						</ul>
					
					
					</div>
					</div>
					<!-- chating con -->
					<!-- chating bottom -->
					<div class="chating_bottom">
						<div class="chating_head_inner">
							<h2>010-1234-5678 고객님과 전화상담이 종료되었습니다.</h2>
							<p>종료일시 (2023.12.31.23.59.59)</p>
						</div>
					</div>
					<!-- chating bottom -->
				
				</div>
			</section>
		<!-- chating -->
		<!-- right -->
			<section id="sub_right_con"><form name="" method="" action="">
				<div class="right_input_title">
					<h2>
						<a href="javascript:history.go(-1);">
							<img src="../images/icons/arrow-left.png" alt="">
						</a><input id="area_noti_title" type="text" size="20" maxlength="30" name="" value="" placeholder="공지사항 제목을 작성해주세요."></h2>
					
					<div class="btn_close">
						<a href="${path}/page/home.do">
							<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
						</a>
					</div>
				</div>
				<div class="right_contents">
					<div class="view_con_inner">
						<!-- <div class="board_data"><p>작성자명&nbsp; | &nbsp;2023.01.01 12:12</p></div> -->
						<div class="edit_write_content">
							<div class="editor_area">
								<img src="../images/icons/edit.gif" alt="">
							</div>
							<textarea id="area_noti_content"></textarea>
						</div>
						<!-- button -->
							<!-- button -->
							<div class="board_bottom_btn">
							    <button type="button" id="btn_cancel" class="btn_cancel">취소</button>
							    <button type="button" id="btn_save">저장</button>
							</div>

						
						<!-- button -->
					
					</div>
				</div>
				</form>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>
</body>
</html>