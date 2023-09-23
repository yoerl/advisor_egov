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
    	
    	fnSearch(1);
    	
    });
    
    function fnSearch(currentPage) {
    	
    	//var frm = $("#frm").serialize();
    	
	    $.ajax({
		    type: "GET",
		    url: "${path}/api/news.do",
		    /* dataType: "json", */
		    data : {"currentPage" : currentPage},
		    success: function(jsonString) {
		        var jsonArray = JSON.parse(jsonString);
		        console.log("AJAX 성공: " + jsonString);

				// 안읽은 알람 count
				let noReadCnt = 0;
				
				let html = "";
				
		        for (var i = 0; i < jsonArray.length; i++) {
		        	
		            var item = jsonArray[i];
	    	        console.log("AJAX 성공: " + item.newsSqno);
		            
		        	// 안읽은 알람 count
		        	if(item.readYn == 'N') noReadCnt++;
		        	
		        	html += "<li>";
		        	html += "	<div class='checkbox'>";
		        	html += "		<span>";
		        	html += "			<input type='checkbox' id='check" + i + "' name='chk" + i + "' value='" + item.newsSqno + "'>";
		        	html += "			<label for='check" + i + "'></label>";
		        	html += "		</span>";
		        	html += "	</div>";
		        	html += "	<a href='${path}/page/news_view.do?newsSqno=" + item.newsSqno + "'";
		        	if(item.readYn == "Y") {
		        		html += "	class='visited'";
		        	}
		        	html += ">";
		        	html += "		<p>" + item.newsCntn + "</p>";
		        	html += "		<span class='notice_date'>" + item.rgsnDttm + "</span>";
		        	html += "	</a>";
		        	html += "</li>";

		        }
		        
		        $('.news-list').html(html);
		        
		        // 페이징
		        fnPaging(jsonArray[0].pagination);
		        
		        // 안읽은 알람 cnt set
		        if(noReadCnt > 99) noReadCnt = "99+";
		        $("#nrdCnt").html(noReadCnt);
	
		    },
		    error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }
		});
	    
    }
    
    // 전체선택 클릭 함수
    function fnSelAllBtn() {
    	let chkBox = $(".checkbox input[type=checkbox]");
    	let chkAllYn = $("#chkAllYn");

    	if(chkAllYn.val() == "N") {
	    	chkBox.prop("checked", true);
	    	chkAllYn.val("Y");
    	} else {
    		chkBox.prop("checked", false);
    		chkAllYn.val("N");
    	}
    }
    
    // 읽음처리 클릭 함수
    function fnReadAct() {
    	
		var chkArry = new Array();
		
		$(".checkbox input[type='checkbox']:checked").each(function() {
			chkArry.push($(this).val());
		});
		
		if(chkArry.length < 1) {
			alert("읽음처리 할 항목을 선택해주세요.");
			return false;
		}
		
		console.log("chkArry :: " + chkArry);
		
		
    	$.ajax({
		    type: "GET",
		    url: "${path}/api/newsRead.do",
		    /* dataType: "json", */
		    data : { "chkArry" : chkArry },
		    success: function(jsonString) {
		    	
		    	fnSearch(1);
		    	
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
			<a href="${path}/page/news.do" class="push"><span id="nrdCnt">99+</span></a>
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
						<div class="view_total">
							<button type="button" class="btn_ranking"  onClick="location.href='${path}/page/ranking.do'">키워드 랭킹</button>
							<div class="alim_button">
								<input type="hidden" id="chkAllYn" value="N">
								<a href="#" class="btn_choice_total" onclick="fnSelAllBtn();">전체선택</a>
								<a href="#" class="btn_view_total" onclick="fnReadAct();">읽음처리</a>
							</div>
						</div>
						<script>
							/* $(document).ready(function() {
								$('.btn_view_total').on("click",function(){
								   $('.notice-list li a').addClass("visited");
								  });
							 }); */
						</script>
					<!-- notice-list -->
					<form id="frm" name="frm" method="post">
						<ul class="news-list"></ul>
					</form>
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
		/* $("a.btn_del_con").click(function(){ 
			$("#del_alert_popup").css("display", "block");
		}); 
		
		$(".del_alert_btn a.bnt_cancle").click(function(){ 
			$("#del_alert_popup").css("display", "none"); 
		});  */
	
	
/* 	// 모든 체크박스를 선택합니다.
	const checkboxes = document.querySelectorAll('.checkbox input[type="checkbox"]');

	// 각 체크박스를 클릭합니다.
	checkboxes.forEach(checkbox => {
	  checkbox.checked = true; // 체크박스를 클릭(선택)합니다.
	}); */
	
	
	}); 
	
	/* // "btn_choice_total" 클래스를 가진 링크 요소를 가져옵니다.
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
	}); */

	
</script>
</body>
</html>



