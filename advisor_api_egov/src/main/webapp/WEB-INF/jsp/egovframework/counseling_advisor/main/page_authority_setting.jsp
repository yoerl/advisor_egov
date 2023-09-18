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
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/base.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/pagenation.css'/>"/>
    <script src="<c:url value='/js/egovframework/pagenation.js' />"></script>	
    
    
    
    <script>
    
        $(document).ready(  function() {
			  
	    		
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

            
            

            $.ajax({
                type: "GET", // HTTP 요청 방식 (GET, POST 등)
                url: "${path}/api/permission/req.do",
                /* dataType: "json", // 응답 데이터 형식 (JSON, XML 등) */
                success: function(jsonString) {
                    var jsonArray = JSON.parse(jsonString);
                    // 요청 성공 시 실행될 함수
                    console.log("AJAX  성공: " + jsonString);
                    
    			    for (var i = 0; i < jsonArray.length; i++) {
    			    	
    			        var item = jsonArray[i];
    			        

                        var newRow = '<tr>' +
                                        '<td>'+item.userNm+'</td>' +
                                        '<td>'+item.athrCd+'</td>' +
                                        '<td><a href="#" id="btn_autho_setting" class="btn_autho_setting"  data-user_div_cd="'+item.athrCd+'"  data-user_id="'+item.userId+'">승인</a></td>' +
                                    '</tr>';
                       
    			    }
                    // 새로운 행을 생성하고 데이터를 추가합니다.
                    
                    // 테이블에 새로운 행을 추가합니다.
                    $('#group_setting_con tbody').append(newRow);
                    

                    // id가 btn_autho_setting인 요소를 클릭할 때 이벤트 핸들러를 등록합니다.
                    $(".btn_autho_setting").click(function() {
                        // 클릭된 요소의 data-user_id 값을 가져옵니다.
                        var userId = $(this).data('user_id');
                        var userDivId = $(this).data('user_div_cd');
                        
                        // userId 값을 출력하거나 다른 작업을 수행할 수 있습니다.
                        console.log('data-user_id 값:', userId);
                        console.log('data-user_id 값:', userDivId);
                        
                        
                        
                        
                        
                        var jsonData = {
                        		userId: userId,         // 문자열 데이터
                        		userDivCd: userDivId,         // 문자열 데이터
                        };
                        
                        
                        $.ajax({
                            url: "${path}/api/permission/"+userId+".do", // 엔드포인트 URL
                            type: "PUT", // HTTP DELETE 메서드 사용
     		                data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
     		                contentType: "application/json", // 요청 본문의 데이터 타입 설정
                            success: function(response) {

								if(response=="true")
								{
									alert("권한을 승인하였습니다.");
									location.reload();
									
								}
								else
								{
									alert("권한 승인에 실패하였습니다.");
								}
                            	
                            	
                            },
                            error: function(xhr, status, error) {
                                // 요청 실패 시 실행할 코드
                                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                            }
                        });
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    });
                    
                    ﻿
                   
                    
                    
                    
                    
                    
                    
                    
                    
                    
    				
                    
                    
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
					
						<div class="btn_close"><a href="/advisor_api_egov/page/home.do"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a></div>
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
					<form name="" method="" action="">
						<div class="setting_keyword">
							<select name="" onchange="window.open(value,'_self');">
									<option id="" value="${path}/page/authority.do">선택</option>
									<option id="" value="${path}/page/authority_group.do" selected>그룹권한</option>
									<option id="" value="${path}/page/authority_setting.do" selected>그룹 참여자 설정</option>
								</select>
								
						</div>	
						<div class="group_content">
							<div class="group_head">
								<select name="agent">
								</select>
								<select name="role">
								</select>
								
							</div>
							<div class="group_setting_con">
								<table id="group_setting_con" e width="100%" border="0" cellspacing="0" cellpadding="0">
								
									<caption></caption>
									
								  <tr>
									<th>사용자명</th>
									<th>내선번호</th>
									<th>관리</th>
								  </tr>
								  
								</table>	
								
							</div>
						</div>
						<!-- 삭제팝업창 -->
						<div id="author_alert_popup">
							<div class="author_alert_head">
								<h3>승인</h3>
							</div>
							<div class="author_alert_con">
								<p>사용자명(1234)의 리더로 승인하시겠습니까?</p>
							</div>
							<div class="author_alert_btn">
								<a href="" class="bnt_cancle">취소</a><a href="">승인</a>
							</div>
						</div>
					<!-- 삭제팝업창 -->
					</form>
				</div>
					<div class="code-html pagenation">
						<div id="pagination1" class="tui-pagination"><span class="tui-page-btn tui-is-disabled tui-first"><span class="tui-ico-first">first</span></span><span class="tui-page-btn tui-is-disabled tui-prev"><span class="tui-ico-prev">prev</span></span><strong class="tui-page-btn tui-is-selected tui-first-child">1</strong><a href="#" class="tui-page-btn">2</a><a href="#" class="tui-page-btn">3</a><a href="#" class="tui-page-btn">4</a><a href="#" class="tui-page-btn">5</a><a href="#" class="tui-page-btn tui-next-is-ellip tui-last-child"><span class="tui-ico-ellip">...</span></a><a href="#" class="tui-page-btn tui-next"><span class="tui-ico-next">next</span></a><a href="#" class="tui-page-btn tui-last"><span class="tui-ico-last">last</span></a></div>	
					</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>
<script class="code-js">
	var pagination1 = new tui.Pagination('pagination1', {
		totalItems: 500,
		itemsPerPage: 10,
		visiblePages: 5
	});
</script>
<script> 

</script>
</body>
</html>