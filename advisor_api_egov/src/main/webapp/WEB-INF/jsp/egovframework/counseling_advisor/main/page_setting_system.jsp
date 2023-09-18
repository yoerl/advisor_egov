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
     <style>

      .skill-box:not(:first-child) {
        margin-top: 50px;
      }
      .skill-name {
        color: #878787;
        font-size: 18px;
        font-weight: 400;
        margin-bottom: 10px;
      }
      .progress-bar {
        position: relative;
        width: 100%;
        height: 10px;
        border-radius: 10px;

        background: #333333;
      }
      .progress {
        height: 10px;
        border-radius: 10px;
        background: #96764f;
        transform: scaleX(0);
        transform-origin: left;
        animation: scaleUp 0.1s cubic-bezier(0.1, 0.1, 0.1, 0.1) forwards;
      }
      .progress-rate {
        position: absolute;
        background: #222;
        color: #96764f;
        font-size: 14px;
        bottom: calc(100% + 10px);
        transform: translateX(-50%);
        padding: 2px 8px;
      }
      .progress-rate::after {
        content: "";
        position: absolute;
        top: 100%;
        left: 50%;
        transform: translate(-50%, -50%) rotate(45deg);
        background: #222;
        width: 5px;
        height: 5px;
      }
      @keyframes scaleUp {
        0% {
          transform: scaleX(0);
        }
        100% {
          transform: scaleX(1);
        }
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
				
				<div id="no_calling" style="height: 100%; display: flex; justify-content: center; align-items: center;">
				    <p> 현재 통화 상태가 아닙니다. </p>
				</div>
				<!-- chating head -->
				
				<div style="display:none;">
						<div class="chating_head">
							<div class="chating_head_inner">
							</div>
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
							<div class="chating_bottom">
								<div class="chating_head_inner">
								</div>
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
										<option id="" value="" selected>선택</option>
										<option id="" value="${path}/page/setting_system.do" selected>시스템 정보</option>
										<option id="" value="${path}/page/setting_font.do">폰트종류</option>
										<option id="" value="${path}/page/setting_size.do">폰트크기</option>
										<option id="" value="${path}/page/setting_my.do">마이페이지</option>
								</select>	
						</div>	
						<div class="setting_content">
						      		<div class="skill-box">
				        				<h4 class="skill-name">CPU</h4>
				
								        <div class="progress-bar">
								          <div class="progress" style="width: 95%"></div>
								          <div class="progress-rate" style="left: 95%">95%</div>
								        </div>
								      </div>
								
								      <div class="skill-box">
								        <h4 class="skill-name">메모리</h4>
								
								        <div class="progress-bar">
								          <div class="progress" style="width: 95%"></div>
								          <div class="progress-rate" style="left: 95%">95%</div>
								        </div>
								      </div>
								
								      <div class="skill-box">
								        <h4 class="skill-name">디스크</h4>
								
								        <div class="progress-bar">
								          <div class="progress" style="width: 95%"></div>
								          <div class="progress-rate" style="left: 95%">95%</div>
								        </div>
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