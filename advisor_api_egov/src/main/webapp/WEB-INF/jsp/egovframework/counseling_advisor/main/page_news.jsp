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
</head>

<body>
<div id="wrap">
	<!-- header -->
	<header id="header">
		<div id="logo">
			<a href="#"><img src="<c:url value='/images/icons/mark.png'/>" alt=""></a>
			<span>범정보통합콜센터<i><img src="<c:url value='/images/icons/logo_arr.png'/>"alt=""></i></span>
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
			<a href="${path}/page/news.do" class="call"></a>
			<a href="${path}/page/notice.do" class="push"><span>99+</span></a>
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
					<h2><!-- <a href="#"><img src="../img/arrow-left.png" alt=""></a> -->공지사항</h2>
					<div class="btn_close"><span><img src="<c:url value='/images/icons/btn_close.gif'/>"><span></div>
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
					<form name="" method="" action="">
						<div class="board_write_btn">
								<a href="${path}/page/news_write.do">등록</a>							
							
						</div>
					<!-- notice-list -->
						<ul class="board-list">
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>
							<li>
								<a href="${path}/page/news_view.do">
									<p>공지사항 제목</p>
									<span class="notice_date">2023.01.01 16:40</span>
								</a>
								<div class="manager"><span>작성자</span><a href="#" class="btn_del_con">삭제</a></div>
							</li>

						</ul>
					<!-- notice-list -->
						<div class="pagenation">
							<ul>
								<li class="page_prev"><a href="#">이전</a></li>
								<li class="on"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li class="page_next"><a href="#">다음</a></li>
							</ul>
						</div>
					</div>
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
					</form>
				</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>
<script> 
	$(document).ready(function(){ 
	$("a.btn_del_con").click(function(){ 
	$("#del_alert_popup").css("display", "block");
	}); 
	$(".del_alert_btn a.bnt_cancle").click(function(){ 
	$("#del_alert_popup").css("display", "none"); 
	}); 
	}); 
</script>
</body>
</html>