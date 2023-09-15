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
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/base.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>
    <script>
    $(document).ready(function() {
        $.ajax({
            type: "GET", // HTTP 요청 방식 (GET, POST 등)
            url: "/advisor_api_egov/hello.do", // 요청할 URL
            /* dataType: "json", // 응답 데이터 형식 (JSON, XML 등) */
            success: function(jsonString) {
                var jsonArray = JSON.parse(jsonString);
                // 요청 성공 시 실행될 함수
                console.log("AJAX  성공: " + jsonString);
                

				var ulElement = document.querySelector(".board_view_inner");
				ulElement.innerHTML = '';
				
			    for (var i = 0; i < jsonArray.length; i++) {
			    	
			        var item = jsonArray[i];
			        var liElement = document.createElement("p");
		
			        liElement.innerHTML += '' +
			        '<a href=${path}/page/news_view.do>' +
				        '<p>' + item.notiTitlNm + '</p>' +
				        '<span class="notice_date">'+item.amntDttm+'</span>' +
			        '</a>' +
			        '<div class="manager">' +
			        '<span>'+item.rgsrId+'</span>' +
			        '<a href="#" class="btn_del_con">삭제</a>' 
			        
			        ulElement.appendChild(liElement);
			        

		            
		            
			    }
                
                
            },
            error: function(request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
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
			<section id="sub_right_con">
				<div class="right_title">
					<h2>
						<a href="javascript:history.go(-1);">
							<img src="../images/icons/arrow-left.png" alt="">
						</a>공지사항 제목표시</h2>
					
					<div class="btn_close">
						<a href="${path}/page/home.do">
							<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
						</a>
					</div>
				</div>
				<div class="right_contents">
					<div class="view_con_inner">
						<div class="board_data"><p>작성자명&nbsp; | &nbsp;2023.01.01 12:12</p></div>
						<div class="news_view_content">
						<div class="board_view_inner">
							<p> Diam ut sed eu aliquam. Nisl nulla enim sit viverra elit. Commodo arcu ut vivamus morbi viverra bibendum. Porta erat vitae feugiat maecenas sit pharetra lectus volutpat. Feugiat donec arcu pellentesque posuere. Eget nam egestas interdum consequat at vestibulum. Id sapien vitae elementum eu neque. A tempus ut aliquet quis at risus nunc elit. Commodo donec quam id vel venenatis nunc tincidunt quis vel. Molestie rhoncus commodo pharetra non nullam vitae enim. Pretium sagittis nullam nec nulla venenatis ornare dui nibh commodo.
In blandit mus nibh pellentesque augue sit sit sem tempor. Massa sapien nulla bibendum elementum pharetra urna semper lectus. Magnis consequat ornare vulputate fermentum ut pulvinar consequat. A ut nec sed tellus dictumst. Porttitor malesuada pharetra cursus sit quam. Netus integer volutpat commodo orci rutrum lacus vitae nec faucibus. Feugiat sit vitae odio natoque convallis urna pulvinar.
Ultricies vestibulum aenean diam volutpat nisl neque auctor. Egestas id cursus blandit pulvinar amet dictum. Sit donec turpis faucibus ullamcorper risus integer nunc ac in. Eu maecenas pellentesque leo varius at nunc quis velit laoreet. Ac auctor posuere consequat lectus faucibus et blandit cras. Nec diam venenatis amet porttitor lectus nibh. Nulla sed sagittis nulla sagittis risus nulla et odio fermentum. Sed sed quis lacus sit nunc ac purus. Pellentesque id massa feugiat sagittis sed vitae amet. Eu egestas rhoncus volutpat purus ullamcorper.
Pellentesque sed praesent maecenas ut diam placerat faucibus quis ullamcorper. Libero mauris bibendum in feugiat elit fermentum ut. Viverra at lacus sit vitae platea vitae justo. Eget mollis congue sit pretium duis. Nulla facilisis phasellus felis tortor rhoncus. Erat vulputate varius tortor scelerisque dolor pellentesque erat. Mus hac nec amet a.
Dictum morbi habitasse suspendisse sit nunc interdum at. Phasellus felis libero pellentesque egestas semper commodo. Lorem massa orci sed lectus odio tristique ultrices varius. Arcu quam diam et nec purus. In morbi elit iaculis tincidunt vulputate eu. Urna nulla euismod cursus at sed commodo. Mattis euismod eu gravida aenean ac ullamcorper. Velit quam feugiat arcu eget in auctor. Nulla ultricies rhoncus sed feugiat volutpat elit eleifend lacus velit. Turpis convallis mattis elementum tellus vel sagittis. Nulla mattis faucibus ornare leo tincidunt volutpat nec. Mattis hendrerit nulla quam imperdiet nunc dictum luctus.
Ullamcorper turpis bibendum quis id sit. Et feugiat dui malesuada posuere augue. Aenean phasellus scelerisque morbi dictum viverra placerat at dapibus pharetra. Leo nullam sed lacus urna. Scelerisque consequat dolor tellus tellus. Parturient interdum mauris aliquam viverra ultricies quis. Amet nulla non nunc leo pellentesque eu vitae facilisi.
Lacus hac natoque nullam morbi. Sit ullamcorper molestie turpis condimentum justo scelerisque et. Pellentesque leo tortor nunc in. Risus arcu sed convallis quis ut dictum. Est aliquam et purus velit posuere auctor purus vulputate tincidunt. Scelerisque non hendrerit tincidunt faucibus dui ac tempus. Turpis vel pulvinar scelerisque netus sit eget dis proin sit. Eu morbi eget in risus dictum. In neque vitae convallis eu a. Sagittis ac egestas quam id. Purus morbi parturient sagittis orci ut mattis arcu id elit. Viverra eu ac ut sit at a. Purus varius nec diam elit commodo tincidunt purus porttitor. Sed eget semper semper vitae. Amet arcu arcu aliquam lectus bibendum lacus in.
Mus turpis fames consectetur dignissim blandit vitae nisi. Phasellus turpis urna leo at sed. Quis integer in felis suspendisse donec turpis odio. Aliquet penatibus ut sit et nibh quis risus vitae. Morbi nisl duis mattis quam nulla. Maecenas amet vel commodo suspendisse tortor. Nisl sit fermentum turpis urna sapien id turpis. Purus platea pellentesque viverra ullamcorper elementum massa adipiscing. Ipsum sagittis ipsum senectus nulla a ut magna faucibus vel. Elementum enim phasellus quam at habitasse interdum purus neque. Nulla quis aliquam purus ac urna aenean sed quis amet. A lectus orci mauris in. Sagittis metus dictum interdum tincidunt auctor dignissim id. Consectetur suspendisse in adipiscing massa pellentesque habitasse interdum quam. Et quam sed magna nisi.
Morbi tellus tellus cras mauris morbi urna vitae. Turpis purus dictum tincidunt nulla. Cursus dignissim sit tellus nunc amet lacus risus faucibus phasellus. Magnis in porttitor in ipsum suscipit. In tempor nisl lectus feugiat ut convallis sed.
Tempus pulvinar malesuada vulputate lacus leo. Nunc enim in nisi risus in bibendum hendrerit tincidunt. Purus libero ultrices ipsum imperdiet. Sed vestibulum sed neque imperdiet pellentesque justo nibh. Dui porttitor massa id sollicitudin sit tortor tincidunt. Pulvinar consequat enim elementum adipiscing. Tempus nam purus malesuada nunc eros mattis est. Lacus mi quam lacus at laoreet. Blandit lacus ultricies dolor interdum.
</p></div>
						</div>
						<!-- button -->
						<div class="board_bottom_btn">
							<a href="${path}/page/news_modify.do">수정</a>
						
						</div>
						<!-- button -->
					
					</div>
				</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>
</body>
</html>