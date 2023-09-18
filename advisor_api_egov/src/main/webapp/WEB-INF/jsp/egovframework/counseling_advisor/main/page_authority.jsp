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
    
        
    <script>
    
        $(document).ready(  function() {
			  
	    		/* document.getElementById("font_rd2").checked = true;
	    		document.getElementById("font_rd4").checked = true;
	    		document.getElementById("font_rd6").checked = true;
	    		document.getElementById("font_rd8").checked = true;
	    		document.getElementById("font_rd10").checked = true;
	    		document.getElementById("font_rd12").checked = true;
	    		document.getElementById("font_rd14").checked = true;
	    		document.getElementById("font_rd16").checked = true; */
	    		

            // AJAX DELETE 요청 보내기
            $.ajax({
            	///api/common/data.do
                //url: "${path}/api/common/agency.do", // 엔드포인트 URL
                
                url: "${path}/api/common/data/agentList.do", // 엔드포인트 URL
                type: "GET", // HTTP DELETE 메서드 사용
                success: function(response) {
                	//console.log(response);
                	
                    // JSON 데이터 파싱
                    var agencies = JSON.parse(response);

                    // select 요소 선택
                    var selectElement = $("select[name='agent']");

                    // 기관명 옵션 추가
                    selectElement.append("<option value=''>기관을 선택하세요.</option>");
                    // 각 기관 옵션 추가
                    for (var i = 0; i < agencies.length; i++) {
                        var agency = agencies[i];
                        selectElement.append("<option value='" + agency.comnCdVal + "'>" + agency.comnCdValNm + "</option>");
                    }
                    

                },
                error: function(xhr, status, error) {
                    // 요청 실패 시 실행할 코드
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
	    		
	    		
            $("#agentSelect").change(function() {
                var selectedAgent = $(this).val(); // 선택된 값 가져오기

                // 선택된 에이전트에 따라 다른 로직 수행 가능
                // 적절한 URL 및 AJAX 요청 등을 여기에 추가

                // 예: 선택된 에이전트 출력
                console.log("Selected Agent: " + selectedAgent);
                
                
                $.ajax({
                    url: "${path}/api/common/data/roleList.do",
                    type: "GET",
                    success: function(response) {
                        console.log(response);

                        var jsonArray = JSON.parse(response);

                        var targetElement = document.querySelector(".group_menu ul");
                        targetElement.innerHTML = ''; // ul 요소 초기화

                        for (var i = 0; i < jsonArray.length; i++) {
                        	
                            var item = jsonArray[i];
                            

                            console.log(jsonArray[i]);

                            console.log("8888888888888888888888888888888888888");
                            console.log(item.comnCdValNm);
                            
                            var element = document.createElement("li");

                            element.innerHTML += '<a href="#" onclick="setActive(' + i + ')">' + item.comnCdValNm + '</a>';

                            targetElement.appendChild(element);
                        }
                        
                        
                        $("#group_autho_list").css("display", "block");

                        
                    },
                    error: function(xhr, status, error) {
                        // 요청 실패 시 실행할 코드
                        alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
                    }
                });
                
                
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
			<a href="${path}/page/setting.do"><i><img src="<c:url value='/images/icons/gnb_03.png'/>" alt=""></i> 설정</a>
			<a href="${path}/page/monitoring.do"><i><img src="<c:url value='/images/icons/gnb_04.png'/>" alt=""></i> 모니터링</a>
			<a href="${path}/page/authority.do" class="active"><i><img src="<c:url value='/images/icons/gnb_05.png'/>" alt=""></i> 권한</a>
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
						</a>권한설정</h2>
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
									<option id="" value="${path}/page/authority.do" selected>선택</option>
									<option id="" value="${path}/page/authority_group.do">그룹권한</option>
									<option id="" value="${path}/page/authority_setting.do" >그룹 참여자 설정</option>
								</select>	
						</div>	
						<p class="no-massage">메뉴를 선택해 주세요.</p>
					</form>
				</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>
</body>
</html>