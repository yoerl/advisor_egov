
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
    <script src="<c:url value='/js/egovframework/common.js' />"></script>	
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/pagenation.css'/>"/>
    <script>
    $(document).ready(function() {
    	
    	
    	$(document).on("click", "#btn_del", function() {

            // AJAX DELETE 요청 보내기
            $.ajax({
                url: "${path}/api/notice/" + $(this).data("noti_sqno") + ".do", // 엔드포인트 URL
                type: "DELETE", // HTTP DELETE 메서드 사용
                success: function(response) {
                    // 요청 성공 시 실행할 코드
                    if (response === "true") {
                        alert("공지사항이 삭제되었습니다.");
                        // 삭제 성공 후 필요한 동작 수행
                        location.reload();
                    } else {
                        alert("공지사항 삭제에 실패하였습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    // 요청 실패 시 실행할 코드
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
    	});
    	
    	fnSearch(1);
    	
    });

    	
    function fnSearch(currentPage) {

		$.ajax({
			type: "GET", // HTTP 요청 방식 (GET, POST 등)
			url: "${path}/api/notices.do",
			/* dataType: "json", // 응답 데이터 형식 (JSON, XML 등) */
			data : {"currentPage" : currentPage},
			success: function(jsonString) {
				var jsonArray = JSON.parse(jsonString);
				// 요청 성공 시 실행될 함수
				console.log("AJAX  성공: " + jsonString);
				
	
				var ulElement = document.querySelector(".board-list");
				ulElement.innerHTML = '';
				
				for (var i = 0; i < jsonArray.length; i++) {
					
					var item = jsonArray[i];
					console.log("AJAX  성공2222: " + item.amntDttm);
					var liElement = document.createElement("li");
		
					liElement.innerHTML += '' +
					'<a href=${path}/page/notice_view.do?notiSqno='+item.notiSqno+'>' +
					'<p>' + item.notiTitlNm + '</p>' +
					'<span class="notice_date">'+item.rgsnDttmStr+'</span>' +
					'</a>' +
					'<div class="manager">' +
					'<span>'+item.rgsrNm+'</span>' +
					'<a href="#" id="btn_del" data-noti_sqno='+item.notiSqno+' class="btn_del_con">삭제</a>' +
					'</div>';
					
					ulElement.appendChild(liElement);
					
				}
				// 페이징 적용
				fnPaging(jsonArray[0].pagination);
			},
			error: function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});

	}

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
							<input type="hidden" id="currentPage" value=""/>
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
						</a>공지사항</h2>
					
					<div class="btn_close">
						<a href="${path}/page/home.do">
							<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
						</a>
					</div>
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
					<form name="" method="" action="">
						<div class="board_write_btn">
								<a href="${path}/page/notice_write.do">등록</a>		
						</div>
						<ul class="board-list">
							 <li>
							</li>
						</ul>

						
					<!-- pagenation -->
						
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
								<a href="#" class="bnt_cancle">취소</a><a href="">삭제</a>
							</div>
						</div>
					<!-- 삭제팝업창 -->
					</form>
					
					<!-- 페이징 -->
					<div class="code-html pagenation" id="pageArea"></div>
					
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