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
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/base.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/font.css'/>"/>

<script>

$(document).ready(function() {
	$.ajax({
	    url: "${path}/api/common/data/roleList.do",
	    type: "GET",
	    success: function(response) {
	        console.log(response);

	        // JSON 데이터 파싱
	        var agencies = JSON.parse(response);

	        // select 요소 선택
	        var selectElement = $("select[name='role']");

	        // 기관명 옵션 추가
	        selectElement.append("<option value=''>그룹명</option>");
	        // 각 기관 옵션 추가
	        for (var i = 0; i < agencies.length; i++) {
	            var agency = agencies[i];
	            selectElement.append("<option value='" + agency.comnCdVal + "'>" + agency.comnCdValNm + "</option>");
	        }

	        // 첫 번째 Ajax 요청이 완료된 후에 두 번째 Ajax 요청 실행
	        $.ajax({
	            url: "${path}/api/user/<%=userID%>.do",
	            type: "GET",
	            success: function(response) {
	                console.log(response);

	                // 서버 응답을 JSON 파싱
	                var jsonResponse = JSON.parse(response);

	                // "userNm"과 "extnNo" 값을 추출
	                console.log(jsonResponse[0]);
	                var userId = jsonResponse[0].userId;
	                var userNm = jsonResponse[0].userNm;
	                var extnNo = jsonResponse[0].extnNo;
	                var userDivCd = jsonResponse[0].userDivCd;

	                // 추출한 값을 출력하거나 다른 용도로 사용할 수 있음
	                console.log("userId: " + userId);
	                console.log("userNm: " + userNm);
	                console.log("extnNo: " + extnNo);
	                console.log("userDivCd: " + userDivCd);

	                $("#userId").val(userId);
	                $("#userNm").val(userNm);
	                $("#extnNo").val(extnNo);
	                $("#role").val(userDivCd);
	            },
	            error: function(xhr, status, error) {
	                // 두 번째 Ajax 요청의 요청 실패 시 실행할 코드
	                alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
	            }
	        });

	    },
	    error: function(xhr, status, error) {
	        // 첫 번째 Ajax 요청의 요청 실패 시 실행할 코드
	        alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
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
										<option id="" value="" selected>선택</option>
										<option id="" value="${path}/page/setting_system.do">시스템 정보</option>
										<option id="" value="${path}/page/setting_font.do">폰트종류</option>
										<option id="" value="${path}/page/setting_size.do">폰트크기</option>
										<option id="" value="${path}/page/setting_my.do" selected>마이페이지</option>
								</select>	
						</div>	
					
						
						<div class="setting_content">
							<div class="my_choice">
								<ul>
									<li><label for="">사용자 ID</label><input id="userId" type="text" size="20" maxlength="30" name="" value="" readonly></li>
									<li><label for="">사용자 이름</label><input id="userNm" type="text" size="20" maxlength="30" name="" value="" readonly></li>
									<li><label for="">내선번호</label><input id="extnNo"type="text" size="20" maxlength="30" name="" value="" readonly></li>
									<li>
									<label for="">소속그룹</label>
										<select id="role" name='role'>
										</select>
									</li>
									<li>
									

									</li>
								</ul>
							</div>
							<div style="display:flex;direction: rtl;">
								<div id="req_btn" class="setting_btn" style="width:130px; height:50px;">
									<a href="#">저장</a>
								</div>
							</div>

						</div>
							
						
					</form>
				</div>
			</section>
			<div id="author_alert_popup">
							<div class="author_alert_head">
								<h3>권한 요청</h3>
							</div>
							<div class="author_alert_con">
								<p>권한을 요청 하시겠습니다?</p>
							</div>
							<div class="author_alert_btn">
							    <a href="#" class="bnt_cancle">취소</a><a href="#"  onclick=permissionReq()>권한요청</a>
							</div>

				</div>
		<!-- right -->
	</div>
	<!-- body -->
</div>


<script> 
	$(document).ready(function(){ 
	$("#req_btn").click(function(){ 
	$("#author_alert_popup").css("display", "block");
	}); 
	$(".author_alert_btn a.bnt_cancle").click(function(){ 
	$("#author_alert_popup").css("display", "none"); 
	}); 
	}); 
	
	

	   
    function permissionReq() {
    	
    
        
        var jsonData = {
        		userId: $("#userId").val(),         // 문자열 데이터
        		athrTypeCd: $("#role").val(),         // 문자열 데이터
        		userNm: $("#userNm").val(),         // 문자열 데이터
    			extnNo: $("#extnNo").val(),       // 문자열 데이터
    			
        
        };
        
 	   $.ajax({
 	           url: "${path}/api/"+$("#userId").val()+"/permission/req/"+$("#role").val()+".do",
 	                    type: "POST",
 		                data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
 		                contentType: "application/json", // 요청 본문의 데이터 타입 설정
 	   	       
 	                    success: function(response) {
 	                    	
 	                    	if(response=="true")
 	                    	{
 	 	                    	alert("요청이 완료되었습니다.");
 	 	                    	$("#author_alert_popup").css("display", "none"); 
 	                    		
 	                    	}
 	                    	else
 	                    	{
 	 	                    	alert("요청이 실패하였습니다.");
 	 	                    	$("#author_alert_popup").css("display", "none"); 
 	                    		
 	                    	}
 	                        
 	                    },
 	                    error: function(xhr, status, error) {
 	                        // 요청 실패 시 실행할 코드
 	                        alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
 	                    }
 	                });
 	   
        // 만약 원래 링크의 동작을 중지하고 싶다면 (예: 페이지 이동을 방지)
       
    }
</script>
</body>
</html>