<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="org.apache.log4j.Logger" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ page import="com.ubintis.api.ApiUserService" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.common.util.AddressUtil" %>
<%@ page import="com.fasterxml.jackson.databind.JsonNode" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>

<%
// 맥락 파라미터 'userID' 값을 가져오기
String messageServerIp = getServletContext().getInitParameter("messageServerIp");
%>

<%
//http://localhost:8080/advisor_api_egov/api/auth/login.do

String user_id = (String) session.getAttribute("user_id");
%>


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
	
	<style>
	.highlight {
      color: yellow;
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
			<a href="${path}/page/summary.do"><i><img src="<c:url value='/images/icons/gnb_01.png'/>" alt=""></i> 요약</a>
			<a href="${path}/page/history.do"><i><img src="<c:url value='/images/icons/gnb_02.png'/>" alt=""></i> 이력</a>
			<a href="${path}/page/setting.do"><i><img src="<c:url value='/images/icons/gnb_03.png'/>" alt=""></i> 설정</a>
			<a href="${path}/page/monitoring.do"><i><img src="<c:url value='/images/icons/gnb_04.png'/>" alt=""></i> 모니터링</a>
			<a href="${path}/page/authority.do"><i><img src="<c:url value='/images/icons/gnb_05.png'/>" alt=""></i> 권한</a>
			<a href="${path}/api/auth/logout.do"><i><img src="<c:url value='/images/icons/gnb_06.png'/>" alt=""></i> 로그아웃</a>
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
				
				</div>
				
		
				<!-- chating head -->
				<!-- chating con -->
				<div class="chating_con">
					
					<div id="chating_contents" class="chating_contents">
						<ul>
						</ul>
					</div>
					</div>
					<!-- chating con -->
					<!-- chating bottom -->
					<div id="chating_bottom" class="chating_bottom" style="display:none;">
					</div>
					<!-- chating bottom -->
					<!-- chating popup -->
					<div id="chating_popup" class="chating_popup" style="display:none;">
						<h3><i><img src="<c:url value='/images/icons/smile_icon.png'/>" alt=""></i>상담요약</h3>
						<div class="chating_popup_con">
							<textarea id="summary_text" placeholder="상담 요약"></textarea>
							<button id="btn_save_summary" >저장</button>
						</div>
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
	
								<select name="">
									<option id="" value="">전체</option>
										<option id="" value="">AI</option>
										<option id="" value="">KMS</option>
								</select>
								<input id="text_adv_menual_question" type="text" size="20" name="" value="" placeholder="검색어를 입력하세요.">
								<button id="btn_adv_menual_question">검색</button>								
						
						</div>
					<!-- 내용 -->
						<div class="counsel_con" style="height: calc(100% - 90px);">
										
								<div id="no_answer" style="height: 100%; display: flex; justify-content: center; align-items: center; background-color:#f3f5f9;">
								    <p> 답변을 준비중 입니다. </p>
								</div>

							<div class="counsel_con_inner" style="display:none;">
							

							<section id= "answer_content">
								<div class="label_sticky">
											<div class="counsel_flag"><a href="#" class="btn_flag"><img src="<c:url value='/images/icons/btn_tag.png'/>" alt=""> </a></div>
											
											<div class="counsel_pagenation code-html">
									
			
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
								
								
								
								
								
								
								
								</section>
							
								
							
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
	
	<input id="call_id" type="hidden" name="" value="">
	
</div>



	



						<div id="author_alert_popup">
							<div class="author_alert_con">
								<p style = "text-align: center;">
									로그아웃 하시겠습니까?
								</p>
							</div>
							<div class="author_alert_btn">
								<a href="#" class="bnt_cancle">닫기</a><button id="btn_logout" style="border-radius: 10px;
						    display: inline-block;
						    background: #293E89;
						    width: 130px;
						    height: 49px;
						    line-height: 49px;
						    text-align: center;
						    color: #fff;
						    font-size: 16px;">로그아웃</button>
							</div>
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