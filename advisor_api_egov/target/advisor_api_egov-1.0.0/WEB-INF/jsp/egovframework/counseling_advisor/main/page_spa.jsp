<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String messageServerIp = getServletContext().getInitParameter("messageServerIp");

String intt_cd = (String) session.getAttribute("intt_cd");
%>

<%

String user_id = (String) session.getAttribute("user_id");
String role_power = (String) session.getAttribute("role_power");
String agencyInfo = (String) session.getAttribute("agencyInfo");

String menu_permission = (String) session.getAttribute("menu_permission");
String menu_setting = (String) session.getAttribute("menu_setting");
String menu_history = (String) session.getAttribute("menu_history");
String menu_know = (String) session.getAttribute("menu_know");
String menu_memo = (String) session.getAttribute("menu_memo");
String menu_monitering = (String) session.getAttribute("menu_monitering");
String menu_notice = (String) session.getAttribute("menu_notice");


%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="cache-control" content="no-cach, no-store, must-revalidate" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="expires" content="0">
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
    <script src="<c:url value='/js/egovframework/ckeditor5_31.1.0_ckeditor.js' />"></script>	
    <script src="<c:url value='/js/egovframework/ckeditor5_34.0.0_translations_ko.js' />"></script>	

</head>

<body>
<div id="wrap">
    <form id="pageInfoFrm" method="post">
        <input type="hidden" name="url">
        <input type="hidden" name="param">
    </form>
    <header id="header">
        <div id="logo">
            <a href="javascript:fnPageLoad('${path}/page/answer.do','');">
                <img src="<c:url value='/images/icons/mark.png'/>" alt="">
                <span>농촌진흥청</span>
            </a>
        </div>
        <nav id="gnb">
        
        <% 

			if("Y".equals(menu_memo))
			{
			
        %>
            <a href="javascript:fnPageLoad('${path}/page/summary.do','');"><i><img src="<c:url value='/images/icons/gnb_01.png'/>" alt=""></i> 요약</a>
        <% 
			}

			if("Y".equals(menu_history))
			{
			
        %>
            <a href="javascript:fnPageLoad('${path}/page/history.do','');"><i><img src="<c:url value='/images/icons/gnb_02.png'/>" alt=""></i> 이력</a>
        <% 
   			}
   			if("Y".equals(menu_setting))
   			{
   			
        %>
            <a href="javascript:fnPageLoad('${path}/page/setting.do','');"><i><img src="<c:url value='/images/icons/gnb_03.png'/>" alt=""></i> 설정</a>
        <% 	
   			}
        	if("Y".equals(menu_monitering))
			{
        %>
            <a href="javascript:fnPageLoad('${path}/page/monitoring.do','');"><i><img src="<c:url value='/images/icons/gnb_04.png'/>" alt=""></i> 모니터링</a>
        <% 
			}
        	if("Y".equals(menu_permission))
			{
        %>
            <a href="javascript:fnPageLoad('${path}/page/authority.do','');"><i><img src="<c:url value='/images/icons/gnb_05.png'/>" alt=""></i> 권한</a>
        <% 
			}
        %>
            <a href="#" id="btn_logout"><i><img src="<c:url value='/images/icons/gnb_06.png'/>" alt=""></i> 로그아웃</a>
        </nav>
            
        <div id="lnb">
        <% 
			if("Y".equals(menu_notice))
			{
        %>
            <a href="javascript:fnPageLoad('${path}/page/notice.do','');" class="call"></a>
            
        <% 
			}
        %>
            <a href="javascript:fnPageLoad('${path}/page/news.do','');" class="push"><span id="nrdCnt"></span></a>
   
        </div>
    </header>
    
    <div id="container">
        <section id="charting">
            <div class="chating_inner">
                
                <div id="no_calling" style="height: 100%; display: flex; justify-content: center; align-items: center;">
                    <p> 현재 통화 상태가 아닙니다. </p>
                </div>
                
                <div id="chating_head" class="chating_head" style="display:none;">
                </div>
                <div class="chating_con">
                    
                    <div id="chating_contents" class="chating_contents">
                        <ul>
                        </ul>
                    </div>
                </div>
                <div id="chating_bottom" class="chating_bottom" style="display:none;">
                </div>
                <div id="chating_popup" class="chating_popup" style="display:none;">
                    <h3><i><img src="<c:url value='/images/icons/smile_icon.png'/>" alt=""></i>상담요약</h3>
                    <div class="chating_popup_con">
                        <textarea placeholder="상담내용에 대한 요약 정보 입니다." id="summary_text"></textarea>
                        <button id="btn_save_summary">저장</button>
                    </div>
                </div>
                
            </div>
        </section>
        <section id="sub_right_con">
        
        </section>
    </div>
</div>

<!-- 팝업 구간 -->

<!--로그아웃 팝업창 -->
	<div id="logout_alert_popup" class="alert_popup">
		<div class="del_alert_head">
			<h3>로그아웃</h3>
		</div>
		<div class="del_alert_con">
			<p>로그아웃 하시겠습니까?</p>
		</div>
		<div class="del_alert_btn">
			<a href="#" class="bnt_cancle" id=btn_logout_cncl>취소</a><a href="${path}/api/auth/logout.do" id="btn_logout_confirm">로그아웃</a>
		</div>
	</div>

<!--공지사항 삭제팝업창 -->
	<div id="del_alert_popup">
		<div class="del_alert_head">
			<h3>공지사항</h3>
		</div>
		<div class="del_alert_con">
			<p>선택한 항목이 삭제됩니다.</p>
		</div>
		<div class="del_alert_btn">
			<a href="#" class="bnt_cancle" id=btn_ntc_del_cncl>취소</a><a href="#" id="btn_ntc_del">삭제</a>
		</div>
	</div>
	
<!--공지사항 등록팝업창 -->
<div id="reg_alert_popup" class="alert_popup">
	<div class="del_alert_head">
		<h3>공지사항</h3>
	</div>
	<div class="del_alert_con">
		<p>등록이 완료되었습니다.</p>
	</div>
	<div class="del_alert_btn">
		<a href="#" class="bnt_cancle" id=btn_ntc_reg_cncl>닫기</a>
	</div>
</div>

<!--알림 읽음처리팝업창 -->
<div id="chk_news_popup" class="alert_popup">
	<div class="del_alert_head">
		<h3>알림</h3>
	</div>
	<div class="del_alert_con">
		<p>선택항목을 읽음처리 하였습니다.</p>
	</div>
	<div class="del_alert_btn">
		<a href="#" class="bnt_cancle" id=btn_news_chk_cncl>닫기</a>
	</div>
</div>

<!--소속그룹 변경 저장알림팝업창 -->
<div id="chg_group_popup" class="alert_popup">
	<div class="del_alert_head">
		<h3>설정</h3>
	</div>
	<div class="del_alert_con">
		<p>소속 그룹 변경을 신청하였습니다.</p>
	</div>
	<div class="del_alert_btn">
		<a href="#" class="bnt_cancle" id=btn_chg_group_cncl>닫기</a>
	</div>
</div>

<!--그룹 권한 설정 알림팝업창 -->
<div id="group_auth_popup" class="alert_popup">
	<div class="del_alert_head">
		<h3>그룹 권한</h3>
	</div>
	<div class="del_alert_con">
		<p>그룹 설정을 저장하였습니다.</p>
	</div>
	<div class="del_alert_btn">
		<a href="#" class="bnt_cancle" id=btn_group_auth_cncl>닫기</a>
	</div>
</div>

<!--권한 신청 승인팝업창 -->
	<div id="req_auth_confirm_popup" class="alert_popup">
		<div class="del_alert_head">
			<h3>그룹 권한</h3>
		</div>
		<div class="del_alert_con">
			<p>사용자를<p><p id="role"></p><p>으로 승인하시겠습니까?.</p>
		</div>
		<div class="del_alert_btn">
			<a href="#" class="bnt_cancle" id=btn_req_auth_confirm_cncl>닫기</a>
		</div>
	</div>


<!-- 팝업 구간 -->

<script>
//로그아웃 팝업 열기
/* $(document).on("click", "#btn_logout", function() {
	$('#logout_alert_popup').css('display', 'block');	
}); */
$('#btn_logout').click(function () {
		$('#logout_alert_popup').css('display', 'block');	
})
//로그아웃 팝업 닫기
$(document).on("click", "#btn_logout_cncl", function() {
	$('#logout_alert_popup').css('display', 'none');	
});
//공지사항 삭제 팝업 닫기
$(document).on("click", "#btn_ntc_del_cncl", function() {
	$('#del_alert_popup').css('display', 'none');	
});
//공지사항 등록 팝업 닫기
$(document).on("click", "#btn_ntc_reg_cncl", function() {
	$('#reg_alert_popup').css('display', 'none');	
});
//알림 읽음처리 팝업 닫기
$(document).on("click", "#btn_news_chk_cncl", function() {
	$('#chk_news_popup').css('display', 'none');	
});
//소속 그룹 변경 신청 팝업 닫기
$(document).on("click", "#btn_chg_group_cncl", function() {
	$('#chg_group_popup').css('display', 'none');	
});
//그룹설정 저장 팝업 닫기
$(document).on("click", "#btn_group_auth_cncl", function() {
	$('#group_auth_popup').css('display', 'none');	
});
//그룹 변경 신청 승인 팝업 닫기
$(document).on("click", "#btn_req_auth_confirm_cncl", function() {
	$('#req_auth_confirm_popup').css('display', 'none');	
});
//공지사항 삭제 ajax요청
$(document).on("click", "#btn_ntc_del", function() {
	$('#del_alert_popup').css('display', 'none');	
    // AJAX DELETE 요청 보내기
    $.ajax({
        url: "${path}/api/notice/" + $(this).data("noti_sqno") + ".do", // 엔드포인트 URL
        type: "DELETE", // HTTP DELETE 메서드 사용
        async : false,
        success: function(response) {
            // 요청 성공 시 실행할 코드
            if (response === "true") {
                alert("공지사항이 삭제되었습니다.");
                // 삭제 성공 후 필요한 동작 수행
                fnPageLoad('${path}/page/notice.do','');
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

</script>



<script>
/* 로그인 유저의 환경설정 조회 함수 */
function fnChangeFont(){
	 // 서버로 보낼 JSON 데이터
    var jsonData = {
    		envrStupDivCd: 'font',          // 문자열 데이터
    		userId: '<%=user_id%>',          // 문자열 데이터
    };
	 
	
    var responseData = null;
	
    // AJAX 요청 설정
    $.ajax({
        url: "${path}/api/setting.do",  // 서버의 API 엔드포인트 URL
        type: "POST",              // HTTP 메서드 (POST, GET 등)
        async: false,                // 동기적 요청 활성화
        data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
        contentType: "application/json", // 요청 본문의 데이터 타입 설정
        success: function(response) {
            // JSON 데이터 파싱
            var responseData = JSON.parse(response);

	       
	     // 원하는 value 값을 가진 라디오 버튼 선택하기
	        $("input[name='font_family'][value='" + responseData.envrStupVl + "']").prop("checked", true);


	        $(".chattok p").removeClass();
	        $(".chattok p").addClass(responseData.envrStupVl);
	        
	        $("#summary_text").removeClass();
	        $("#summary_text").addClass(responseData.envrStupVl);
	        
            
        },
        error: function(xhr, status, error) {
            // 요청 실패 시 실행할 코드
            console.error("AJAX 오류: " + error);
        }
    });
    
    return responseData;
}



/* 로그인 유저의 환경설정(폰트사이즈) 조회 후 영역 css 변경 함수 */
function fnChangeFontSize(){
	
	
	 // 서버로 보낼 JSON 데이터
    var jsonData = {
    		envrStupDivCd: 'fontSize',          // 문자열 데이터
    		userId: '<%=user_id%>',          // 문자열 데이터
    };
	 
    // AJAX 요청 설정
    $.ajax({
        url: "${path}/api/setting.do",  // 서버의 API 엔드포인트 URL
        type: "POST",              // HTTP 메서드 (POST, GET 등)
        async: false,                // 동기적 요청 활성화
        data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
        contentType: "application/json", // 요청 본문의 데이터 타입 설정
        success: function(response) {

        // 요청 성공 시 실행할 코드
        // JSON 데이터 파싱
        var responseData = JSON.parse(response);
	        
	     // 원하는 value 값을 가진 라디오 버튼 선택하기
	     $("input[name='font_size'][value='" + responseData.envrStupVl + "']").prop("checked", true);

	     
	   	 $(".chattok p").css('font-size',responseData.envrStupVl+"px");
	     $("#summary_text").css('font-size',responseData.envrStupVl+"px");
            
        },
        error: function(xhr, status, error) {
            // 요청 실패 시 실행할 코드
            console.error("AJAX 오류: " + error);
        }
    });
}


</script>



<script>  


$(document).ready(function() {
	
	

    $.ajax({
        url: "${path}/api/user/<%=user_id%>.do",
        type: "GET",
        async:false,
        success: function(response) {

			
        },
        error: function(xhr, status, error) {
            // 두 번째 Ajax 요청의 요청 실패 시 실행할 코드
            alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
        }
    });
    
    

	function newsNotReadCnt() {
		  $.ajax({
		      type: "GET",
	          url: "${path}/api/news/cnt/read-not.do", // 엔드포인트 URL
	          data : {"receiverId" : '<%=user_id%>'},
	          success: function(data) {
		          
		          if(data > 99) data = "99+";
		          $("#nrdCnt").html(data);
	
		      },
		      error: function(request, status, error) {
	
		          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		      }
		  });
	}
	
	
	function connectStomp() {
		socket = new SockJS("http://<%= messageServerIp %>/advisor_message_egov/stomp"); // endpoint 
		
	    stomp = Stomp.over(socket);
	    
	    stomp.connect({}, function () {
	        console.log("Connected stomp!");

	        // Message 토픽 구독!
	        stomp.subscribe('/topic/script', function (event) {
	        	
	            // event.body를 JSON 형식으로 파싱하여 객체로 변환
	            var messageData = JSON.parse(event.body);

	            // type 속성 값을 가져와서 사용
	            var messageType = messageData.type;


                
                
                //TODO
               if(messageData.agentId=='<%=user_id%>'){

            	   
                
			            if (messageType === 0) {
			            	

			    			// 서버로 보낼 JSON 데이터
			                var jsonData = {
			    			            		  "userId": "<%=user_id%>",
			    			            		  "consStatCd": "calling"
			    							}

					          
			    			  $.ajax({
			    			      type: "PUT",
			    	              url: "${path}/api/cons-stat.do", // 엔드포인트 URL
			    	              data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
			    	              contentType: "application/json", // 요청 본문의 데이터 타입 설정
			    	              async:false,
			    	              success: function(data) {
			    			          var jsonString = JSON.stringify(data);
			    			          

			    			      },
			    			      error: function(request, status, error) {

			    						alert("수동질의 실패");
			    			          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    			      }
			    			  });
			    			  
			            	
			            	
			                $("#category_id").val("");
			    			$("#call_id").val("");
			                //통화가 시작 되면 리셋 시키기
			                $('#chating_contents').html("");
			                $('#chating_bottom').html("");
			                $('#chating_bottom').css('display', 'none');
			                $('#answer_content').html("");
			                $("#answer_cnt").val("0");
			            	// 상담 종료시 요약화면 출력 
			            	$('#chating_popup').css('display', 'none');
			                

					          
			            	
			            	$("#no_calling").css("display", "none");
			            	$("#no_answer").css("display", "none");
			            
			            	$("#chating_head").css("display", "flex");
			            	
			            	
						
			                // 삽입할 HTML 코드를 생성합니다.
								var insertedHTML = '<div class="chating_head_inner">' +
								                  '<h2>'+messageData.orgPhoneNumber+'고객님과 전화상담이 시작되었습니다.</h2>' +
								                  '<p>시작일시 ('+messageData.startConvTime+')</p>' +
								                  '</div>';
								                  
	
			                // 선택한 요소 안에 HTML을 삽입합니다.
			                $('#chating_head').html(insertedHTML);
			                

			            	pagination_answer = new tui.Pagination('pagination_answer', {
			                    totalItems: 1,
			            		itemsPerPage: 1,
			            		visiblePages: 1
			            	});
			                
			                
			                
			            } else if (messageType === 1) {
			            	$("#no_calling").css("display", "none");
			            	$("#no_answer").css("display", "none");
			            	$("#counsel_con_inner").css("display", "block");
			            	

			                
			            	// 고객이 말하는거
			            	if(messageData.rxTxFlag=="RX"){
	
	

							var insertedHTML = ""
								insertedHTML += '<li class="guest">';
								insertedHTML += '<em>'+messageData.orgPhoneNumber+' ('+messageData.segmentOffset+')</em>';
								insertedHTML += '<div class="chattok">';
														            
  
								if( messageData.blackList == "")
								{
								}
								else
								{
									insertedHTML += '<span class="dengerus"><i>!</i>' + messageData.blackList + '</span>';
									
									
								      var jsonData_news = {
								            	"receiverId": "<%=user_id%>" ,
								            	"newsTitlNm": "위험 키워드가 감지 되었습니다. 제목" + messageData.blackList,
								            	"newsCntn": "위험 키워드가 감지 되었습니다. 내용" + messageData.blackList
											}
							            
								      
								    // AJAX 요청 설정
								    $.ajax({
								        url: "${path}/api/news.do",  // 서버의 API 엔드포인트 URL
								        type: "POST",              // HTTP 메서드 (POST, GET 등)
								        async: false,                // 동기적 요청 활성화
								        data: JSON.stringify(jsonData_news), // JSON 데이터 문자열로 변환
								        contentType: "application/json", // 요청 본문의 데이터 타입 설정
								        success: function(response) {

								       
									     
								            
								        },
								        error: function(xhr, status, error) {
								            // 요청 실패 시 실행할 코드
								            console.error("AJAX 오류: " + error);
								        }
								    });
								    
									
								}
														                  
								insertedHTML += '<p>'+messageData.transcript+'</p>';
								insertedHTML += '</div>';
								insertedHTML += '</li>';
														                  
														                  
									$('#chating_contents').append(insertedHTML);
	
								    //var paragraph = document.querySelector("p"); // 첫 번째 <p> 태그 선택
								    //var text = paragraph.innerHTML;
								    //text = text.replace(/노란/g, '<span class="highlight">노란</span>'); // "노란" 단어 강조
								    //paragraph.innerHTML = text;
			            	}
			            	
	
			            	// 상담사가 말하는거 말하는거
			            	if(messageData.rxTxFlag=="TX")
				           	{
	
	
	
								var insertedHTML = '<li class="counseller">' +
								                  '<em>상담사 '+messageData.agentId+'(1234) ('+messageData.segmentOffset+')</em>' +
								                  '<div class="chattok"><p>'+messageData.transcript+'</p>'+
								                  '</div>';
	
								$('#chating_contents').append(insertedHTML);
								                
				           	}
			            } else if (messageType === 2) {
			            	

			    			// 서버로 보낼 JSON 데이터
			                var jsonData = {
			    			            		  "userId": "<%=user_id%>",
			    			            		  "consStatCd": "wait"
			    							}

					          
			    			  $.ajax({
			    			      type: "PUT",
			    	              url: "${path}/api/cons-stat.do", // 엔드포인트 URL
			    	              data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
			    	              contentType: "application/json", // 요청 본문의 데이터 타입 설정
			    	              async:false,
			    	              success: function(data) {
			    			          var jsonString = JSON.stringify(data);
			    			          

			    			      },
			    			      error: function(request, status, error) {

			    						alert("수동질의 실패");
			    			          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    			      }
			    			  });
			    			  
			    			
			    			
			           		$("#no_calling").css("display", "none");
			            	$("#no_answer").css("display", "none");
	
			            	$("#chating_bottom").css("display", "flex");
			            	
	
							var insertedHTML = '<div class="chating_head_inner">'  +
													'<h2>'+messageData.orgPhoneNumber+' 고객님과 전화상담이 종료되었습니다.</h2>'  +
													'<p>종료일시 ('+messageData.startConvTime+')</p>' +
												'</div>';
												
									
			            	$('#chating_bottom').html(insertedHTML);
												
			            	
			            	
			            	
			            	// 상담 종료시 화면 출력 
			            	$('#chating_popup').css('display', 'block');
			

					          $("#summary_text").prop("disabled", false);
					          $("#btn_save_summary").prop("disabled", false);
					          $(".chating_popup_con button").css("background-color", "#293E89");
					          
			            	

			            	
			            	// 요약내용 삽입합니다.
			            	$('#summary_text').val(messageData.summary);
		            		$("#rec_id").val(messageData.recId);
												
			            	//"통화종료";
			            }
                
			            
		            	if(messageData && messageData.callId !== undefined && messageData.callId !== null)
		            	{
		            		   $("#call_id").val(messageData.callId);
		            		   
		            	}

			            // chating_contents 요소의 스크롤을 맨 아래로 이동합니다.
			            
			            $("#chating_contents").val(messageData.callId);
			            var chatingContents = $("#chating_contents");
			            chatingContents.scrollTop(chatingContents.prop("scrollHeight"));
			            
                }
		        

               fnChangeFontSize();
               fnChangeFont();
				
	        });
	        // Message 토픽 구독!
	        stomp.subscribe('/topic/answer', function (event) {
	        	
	        		
	    		answer_num = answer_num + 1;
	        	
	        	
	        	
	            // event.body를 JSON 형식으로 파싱하여 객체로 변환
	            var messageData = JSON.parse(event.body);

	            	            
	            
	            
	            var popupUrls = messageData.KMS.map(function(item) {
	            	  return item.popupUrl;
	            	});
	            

	            if(messageData.STATUS_MSG=="all_404")
	            {
					//답변 데이터가 없어요.
	            }
	            else if(messageData.agentId=='<%=user_id%>')
	            {
	            	$("#answer_cnt").val(parseInt($("#answer_cnt").val())+1);

	            	pagination_answer = new tui.Pagination('pagination_answer', {
	                    totalItems: $("#answer_cnt").val(),
	            		itemsPerPage: 1,
	            		visiblePages: 10
	            	});
	            	

	            	fn_pagination_answer();

	            
	            
	            
	    		// 삽입할 HTML 코드를 생성합니다.
				var insertedHTML = '<div id="scroll_'+$("#answer_cnt").val()+'">' +
                '<div class="counsel_date"><p>2023.12.31.23.59.59</p></div>' +
	                    '<div class="counsel_contents">' +
	                    '<ul>' +
	                    '<li class="counsel_kind">' +
	                    '<h3>분류</h3>' +
	                    '<div>';
	                    
	                    $("#category_id").val($("#category_id").val()+messageData.CATEGORY_ID+":::")
	    	            var category_arr = messageData.CATEGORY.split("|||");

	    	            
	    	            
		            	for (var i = 0; i < category_arr.length; i++) {
		            	  
		            	  var category_div = "소";

		            	  if (i == 0) {
		            	    category_div = "대";
		            	  }
		            	  if (i == 1) {
		            	    category_div = "중";
		            	  }

		            	  insertedHTML += '        <span><i>' + category_div + '</i>' + category_arr[i] + '</span>';
		            	}

		            	
		            	
		            	
          insertedHTML += '      </div>' +
		            	  '    </li>';
          if(messageData.STATUS_MSG!=="ai_404"){
        	
		  insertedHTML += '    <li class="ai_part">' +
		            	  '      <h3>AI</h3>' +
		            	  '      <div>' +
		            	  '        <div class="ai_part_txt">' +
		            	  '          <div class="chang_open_con">' +
		            	  '            <span><button class="chang_open_btn trigger"></button></span>' +
		            	  '            <span><input type="checkbox" id="ai_check_' + $("#answer_cnt").val() + '" name="ai_check_' + $("#answer_cnt").val() + '"><label for="ai_check_' + $("#answer_cnt").val() + '"></label></span>' +
		            	  '          </div>' +
		            	  '          <h4>' + messageData.AI.question + '</h4>' +
		            	  '          <p>' + messageData.AI.answer + '</p>' +
		            	  '        </div>' +
		            	  '      </div>' +
		            	  '    </li>';
		  
          }
          if(messageData.STATUS_MSG!=="kms_404"){
		  insertedHTML += '    <li class="kms_part">' +
		            	  '      <h3>KMS</h3>' +
		            	  '      <div>' +
		            	  '        <div class="kms_part_txt">' +
		            	  '          <ul>';

		            	for (var i = 0; i < messageData.KMS.length; i++) {
		            	  var item = messageData.KMS[i];
		            	  
		            	  // 동적으로 생성된 HTML을 liElement의 innerHTML로 설정합니다.
		            	  insertedHTML += '            <li><a href="javascript:window.open(\''+messageData.KMS[i].popupUrl+'\', \'_blank\', \'width=1200, height=600\');"><div class="kms_part_con"><p>' + messageData.KMS[i].title + '</p>' +
		                  '              <span><input type="checkbox" data-cntnt-id="'+messageData.KMS[i].cntntId+'" id="kms_check_' + $("#answer_cnt").val()+"_"+(i+1)+ '" name="kms_check_' + $("#answer_cnt").val()+"_"+(i+1) + '"><label for="kms_check_' + $("#answer_cnt").val()+"_"+(i+1) + '"></label></span>' +
		                  '            </div></a></li>';

		            	}

		            	insertedHTML += '          </ul>' +
		            	  '        </div>' +
		            	  '      </div>' +
		            	  '    </li>' +
		            	  '  </ul>' +
		            	  '</div>' +
		            	  '</div>' +
		            	  '</div>';
          }

		    		$('#answer_content').append(insertedHTML);

		    		$('#answer_content').on('click', 'input[type="checkbox"]', function() {
		    		    // 클릭한 체크박스 요소의 ID를 가져옵니다.
		    		    var checkboxId = $(this).attr('id');
		    		    
		    		    // checkboxId 변수에 클릭한 체크박스의 ID가 포함되어 있습니다.
		    		});

	            var chatingContents = $("#counsel_con_inner");
	            chatingContents.scrollTop(chatingContents.prop("scrollHeight"));

	            }

	               fnChangeFontSize();
	               fnChangeFont();
	               
					   

			            $(".chang_open_btn").click(function() {
			                alert("버튼이 클릭되었습니다!");
			                // 원하는 동작을 여기에 추가
			            });
					   

		            
	        });
	        

	        stomp.send("/recvScript", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": ""}));
	        stomp.send("/recvAnswer", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": ""}));
	        

	    });
	
	}
	
		$("#menu_logout").click(function(){ 
			
			$("#author_alert_popup").css("display", "block");
			
		}); 
	

            
			connectStomp();

			newsNotReadCnt();
			
			$(document).on("click", "#btn_save_summary", function() {
	            // 서버로 보낼 JSON 데이터
	            
	           
	            var jsonData_summary = {
	            	"id":$("#call_id").val(),
	            	"cntn":$("#summary_text").val()
				}
            
				  $.ajax({
				      type: "PUT",
		              url: "${path}/api/summary.do", // 엔드포인트 URL
		              data: JSON.stringify(jsonData_summary), // JSON 데이터 문자열로 변환
		              contentType: "application/json", // 요청 본문의 데이터 타입 설정
				      success: function(data) {
				          
				      },
				      error: function(request, status, error) {

						  alert("저장 실패");
				          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				      }
				  });
	            
	            
	            // 서버로 보낼 JSON 데이터
		            var jsonData_kms = {
		            	"REC_KEY":$('#rec_id').val(),
		            	"CUTT_TYPE":$("#category_id").val().replace(/:::$/, ""),
		            	"MEMO":$("#summary_text").val()
		            	
					}
	            

				    
					  $.ajax({
					      type: "POST",
			              url: "${path}/ext-api/summary.do", // 엔드포인트 URL
			              data: JSON.stringify(jsonData_kms), // JSON 데이터 문자열로 변환
			              contentType: "application/json", // 요청 본문의 데이터 타입 설정
					      success: function(data) {
					          console.log("AJAX 성공: \n" + data);
					          
	            			  alert("저장 완료");

					          $("input[type='checkbox']").prop("disabled", true);
					          $("#summary_text").prop("disabled", true);
					          $("#btn_save_summary").prop("disabled", true);
					          $(".chating_popup_con button").css("background-color", "#CCCCCC");
					          
					          
					      },
					      error: function(request, status, error) {

							  alert("저장 실패");
					          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					      }
					  });
					  
					  
					  var checkboxIDs = [];
					  $('[id^="kms_check_"]:checked').each(function() {
					    var dataCntntId = $(this).attr('data-cntnt-id');
					    checkboxIDs.push(dataCntntId);
					  });

				
					  
					  
		    		   	var jsonData_recommend = {
		    			            		  "userId": "<%=user_id%>",
		    			            		  "cntntId":  checkboxIDs,
		    							}
				      
	    			  $.ajax({
	    			      type: "POST",
	    	              url: "${path}/ext-api/recommend.do", // 엔드포인트 URL
	    	              data: JSON.stringify(jsonData_recommend), // JSON 데이터 문자열로 변환
	    	              contentType: "application/json", // 요청 본문의 데이터 타입 설정
	    	              async:false,
	    	              success: function(data) {
	    			          var jsonString = JSON.stringify(data);
	    			          

	    			      },
	    			      error: function(request, status, error) {

	    			          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	    			      }
	    			  }); 
	    			  
	    			  
	    			  
	    			  
					  
					  
				
			})
			
			
			
			
			$(document).on("click", "#btn_logout", function() {
				

				  $.ajax({
				      type: "GET",
		              url: "${path}/api/auth/logout.do", // 엔드포인트 URL
				      success: function(data) {
				          var jsonString = JSON.stringify(data, null, 2);
				          

							$("#author_alert_popup").css("display", "none"); 
						
				       

				      },
				      error: function(request, status, error) {
				          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				      }
				  });
				  
				  
				
				
			})
		});
		


	</script>
	<input type="hidden" id ="call_id" value="">
	<input type="hidden" id ="rec_id" value="">
	<input type="hidden" id ="answer_cnt" value="">
	<input type="hidden" id ="category_id" value="">
	
	
	    <script>
        function fnPageLoad(url,param){
        	$("#sub_right_con").html("");
            $("#sub_right_con").load(url,param,function(response,status,xhr){
                if(status == "success"){
                    $("#pageInfoFrm input[name=url]").val(url);
                    $("#pageInfoFrm input[name=param]").val(param);
                }else{
                    $("#sub_right_con").html(response);
                }
            });
        }
        
        
          fnPageLoad('${path}/page/answer.do','');

            
            fnChangeFont();
            fnChangeFontSize();
        
        

		var socket = null;
		var stomp = null;
		var answer_num = 1;
		
        
    </script>
    
<script> 


	$(document).on("click", "#btn_adv_menual_question", function() {
		//alert("111111111111111");
	
		
		if($("#call_id").val()=="")
		{
			alert("상담중일때만 수동질의가 가능합니다.");
		}
		else
		{
	        $.ajax({
	            url: "${path}/api/user/<%=user_id%>.do",
	            type: "GET",
	            async:false,
	            success: function(response) {

	                // 서버 응답을 JSON 파싱
	                var jsonResponse = JSON.parse(response);

	    			// 서버로 보낼 JSON 데이터
	                var jsonData = {
	    			            		  "agentId": "<%=user_id%>",
	    			            		  "callId":  $("#call_id").val(),
	    			            		  "text": $("#text_adv_menual_question").val(),
	    			            		  "orgCode": jsonResponse[0].inttCd,
	    			            		  "type": $("#menual_query_div").val()
	    							}

	    			
			          
	    			  $.ajax({
	    			      type: "POST",
	    	              url: "${path}/ext-api/ai-query.do", // 엔드포인트 URL
	    	              data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
	    	              contentType: "application/json", // 요청 본문의 데이터 타입 설정
	    	              async:false,
	    	              success: function(data) {
	    			          var jsonString = JSON.stringify(data);
	    			          

	    			      },
	    			      error: function(request, status, error) {

	    						alert("수동질의 실패");
	    			          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	    			      }
	    			  });
	    			
	    			
	            },
	            error: function(xhr, status, error) {
	                // 두 번째 Ajax 요청의 요청 실패 시 실행할 코드
	                alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
	            }
	        });
			
			
		}
		
		
	})
</script>

<script class="code-js">

	
	var pagination_answer = new tui.Pagination('pagination_answer', {
        totalItems: 1,
		itemsPerPage: 1,
		visiblePages: 1
	});
	
	function fn_pagination_answer() {
	 	pagination_answer.on('afterMove', function(eventData) {
		    // 이벤트 핸들러 내에서 현재 페이지 번호를 가져옵니다.
		    var currentPage = eventData.page;
		    
		    // 대상 아이디를 생성합니다.
		    var targetId = "#scroll_" + currentPage;
		    
		    // 해당 아이디를 가진 요소를 선택합니다.
		    var targetElement = document.querySelector(targetId); // jQuery 객체 대신 DOM 요소로 선택
		    
		    if (targetElement) {
		        targetElement.scrollIntoView({
		            behavior: "smooth" // 부드러운 스크롤 사용
		        });
		    }
		});
	}

</script>


						
</body>
</html>
