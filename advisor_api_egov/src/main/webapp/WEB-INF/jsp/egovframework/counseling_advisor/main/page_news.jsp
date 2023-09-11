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
    <script src="<c:url value='/js/egovframework/pagenation.js' />"></script>	
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/pagenation.css'/>"/>
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
				
				</div>
			</section>
		<!-- chating -->
		<!-- right -->
			<section id="notice_con">
				<div class="notice_title">
					<h2>
						<a href="javascript:history.go(-1);">
							<img src="../images/icons/arrow-left.png" alt="">
						</a>알림</h2>
					
					<div class="btn_close">
						<a href="${path}/page/home.do">
							<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
						</a>
					</div>
				</div>
				<div class="notice_contents">
					<div class="notice_con_inner">
					<form name="" method="" action="">
						<div class="view_total"><button type="button" class="btn_ranking"  onClick="location.href='${path}/page/ranking.do'">키워드 랭킹</button><div class="alim_button"><a href="#" class="btn_choice_total">전체선택</a><a href="#" class="btn_view_total">읽음처리</a></div></div>
						<script>
							$(document).ready(function() {
								$('.btn_view_total').on("click",function(){
								   $('.notice-list li a').addClass("visited");
								  });
							 });
						</script>
					<!-- notice-list -->
						<ul class="notice-list">
							<li><div class="checkbox"><span><input type="checkbox" id="check1" name="check1" value=""><label for="check1"></label></span></div>
								<a href="#">
									<p>공지사항 제목입니다.</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
							</li>
							<li><div class="checkbox"><span><input type="checkbox" id="check2" name="check2" value=""><label for="check2"></label></span></div>
								<a href="#">
									<p>공지사항 제목입니다.</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
							</li>
							<li><div class="checkbox"><span><input type="checkbox" id="check3" name="check3" value=""><label for="check3"></label></span></div>
								<a href="#" class="visited">
									<p>공지사항 제목입니다.</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
							</li>
							<li><div class="checkbox"><span><input type="checkbox" id="check4" name="check4" value=""><label for="check4"></label></span></div>
								<a href="#"  class="visited">
									<p>공지사항 제목입니다.</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
							</li>
						</ul>
					<!-- 삭제팝업창 -->
						<div id="del_alert_popup">
							<div class="del_alert_head">
								<h3>삭제</h3>
							</div>
							<div class="del_alert_con">
								<p>게시물을 정말 삭제하시겠습니까?</p>
							</div>
							<div class="del_alert_btn">
								<a href="" class="bnt_cancle">취소</a><a href="">삭제</a>
							</div>
						</div>
					<!-- 삭제팝업창 -->

					
					
					</div>
					</form>
					
					
					<div class="code-html pagenation">
						<div id="pagination1" class="tui-pagination"><a href="#" class="tui-page-btn tui-first"><span class="tui-ico-first">first</span></a><a href="#" class="tui-page-btn tui-prev"><span class="tui-ico-prev">prev</span></a><a href="#" class="tui-page-btn tui-first-child">1</a><strong class="tui-page-btn tui-is-selected">2</strong><a href="#" class="tui-page-btn">3</a><a href="#" class="tui-page-btn">4</a><a href="#" class="tui-page-btn">5</a><a href="#" class="tui-page-btn tui-next-is-ellip tui-last-child"><span class="tui-ico-ellip">...</span></a><a href="#" class="tui-page-btn tui-next"><span class="tui-ico-next">next</span></a><a href="#" class="tui-page-btn tui-last"><span class="tui-ico-last">last</span></a></div>	
					</div>
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
		visiblePages: 5
	});
</script>
<script> 
	$(document).ready(function(){ 
		$("a.btn_del_con").click(function(){ 
			$("#del_alert_popup").css("display", "block");
		}); 
		
		$(".del_alert_btn a.bnt_cancle").click(function(){ 
			$("#del_alert_popup").css("display", "none"); 
		}); 
	
	
/* 	// 모든 체크박스를 선택합니다.
	const checkboxes = document.querySelectorAll('.checkbox input[type="checkbox"]');

	// 각 체크박스를 클릭합니다.
	checkboxes.forEach(checkbox => {
	  checkbox.checked = true; // 체크박스를 클릭(선택)합니다.
	}); */
	
	
	}); 
	
	// "btn_choice_total" 클래스를 가진 링크 요소를 가져옵니다.
	const btnChoiceTotal = document.querySelector('.btn_choice_total');

	// 링크를 클릭하면 이벤트 핸들러를 실행합니다.
	btnChoiceTotal.addEventListener("click", function(event) {
	  event.preventDefault(); // 기본 링크 동작을 중지합니다.

	  // 모든 체크박스를 선택합니다.
	  const checkboxes = document.querySelectorAll('.checkbox input[type="checkbox"]');
	  
	  // 모든 체크박스가 선택되어 있는지 확인합니다.
	  const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);

	  // 모든 체크박스를 선택 또는 해제합니다.
	  checkboxes.forEach(checkbox => {
	    checkbox.checked = !allChecked;
	  });
	});

	
</script>
</body>
</html>




