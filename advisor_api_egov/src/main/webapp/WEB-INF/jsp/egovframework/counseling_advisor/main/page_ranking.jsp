<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String taServer = getServletContext().getInitParameter("taServer");
%>
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
    <link type="text/css" rel="stylesheet" href="<c:url value='/dist/tailwind.min.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/base.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/pagenation.css'/>"/>
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
	<script src="<c:url value='/js/egovframework/sockjs.client.min.js' />"></script>
	<script src="<c:url value='/js/egovframework/stomp-2.3.4.min.js' />"></script>
    <script src="<c:url value='/js/egovframework/pagenation.js' />"></script>	
</head>

<script>

$(document).ready(function() {

	
	performAjaxRequest("trending");
	$("#keyword_type").on("change", function() {
	    // 선택된 value 가져오기
	    var selectedValue = $(this).val();
	    
	    // 선택된 value 출력 또는 다른 작업에 사용하기
	    console.log("선택된 value: " + selectedValue);
	    
	    performAjaxRequest(selectedValue);
	 
	});
	
});



</script>
<style>
    /* ul 요소의 스타일은 변경하지 않습니다. */
    .rangking_data_table ul {
        list-style-type: none;
        padding: 0;
    }

    /* li 요소를 가로로 배치하도록 스타일링합니다. */
    .rangking_data_table li {
        display: flex;
    }

    /* 각 div 요소가 3분의 1 가로 길이를 가지도록 스타일링합니다. */
    .rangking_data_table li div {
        flex: 1;
        text-align: center;
    }
</style>

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
			<section id="rangking_con">
				<div class="rangking_title">
					<h2>
						<a href="javascript:history.go(-1);">
							<img src="../images/icons/arrow-left.png" alt="">
						</a>급상승 키워드</h2>
					
					<div class="btn_close">
						<a href="${path}/page/home.do">
							<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
						</a>
					</div>
				</div>
				<div class="rangking_contents">
					<div class="rangking_con_inner">
						<div class="rangking_keyword">
							<form name="" method="" action="">	
											<select id="keyword_type" name="keyword_type">
											    <option value="trending">급상승 키워드</option>
											    <option value="accumulated">누적 키워드 랭킹</option>
											    <option value="dangerous">위험/블랙 키워드 랭킹</option>
											</select>					
							</form>
						</div>
						<div class="rangking_data_table">
						    <ul>
						        <li class="header"><div>순번</div><div>키워드</div><div>%(건)</div></li>
						    </ul>
						</div>
													
						</div>

					
					</div>
				</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>

<script>
function performAjaxRequest(selectedValue) {
    // 선택된 값에 따라 다른 작업 수행
    if (selectedValue === "trending") {

    	
			$.ajax({
			    type: "GET",
			    url: "http://<%= taServer %>/api/dashboard/rank/rising",
			    data: {
			        date_from: "2023-04-14",
			        day_count: 1,
			        top_rank: 5,
			        rank_type: "RISING_SUDDEN"
			    },
			    success: function(data) {

			          var jsonString = JSON.stringify(data, null, 2);
			          console.log("AJAX 성공: \n" + jsonString);
			    	
			        var returnObject = data.returnObject; // "returnObject" 객체 가져오기

			        // "2023.04.14" 키에 해당하는 배열을 가져옴
			        var dataArray = returnObject["2023.04.14"];


			      //  var trToRemove = $("#keyword_table tr"); // 예시로 순번이 4인 <tr> 요소를 선택합니다.

		            // 선택한 <tr> 요소의 모든 자식 요소를 삭제합니다.
		            //trToRemove.empty();
			        $(".rangking_data_table li.rangking_data").remove();
			        
			        if (dataArray) {
			            for (var i = 0; i < dataArray.length; i++) {
			                var term = dataArray[i].term; // "term" 속성 가져오기
			                var weight = dataArray[i].weight; // "weight" 속성 가져오기
			                var rank = dataArray[i].rank; // "rank" 속성 가져오기
			                var df = dataArray[i].df; // "df" 속성 가져오기
			                var beforeRank = dataArray[i].beforeRank; // "beforeRank" 속성 가져오기
			                var score = dataArray[i].score; // "score" 속성 가져오기

			                // 가져온 데이터를 원하는 방식으로 처리
			                console.log("term: " + term);
			                console.log("weight: " + weight);
			                console.log("rank: " + rank);
			                console.log("df: " + df);
			                console.log("beforeRank: " + beforeRank);
			                console.log("score: " + score);
			                
			               		var ulElement = $(".rangking_data_table ul");
			                    var newLi = $("<li class='rangking_data'><div>" + dataArray[i].rank + "</div><div>" + dataArray[i].term + "</div><div>" + dataArray[i].score + "</div></li>");
			                    ulElement.append(newLi);
			                    
			                    
			            }
			        }
			    },
			    error: function(request, status, error) {
			        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    }
			});

    	  
        // 급상승 키워드에 대한 동작 수행
    } else if (selectedValue === "accumulated") {

    	
		$.ajax({
		    type: "GET",
		    
		    url: "http://<%= taServer %>/api/dashboard/rank/top",
		    //url: "http://192.168.22.160:8081/api/dashboard/rank/top",
		    data: {
		        date_from: "2023-04-14",
		        day_count: 1,
		        top_rank: 5,
		        rank_type: "RISING_SUDDEN"
		    },
		    success: function(data) {

		          var jsonString = JSON.stringify(data, null, 2);
		          console.log("AJAX 성공: \n" + jsonString);
		    	
		        var returnObject = data.returnObject; // "returnObject" 객체 가져오기

		        // "2023.04.14" 키에 해당하는 배열을 가져옴
		        var dataArray = returnObject["2023.04.14"];


		      //  var trToRemove = $("#keyword_table tr"); // 예시로 순번이 4인 <tr> 요소를 선택합니다.

	            // 선택한 <tr> 요소의 모든 자식 요소를 삭제합니다.
	            //trToRemove.empty();
		        $(".rangking_data_table li.rangking_data").remove();
		        
		        if (dataArray) {
		            for (var i = 0; i < dataArray.length; i++) {
		                var term = dataArray[i].term; // "term" 속성 가져오기
		                var weight = dataArray[i].weight; // "weight" 속성 가져오기
		                var rank = dataArray[i].rank; // "rank" 속성 가져오기
		                var df = dataArray[i].df; // "df" 속성 가져오기
		                var beforeRank = dataArray[i].beforeRank; // "beforeRank" 속성 가져오기
		                var score = dataArray[i].score; // "score" 속성 가져오기

		                // 가져온 데이터를 원하는 방식으로 처리
		                console.log("term: " + term);
		                console.log("weight: " + weight);
		                console.log("rank: " + rank);
		                console.log("df: " + df);
		                console.log("beforeRank: " + beforeRank);
		                console.log("score: " + score);
		                
		               		var ulElement = $(".rangking_data_table ul");
		                    var newLi = $("<li class='rangking_data'><div>" + dataArray[i].rank + "</div><div>" + dataArray[i].term + "</div><div>" + dataArray[i].score + "</div></li>");
		                    ulElement.append(newLi);
		                    
		                    
		            }
		        }
		    },
		    error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }
		});
        // 누적 키워드 랭킹에 대한 동작 수행
    } else if (selectedValue === "dangerous") {

		$.ajax({
		    type: "GET",
		    url: "http://<%= taServer %>/api/dashboard/rank/black",
		    data: {
		        date_from: "2023-04-14",
		        day_count: 1,
		        top_rank: 5,
		        rank_type: "RISING_SUDDEN"
		    },
		    success: function(data) {

		          var jsonString = JSON.stringify(data, null, 2);
		          console.log("AJAX 성공: \n" + jsonString);
		    	
		        var returnObject = data.returnObject; // "returnObject" 객체 가져오기

		        // "2023.04.14" 키에 해당하는 배열을 가져옴
		        var dataArray = returnObject["2023.04.14"];


		      //  var trToRemove = $("#keyword_table tr"); // 예시로 순번이 4인 <tr> 요소를 선택합니다.

	            // 선택한 <tr> 요소의 모든 자식 요소를 삭제합니다.
	            //trToRemove.empty();
		        $(".rangking_data_table li.rangking_data").remove();
		        
		        if (dataArray) {
		            for (var i = 0; i < dataArray.length; i++) {
		                var term = dataArray[i].term; // "term" 속성 가져오기
		                var weight = dataArray[i].weight; // "weight" 속성 가져오기
		                var rank = dataArray[i].rank; // "rank" 속성 가져오기
		                var df = dataArray[i].df; // "df" 속성 가져오기
		                var beforeRank = dataArray[i].beforeRank; // "beforeRank" 속성 가져오기
		                var score = dataArray[i].score; // "score" 속성 가져오기

		                // 가져온 데이터를 원하는 방식으로 처리
		                console.log("term: " + term);
		                console.log("weight: " + weight);
		                console.log("rank: " + rank);
		                console.log("df: " + df);
		                console.log("beforeRank: " + beforeRank);
		                console.log("score: " + score);
		                
		               		var ulElement = $(".rangking_data_table ul");
		                    var newLi = $("<li class='rangking_data'><div>" + dataArray[i].rank + "</div><div>" + dataArray[i].term + "</div><div>" + dataArray[i].score + "</div></li>");
		                    ulElement.append(newLi);
		                    
		                    
		            }
		        }
		    },
		    error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }
		});
    }
	
	
}
</script>
</body>
</html>