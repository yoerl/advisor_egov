<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
   	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="cache-control" content="no-cach, no-store, must-revalidate" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    
<title>농촌진흥청</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
    <link type="text/css" rel="stylesheet" href="<c:url value='/dist/tailwind.min.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/base.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/pagenation.css'/>"/>
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
	<script src="<c:url value='/js/egovframework/sockjs.client.min.js' />"></script>
	<script src="<c:url value='/js/egovframework/stomp-2.3.4.min.js' />"></script>
    <script src="<c:url value='/js/egovframework/pagenation.js' />"></script>	
	
	
	<script>
	
		$(document).ready(function() {
            
			connectStomp();
			
		});
		
		var socket = null;
		var stomp = null;
		
		function connectStomp() {
			socket = new SockJS("http://192.168.90.87:8081/advisor_message_egov/stomp"); // endpoint 
			
		    stomp = Stomp.over(socket);
		    
		    stomp.connect({}, function () {
		        console.log("Connected stomp!");
		        console.log(stomp.ws._transport.url); 

		        // Message 토픽 구독!
		        stomp.subscribe('/topic/message', function (event) {
		        	console.log("topic/message return = "+event);
		        	console.log("topic/message return = "+event.body);
		        	console.log("-----------------------------------------------");
		        });
		        // Message 토픽 구독!
		        stomp.subscribe('/topic/message_a', function (event) {
		        	console.log("topic/message_a return = "+event);
		        	console.log("topic/message_a return = "+event.body);
		        	console.log("-----------------------------------------------");
		        });
		        

		        stomp.send("/recvRabbit", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": ""}));
		        stomp.send("/recvRabbit_a", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": ""}));
		        
/* 		     // 구독 객체 저장
		        var subscription = stomp.subscribe('/topic/message', function (event) {
		            console.log("topic/message return = " + event);
		            console.log("topic/message return = " + event.body);
		            console.log("-----------------------------------------------");
		        });

		        // 구독 취소
		        subscription.unsubscribe(); */
		    });
		
		}
        
        /* 더보기 버튼 클릭 함수 */
        function showMore(id) {
            $("#ai_part_txt"+id).css("maxHeight","none"); // 더 보기 버튼을 클릭하면 높이 제한을 해제
            $("#counsel_more_btn"+id).css("display","none"); // 더 보기 버튼을 숨김
        }

        /*  API로 데이터 리턴받고 영역에 뿌려준 후 실행시켜야함 
        	설명 : 높이가 70% 이상인지 확인해서 더보기 버튼 생성하는 로직
        	파라미터 : 순번
        */
        function eventAny(id){
        	var divElement = $("#ai_part_txt"+id);	//AI 답변영역 
        	var divHeight = divElement.height();
        	var windowHeight = $(window).height();
        	
        	// 더보기 버튼 html 
        	var moreBtnHtml = "<div class='counsel_more_btn' id='counsel_more_btn"+id+"' onclick='showMore(\""+id+"\");'><a href='#'>더보기<i><img src=<c:url value='/images/icons/arr_down.png'/> alt=''></i></a><div>";
        	
        	// 높이가 70% 이상인지 확인합니다.
        	if (divHeight >= windowHeight * 0.7) {
        	  console.log("DIV의 높이가 화면의 70% 이상입니다.");
        	  divElement.parent().append(moreBtnHtml);	// 더보기버튼 Element 추가
        	  
        	} else {
        	  console.log("DIV의 높이가 화면의 70% 미만입니다.");
        	}
        }
        
	</script>
	<style>
        .ai_part_txt {
            max-height: 80vh; /* 화면 높이 제한 */
            overflow: hidden; /* 내용이 넘칠 경우 숨김 */
        }
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
					<!-- 검색 -->
						<div class="counsel_search">
							<form name="" method="" action="">
	
								<select name="">
									<option id="" value="">전체</option>
										<option id="" value="">AI</option>
										<option id="" value="">KMS</option>
								</select>
								<input type="text" size="20" maxlength="30" name="" value="" placeholder="검색어를 입력하세요.">
								<button>검색</button>								
							</form>
						</div>
					<!-- 내용 -->
						<div class="counsel_con">
							<div class="counsel_con_inner">
							
							<div class="label_stick">
										<div class="counsel_flag"><a href="#" class="btn_flag"><img src="<c:url value='/images/icons/btn_tag.png'/>" alt=""> </a></div>
										
										<div class="counsel_pagenation code-html open" >
								
										
		
												<div id="pagination1" class="tui-pagination"><span class="tui-page-btn tui-is-disabled tui-first"><span class="tui-ico-first">first</span></span><span class="tui-page-btn tui-is-disabled tui-prev"><span class="tui-ico-prev">prev</span></span><strong class="tui-page-btn tui-is-selected tui-first-child">1</strong><a href="#" class="tui-page-btn">2</a><a href="#" class="tui-page-btn">3</a><a href="#" class="tui-page-btn">4</a><a href="#" class="tui-page-btn">5</a><a href="#" class="tui-page-btn">6</a><a href="#" class="tui-page-btn">7</a><a href="#" class="tui-page-btn">8</a><a href="#" class="tui-page-btn">9</a><a href="#" class="tui-page-btn">10</a><a href="#" class="tui-page-btn tui-next-is-ellip tui-last-child"><span class="tui-ico-ellip">...</span></a><a href="#" class="tui-page-btn tui-next"><span class="tui-ico-next">next</span></a><a href="#" class="tui-page-btn tui-last"><span class="tui-ico-last">last</span></a></div>	
											
										</div>
							</div>	
								<script>
									$( document ).ready(function() {
									  $('.btn_flag').on('click', function() {
										 $('.counsel_pagenation').toggleClass('open');
										 return false;
									  });
									});
								</script>
								
								
								
								
								<!-- 1 -->
								<div class="counsel_date"><p>2023.12.31.23.59.59</p></div>

								<div class="counsel_contents" id="scroll_1">
									<ul>
										<li class="counsel_kind">
											<h3>분류</h3>
											<div>
												<span><i>대</i>입영</span><span><i>중</i>입소</span><span><i>소</i>자원입대</span>
											</div>
										</li>
										<li class="ai_part">
											<h3>AI</h3>
											<div>
												<div class="ai_part_txt" id="ai_part_txt1">
													<div class="chang_open_con">
														<span><button class="chang_open_btn trigger"></button></span>
														<span><input type="checkbox" id="check1" name="check1"><label for="check1"></label></span>														
													</div>
													<h4>군입대 지원하려고 합니다. 어떻게 해야 할까요?</h4>
													<p>병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													</p>
												</div>
											</div>
										</li>
										<li class="kms_part">
											<h3>KMS</h3>
											<div>
												<div class="kms_part_txt">
													<ul>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 병역의무 이행과 이해</p>
															<span><input type="checkbox" id="check2" ><label for="check2"></label></span>	
															
														</div></li>
														<li><div class="kms_part_con"><p>병역판정검사</p>
															<span><input type="checkbox" id="check3" ><label for="check3"></label></span>	
														
														</div></li>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 </p>
															<span><input type="checkbox" id="check4" ><label for="check4"></label></span>	
															
														</div></li>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 병역의무 이행과 능력 연령별 </p>
															<span><input type="checkbox" id="check5" ><label for="check5"></label></span>	
															
														</div></li>
													</ul>
												</div>
												<div class="counsel_more_btn"><a href="#">더보기<i><img src=<c:url value='/images/icons/arr_down.png'/> alt=""></i></a><div>
											</div>
										</li>
									<ul>
								</div>
								<!-- 1 -->
								
								<!-- 1 -->
								<div class="counsel_date"><p>2023.12.31.23.59.59</p></div>

								<div class="counsel_contents"  id="scroll_2">
									<ul>
										<li class="counsel_kind">
											<h3>분류</h3>
											<div>
												<span><i>대</i>입영</span><span><i>중</i>입소</span><span><i>소</i>자원입대</span>
											</div>
										</li>
										<li class="ai_part">
											<h3>AI</h3>
											<div>
												<div class="ai_part_txt" id="ai_part_txt2">
													<div class="chang_open_con">
														<span><button class="chang_open_btn trigger"></button></span>
														<span><input type="checkbox" id="check1" name="check1"><label for="check1"></label></span>														
													</div>
													<h4>군입대 지원하려고 합니다. 어떻게 해야 할까요?</h4>
													<p>병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)
													<br />우선 모집일정,지원자격 등 확인 후 지원특기.......
													</p>
												</div>
												<div class="counsel_more_btn" id="counsel_more_btn2"><a href="#">더보기<i><img src=<c:url value='/images/icons/arr_down.png'/> alt=""></i></a><div>
											</div>
										</li>
										<li class="kms_part">
											<h3>KMS</h3>
											<div>
												<div class="kms_part_txt">
													<ul>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 병역의무 이행과 이해</p>
															<span><input type="checkbox" id="check2" ><label for="check2"></label></span>	
															
														</div></li>
														<li><div class="kms_part_con"><p>병역판정검사</p>
															<span><input type="checkbox" id="check3" ><label for="check3"></label></span>	
														
														</div></li>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 </p>
															<span><input type="checkbox" id="check4" ><label for="check4"></label></span>	
															
														</div></li>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 병역의무 이행과 능력 연령별 </p>
															<span><input type="checkbox" id="check5" ><label for="check5"></label></span>	
															
														</div></li>
													</ul>
												</div>
												<div class="counsel_more_btn"><a href="#">더보기<i><img src=<c:url value='/images/icons/arr_down.png'/> alt=""></i></a><div>
											</div>
										</li>
									<ul>
								</div>
								<!-- 1 -->
								
								<!-- 1 -->
								<div class="counsel_date"><p>2023.12.31.23.59.59</p></div>

								<div class="counsel_contents" id="scroll_3">
									<ul>
										<li class="counsel_kind">
											<h3>분류</h3>
											<div>
												<span><i>대</i>입영</span><span><i>중</i>입소</span><span><i>소</i>자원입대</span>
											</div>
										</li>
										<li class="ai_part">
											<h3>AI</h3>
											<div>
												<div class="ai_part_txt">
													<div class="chang_open_con">
														<span><button class="chang_open_btn trigger"></button></span>
														<span><input type="checkbox" id="check1" name="check1"><label for="check1"></label></span>														
													</div>
													<h4>군입대 지원하려고 합니다. 어떻게 해야 할까요?</h4>
													<p>병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)</p>
												</div>
												<div class="counsel_more_btn"><a href="#">더보기<i><img src=<c:url value='/images/icons/arr_down.png'/> alt=""></i></a><div>
											</div>
										</li>
										<li class="kms_part">
											<h3>KMS</h3>
											<div>
												<div class="kms_part_txt">
													<ul>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 병역의무 이행과 이해</p>
															<span><input type="checkbox" id="check2" ><label for="check2"></label></span>	
															
														</div></li>
														<li><div class="kms_part_con"><p>병역판정검사</p>
															<span><input type="checkbox" id="check3" ><label for="check3"></label></span>	
														
														</div></li>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 </p>
															<span><input type="checkbox" id="check4" ><label for="check4"></label></span>	
															
														</div></li>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 병역의무 이행과 능력 연령별 </p>
															<span><input type="checkbox" id="check5" ><label for="check5"></label></span>	
															
														</div></li>
													</ul>
												</div>
												<div class="counsel_more_btn"><a href="#">더보기<i><img src=<c:url value='/images/icons/arr_down.png'/> alt=""></i></a><div>
											</div>
										</li>
									<ul>
								</div>
								<!-- 1 -->
								
								
								
								
								
								
							
							</div>
							
						</div>
						<!-- 팝업창 내용 -->
							<div class="counsel_popup">
								<div class="btn_popup_close"><a href="#"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a></div>
								
								
								<h2>군입대 지원하려고 합니다. 어떻게 해야 할까요?</h2>
								<div class="counsel_poopup_con">
									<p>병역의무 이행<br />
										•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
										•상근예비역(18개월)<br />
										•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
										•사회복무요원(21개월)
										•산업기능요원 현역 입영대상사(34개월)<br />
										•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
										•상근예비역(18개월)<br />
										•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
										•사회복무요원(21개월)
										•산업기능요원 현역 입영대상사(34개월)<br />
										•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
										•상근예비역(18개월)<br />
										•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
										•사회복무요원(21개월)<br />
										•산업기능요원 현역 입영대상사(34개월)</p>
									<p><img src="<c:url value='/images/icons/noimg.gif'/>" alt=""></p>
									<p>별도로 표기 테이블 문서도 있음 
										별도 퍼플리싱 필요함
										테이블 색상은 가이드 문서 참고 작성해주세요</p>
									<p><img src="<c:url value='/images/icons/noimg.gif'/>" alt=""></p>
								</div>

							</div>
						<!-- 팝업창 내용 -->
						<script>
							$( document ).ready(function() {
							  $('.chang_open_btn').on('click', function() {
								 $('.counsel_popup').toggleClass('show');
								 return false;
							  });
							   $('.btn_popup_close a').on('click', function() {
								 $('.counsel_popup').removeClass('show');
								 return false;
							  });
							});
						</script>
					<!-- cousel -->
				</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>
<script class="code-js">
	var pagination1 = new tui.Pagination('pagination1', {
		totalItems: 500,
		itemsPerPage: 10,
		visiblePages: 10
	});
	
/* 	pagination1.on('beforeMove', function(eventData) {
        return confirm('Go to page ' + eventData.page + '?');
    });
 */
 pagination1.on('afterMove', function(eventData) {
	    console.log("wqewqe");
	    // 이벤트 핸들러 내에서 현재 페이지 번호를 가져옵니다.
	    var currentPage = eventData.page;
	    
	    // 대상 아이디를 생성합니다.
	    var targetId = "#scroll_" + currentPage;
	    
	    // 해당 아이디를 가진 요소를 선택합니다.
	    var targetElement = document.querySelector(targetId); // jQuery 객체 대신 DOM 요소로 선택
	    
	    if (targetElement) {
	        targetElement.scrollIntoView({
	            behavior: "smooth" // 부드러운 스크롤 사용
	        });
	    }
	});

</script>
<script type="text/javascript">


</script>

</body>
</html>