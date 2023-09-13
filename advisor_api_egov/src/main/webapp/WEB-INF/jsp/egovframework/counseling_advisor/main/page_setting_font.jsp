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
<title>농촌진흥청</title>
<meta name="description" content="">
<meta name="keywords" content="">
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/font.css'/>"/>


<script>



$(document).ready(  function() {
	  
	// 첫 번째 AJAX 요청
	$.ajax({
	    url: "${path}/api/common/data/FontList.do", // 첫 번째 엔드포인트 URL
	    type: "GET", // HTTP GET 메서드 사용
	    success: function(response) {
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

	                // "comnCdValNm"이 "font"인 항목 찾기
	                for (var i = 0; i < responseData.length; i++) {
	                    var item = responseData[i];
	                    if (item.comnCdValNm === "font") {
	                        var comnCdVal = item.comnCdVal;

	                        $("input[name='font_family'][value="+comnCdVal+"]").prop("checked", true);
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


</script>

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
							<div class="setting_btn">
								<a href="">저장</a>
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