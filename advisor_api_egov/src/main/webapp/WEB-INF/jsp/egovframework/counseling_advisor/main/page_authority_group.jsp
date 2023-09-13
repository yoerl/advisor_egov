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
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/font.css'/>"/>
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
    
    
    <script>
    
        $(document).ready(  function() {
			  
	    		

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
                    selectElement.append("<option value=''>기관명</option>");
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


                        var targetElement = document.querySelector(".group_menu ul");
                        targetElement.innerHTML = ''; // ul 요소 초기화

                        var jsonArray = JSON.parse(response);
                        for (var i = 0; i < jsonArray.length; i++) {
                        	
                            var item = jsonArray[i];
                            

                            console.log(jsonArray[i]);

                            console.log("8888888888888888888888888888888888888");
                            console.log(item.comnCdValNm);
                            
                            var element = document.createElement("li");

                            element.innerHTML += '<a href="#" onclick="setActive(' + i + ')">' + item.comnCdValNm + '</a>';

                            targetElement.appendChild(element);
                        }
                        
                        

                        $("#group_menu").css("display", "block");
                      	// 첫 번째 AJAX 요청
                    	$.ajax({
                    	    url: "${path}/api/common/data/agentList.do",
                    	    type: "GET",
                    	    success: function(response) {
                    	        var agencies = JSON.parse(response);
                    	        var selectElement = $("select[name='agent']");
                    	        selectElement.append("<option value=''>기관을 선택하세요.</option>");

                    	        for (var i = 0; i < agencies.length; i++) {
                    	            var agency = agencies[i];
                    	            selectElement.append("<option value='" + agency.comnCdVal + "'>" + agency.comnCdValNm + "</option>");
                    	        }

                    	        // 첫 번째 요청이 완료되면 두 번째 AJAX 요청 실행
                    	        // 두 번째 AJAX 요청 코드를 이곳에 넣어주세요.

                    	        // 두 번째 AJAX 요청
                    	        $.ajax({
                    	            url: "${path}/api/common/data/roleList.do",
                    	            type: "GET",
                    	            success: function(response) {
                    	                var roles = JSON.parse(response);
                    	                var selectElement = $("select[name='role']");
                    	                selectElement.append("<option value=''>그룹을 선택하세요.</option>");

                    	                for (var i = 0; i < roles.length; i++) {
                    	                    var role = roles[i];
                    	                    selectElement.append("<option value='" + role.comnCdVal + "'>" + role.comnCdValNm + "</option>");
                    	                }
                    	            },
                    	            error: function(xhr, status, error) {
                    	                alert("두 번째 요청 실패: " + error);
                    	            }
                    	        });
                    	    },
                    	    error: function(xhr, status, error) {
                    	        alert("첫 번째 요청 실패: " + error);
                    	    }
                    	});

                        
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
						</a>권한설정
					</h2>
					
					<div class="btn_close"><span><a href="/advisor_api_egov/page/home.do"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				</div>
				<div class="right_contents" style="height:100%;">
					<div class="notice_con_inner">
					<form name="" method="" action="">
						<div class="setting_keyword">
								<select name="menu" onchange="window.open(value,'_self');">
									<option id="" value="${path}/page/authority.do">선택</option>
									<option id="" value="${path}/page/authority_group.do" selected>그룹권한</option>
									<option id="" value="${path}/page/authority_setting.do" >그룹 참여자 설정</option>
								</select>
								
						</div>	
						<div class="group_content">
							<div class="group_head">
									<select name="agent" id="agentSelect"> <!-- id 속성 추가 -->
									    <!-- 옵션 추가할 수 있음 -->
									</select>
							</div>
							<div class="group_authority_con">
							<div class="group_menu"  id="group_menu" style="display:none">
							  <ul>
							   <!-- <li><a href="#" onclick="setActive(0)">시스템 관리자</a></li>
							    <li><a href="#" onclick="setActive(1)">기관 관리자</a></li>
							    <li><a href="#" onclick="setActive(2)">운영 관리자</a></li>
							    <li><a href="#" onclick="setActive(3)">강사</a></li>
							    <li><a href="#" onclick="setActive(4)">팀장</a></li>
							    <li><a href="#" onclick="setActive(5)">부팀장</a></li>
							    <li><a href="#" onclick="setActive(6)">상담</a></li> --> 
							  </ul>
							</div>
								 <div class="group_autho_list"  id="group_autho_list" style="display:none">
								 
								 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<caption></caption>
									  <tr>
										<th></th>
									  </tr>
									  <tr>
										<td rowspan="6" class="border_none p30">메뉴권한</td>
										<td  class="border_none w30">메모</td>
										<td  class="border_none w20"><span class="radios"><input type="radio"  name = "memo" id="font_rd1"> <label for="font_rd1">미사용</label></span></td>
										<td  class="border_none w20"><span class="radios"><input type="radio"  name = "memo" id="font_rd2"> <label for="font_rd2">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">이력</td>
										<td class="w20"><span class="radios"><input type="radio" name = "history" id="font_rd3"> <label for="font_rd3">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "history"id="font_rd4"> <label for="font_rd4">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">설정</td>
										<td class="w20"><span class="radios"><input type="radio"  name = "setting" id="font_rd5"> <label for="font_rd5">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "setting" id="font_rd6"> <label for="font_rd6">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">모니터링</td>
										<td class="w20"><span class="radios"><input type="radio"  name = "monitering" id="font_rd7"> <label for="font_rd7">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "monitering" id="font_rd8"> <label for="font_rd8">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">권한설정</td>
										<td class="w20"><span class="radios"><input type="radio"  name = "pemission" id="font_rd9"> <label for="font_rd9">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "pemission"id="font_rd10"> <label for="font_rd10">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">공지사항</td>
										<td class="w20"><span class="radios"><input type="radio"  name = "notice" id="font_rd11"> <label for="font_rd11">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "notice"id="font_rd12"> <label for="font_rd12">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">공동지식보기 권한</td>
										<td class="w30">

										<select name="agent">
										</select>

										</td>
										<td class="w20"><span class="radios"><input type="radio"  name = "know" id="font_rd13"> <label for="font_rd13">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "know" id="font_rd14"> <label for="font_rd14">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">시스템 점검</td>
										<td class="w30"></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "systemcheck" id="font_rd15"> <label for="font_rd15">미정검중</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "systemcheck" id="font_rd16"> <label for="font_rd16">정검중</label></span></td>
									  </tr>
									</table>
								 
								 
								 						
								</div> 
							</div>
						</div>
							<div class="setting_btn">
								<a href="">저장</a>
							</div>

					</form>
				</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>

<script>
function setActive(index) {
  // 모든 메뉴 항목의 "active" 클래스 제거
  const menuItems = document.querySelectorAll(".group_menu ul li a");
  menuItems.forEach(item => {
    item.classList.remove("active");
  });

  // 클릭한 메뉴 항목에 "active" 클래스 추가
  menuItems[index].classList.add("active");
  
  

  $("#group_autho_list").css("display", "block");
  
  
}


</script>


</body>
</html>