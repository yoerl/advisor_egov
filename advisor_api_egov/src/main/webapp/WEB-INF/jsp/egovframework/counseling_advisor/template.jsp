<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String messageServerIp = getServletContext().getInitParameter("messageServerIp");
%>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String messageServerPort = getServletContext().getInitParameter("messageServerPort");
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
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/base.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/pagenation.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/font.css'/>"/>
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
	<script src="<c:url value='/js/egovframework/sockjs.client.min.js' />"></script>
	<script src="<c:url value='/js/egovframework/stomp-2.3.4.min.js' />"></script>
    <script src="<c:url value='/js/egovframework/pagenation.js' />"></script>	
    <script src="<c:url value='/js/egovframework/common.js' />"></script>	
    <script>
	  	//페이지 로드
	    function fnPageLoad(url,param){
	    	$("#sub_right_con").load(url,param,function(response,status,xhr){
	    		if(status == "success"){
	    			$("#pageInfoFrm input[name=url]").val(url);
	    			$("#pageInfoFrm input[name=param]").val(param);
	    		}else{
	    			$("#sub_right_con").html(response);
	    		}
	    	});
	    }
    </script>
</head>

<body>
<div id="wrap">
	<!-- 페이지 로드에 사용되는 폼 -->
	<form id="pageInfoFrm" method="post">
		<input type="hidden" name="url">
		<input type="hidden" name="param">
	</form>
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
			<a href="javascript:fnPageLoad('${path}/page/setting.do','');"><i><img src="<c:url value='/images/icons/gnb_03.png'/>" alt=""></i> 설정</a>
			<a href="${path}/page/monitoring.do"><i><img src="<c:url value='/images/icons/gnb_04.png'/>" alt=""></i> 모니터링</a>
			<a href="${path}/page/authority.do"><i><img src="<c:url value='/images/icons/gnb_05.png'/>" alt=""></i> 권한</a>
			<a href="${path}/api/auth/logout.do" id="btn_logout"><i><img src="<c:url value='/images/icons/gnb_06.png'/>" alt=""></i> 로그아웃</a>
		</nav>
			
		<div id="lnb">
			<a href="javascript:fnPageLoad('${path}/page/notice.do','');" class="call"></a>
			<a href="javascript:fnPageLoad('${path}/page/news.do','');" class="push"><span id="nrdCnt"></span></a>
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
		
		</section>
	</div>
	<!-- body -->
</div>

						<div id="author_alert_popup">
							<div class="author_alert_con">
								<p style = "text-align: center;">
									오류가 발생하였습니다.<br>
									잠시 후 다시 시도해 주세요.
									
								</p>
							</div>
							<div class="author_alert_btn">
								<a href="" class="bnt_cancle">닫기</a><a href="">재시도</a>
							</div>
						</div>
</body>
</html>