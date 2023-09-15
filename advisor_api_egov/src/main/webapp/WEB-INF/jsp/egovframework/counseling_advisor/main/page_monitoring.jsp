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
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>
    
<!-- 레이어팝업창 -->
<script> 


$(document).ready(  function() {
	  
	  // AJAX DELETE 요청 보내기
    $.ajax({
    	///api/common/data.do
        //url: "${path}/api/common/agency.do", // 엔드포인트 URL
        
        url: "${path}/api/common/data/agentList.do", // 엔드포인트 URL
        type: "GET", // HTTP DELETE 메서드 사용
        success: function(response) {
        	console.log(response);
        	
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
		
	  
	
	  

    $.ajax({
        url: "${path}/api/users.do",
        type: "GET",
        success: function(response) {
            console.log(response);

            var jsonArray = JSON.parse(response);
            // 요청 성공 시 실행될 함수
            console.log("AJAX  성공: " + jsonString);

        },
        error: function(xhr, status, error) {
            // 두 번째 Ajax 요청의 요청 실패 시 실행할 코드
            alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
        }
    });
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  $('.monitor_couseller').on('click', function() {
		    // 팝업 창의 URL과 창의 속성을 설정합니다.
		    var popupURL = "http://localhost:8080/advisor_api_egov/page/monitoring_popup.do";
		    var popupName = "팝업 이름";
		    // 팝업 창 열기
		    window.open(popupURL, "_blank", "width=900, height=600");
	  });
	  
});





</script>
 <script src="<c:url value='/js/egovframework/nxcapi_web.js' />"></script>
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
			<a href="${path}/page/setting.do"><i><img src="<c:url value='/images/icons/gnb_03.png'/>" alt=""></i> 설정</a>
			<a href="${path}/page/monitoring.do" class="active"><i><img src="<c:url value='/images/icons/gnb_04.png'/>" alt=""></i> 모니터링</a>
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
						</a>모니터링</h2>
					<div class="btn_close">
						<a href="${path}/page/home.do">
							<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
						</a>
					</div>
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
					<form name="" method="" action="">
						<div class="monitor_head">
							<button class="refresh">새로고침</button>
								<select name='agent'>
								</select>	
						</div>	
						<div class="monitor_content">
							<div class="counseller_monitoring">
								<ul>
									<li>
										<div class="monitor_couseller"><a href="#">
											<span class="counsel_ing">통화중</span>
											<p>상담사 홍길동</p></a>
										</div>
									</li>
									<li>
										<div class="monitor_couseller"><a href="#">
											<span class="counsel_end">통화종료</span>
											<p>상담사 홍길동</p></a>
										</div>
									</li>
									<li>
										<div class="monitor_couseller"><a href="#">
											<span class="counsel_ready">통화 대기중</span>
											<p>상담사 홍길동</p></a>
										</div>
									</li>
									<li>
										<div class="monitor_couseller"><a href="#">
											<span class="counsel_ing">통화중</span>
											<p>상담사 홍길동</p></a>
										</div>
									</li>
									<li>
										<div class="monitor_couseller"><a href="#">
											<span class="counsel_end">통화종료</span>
											<p>상담사 홍길동</p></a>
										</div>
									</li>
									<li>
										<div class="monitor_couseller"><a href="#">
											<span class="counsel_ready">통화 대기중</span>
											<p>상담사 홍길동</p></a>
										</div>
									</li>
									<li>
										<div class="monitor_couseller"><a href="#">
											<span class="counsel_ing">통화중</span>
											<p>상담사 홍길동</p></a>
										</div>
									</li>
									<li>
										<div class="monitor_couseller"><a href="#">
											<span class="counsel_end">통화종료</span>
											<p>상담사 홍길동</p></a>
										</div>
									</li>
									<li>
										<div class="monitor_couseller"><a href="#">
											<span class="counsel_ready">통화 대기중</span>
											<p>상담사 홍길동</p></a>
										</div>
									</li>
								</ul>
							</div>
							<div class="setting_btn">
								<a href="">접속</a>
							</div>

						</div>
					</form>
				</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>

<!-- 레이어팝업창 -->
<div id="counsel_history_popup">
	<div class="history_detail_popup">
	<div class="history_pop_header">
		<div id="logo">
			<a href="${path}/page/home.do">
				<img src="<c:url value='/images/icons/mark.png'/>" alt="">
				<span>농촌진흥청<i><img src="<c:url value='/images/icons/logo_arr.png'/>" alt=""></i></span>
			</a>
		</div>
					<div class="btn_close">
						<a href="${path}/page/home.do">
							<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
						</a>
					</div>
	</div>
		<!-- body -->
	<div class="detail_pop_container" id="jubsok_detail">	
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
			<section id="right_con">
				<div class="counsel">
				<form name="" method="" action="">
					<!-- 검색 -->
		
					<!-- 내용 -->
						<div class="jubsok_con">
							<div class="counsel_con_inner">
								<div class="counsel_flag"><a href="#" class="btn_flag"><img src="<c:url value='/images/icons/btn_tag.png'/>" alt=""></a></div>
								<div class="counsel_pagenation">
									<ul>
										<li class="page_prev"><a href="#"><img src="<c:url value='/images/icons/page_prev.png'/>" alt=""></a></li>
										<li class="on"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
										<li><a href="#">7</a></li>
										<li><a href="#">8</a></li>
										<li><a href="#">9</a></li>
										<li><a href="#">10</a></li>
										<li class="page_next"><a href="#"><img src="<c:url value='/images/icons/page_next.png'/>" alt=""></a></li>
									</ul>
								</div>
								<script>
									$( document ).ready(function() {
									  $('.btn_flag').on('click', function() {
										 $('.counsel_pagenation').toggleClass('open');
										 return false;
									  });
									});
								</script>
							
							<!-- 내용 -->
							<div class="chating_contents">
								<ul>
									<li class="counseller">
										<em>매니저명 (2023.12.31.23.59.59)</em>
										<div class="chattok"><p>이아름 상담사님 멘탈 잡으세요</p>
										</div>
									</li>
								</ul>							
							
							</div>
							<!-- 내용 -->
							
							</div>
							
						</div>
						
					<!-- cousel -->
					<!-- chating popup -->
					<div class="chating_write">
						<div class="chating_write_con">
							<textarea placeholder="내용을 입력해 주세요."></textarea>
							<button>전송</button>
						</div>
					</div>
					<!-- chating popup -->
				</div>
				</form>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
	</div>
</div>




<!--   <script>
            NXApi.setEvent(function (json) {

	            });
	            NXApi.connect({
		            // url: ["wss://testdo.nexuscommunity.net:9801"],
		            url: ["ws://192.168.90.61:9800"],
	                linkType: 4,
	                deviceNumber : 2011
	            }).then(function (response) {
	                console.log('connect result:' + JSON.stringify(response));
	            });
	
	
            NXApi.command({
	                cmd:'agentstatusgetii',
	                group: 100,
	                part: 102,
	                mode: 203,  // NotReady
	                //mode: 204,  // Ready
	
	
		        //centerid : 4,
	                maxcount: 10
	            }).then(function(response) {
	                console.log('agentstatusgetii result:'+JSON.stringify(response));
	            })
    </script> -->
</body>
</html>