<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String user_id = (String) session.getAttribute("user_id");

%>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String messageServerIp = getServletContext().getInitParameter("messageServerIp");
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
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/font.css'/>"/>
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>    
    <script src="<c:url value='/js/egovframework/sockjs.client.min.js' />"></script>
    <script src="<c:url value='/js/egovframework/stomp-2.3.4.min.js' />"></script>
</head>

<body>

<!-- 레이어팝업창 -->
<div id="counsel_history_popup" style="display:block;">
	<div class="history_detail_popup">
	<div class="history_pop_header">
		<div id="logo"> 
			<a href="${path}/page/home.do">
				<img src="<c:url value='/images/icons/mark.png'/>" alt="">
				<span>농촌진흥청<i><img src="<c:url value='/images/icons/logo_arr.png'/>" alt=""></i></span>
			</a>
		</div>
	</div>
		<!-- body -->
	<div class="detail_pop_container" id="jubsok_detail">	
		<!-- chating -->
						<section id="charting">
				<div class="chating_inner">
				
				<div id="no_calling" style="height: 100%; display: flex; justify-content: center; align-items: center;">
				    <p> 현재 통화 상태가 아닙니다. </p>
				</div>

				
				
				
				
				<!-- chating head -->
				<div id="chating_head" class="chating_head" style="display:none;">
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
			<section id="right_con">
				<div class="counsel">
				<form name="" method="" action="">
					<!-- 검색 -->
		
					<!-- 내용 -->
						<div class="jubsok_con">
							<div class="counsel_con_inner">
								<div class="counsel_flag"><a href="#" class="btn_flag"><img src="<c:url value='/images/icons/btn_tag.png'/>" alt=""></a></div>
								<div class="counsel_pagenation">
									<ul>
										<li class="page_prev"><a href="#"><img src="<c:url value='/images/icons/page_prev.png'/>" alt=""></a></li>
										<li class="on"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
										<li><a href="#">7</a></li>
										<li><a href="#">8</a></li>
										<li><a href="#">9</a></li>
										<li><a href="#">10</a></li>
										<li class="page_next"><a href="#"><img src="<c:url value='/images/icons/page_next.png'/>" alt=""></a></li>
									</ul>
								</div>
								<script>
									$( document ).ready(function() {
									  $('.btn_flag').on('click', function() {
										 $('.counsel_pagenation').toggleClass('open');
										 return false;
									  });
									});
								</script>
							
							<!-- 내용 -->
							<div class="chating_contents">
								<ul>
									<li class="counseller">
										<em>매니저명 (2023.12.31.23.59.59)</em>
										<div class="chattok"><p>이아름 상담사님 멘탈 잡으세요</p>
										</div>
									</li>
								</ul>							
							
							</div>
							<!-- 내용 -->
							
							</div>
							
						</div>
						
					<!-- cousel -->
					<!-- chating popup -->
					<div class="chating_write">
						<div class="chating_write_con">
							<textarea placeholder="내용을 입력해 주세요."></textarea>
							<button>전송</button>
						</div>
					</div>
					<!-- chating popup -->
				</div>
				</form>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
	</div>
</div>


<!-- 레이어팝업창 -->
<script> 

$(document).ready(function() {
	var socket = null;
	var stomp = null;

	function connectStomp() {
		socket = new SockJS("http://<%= messageServerIp %>/advisor_message_egov/stomp"); // endpoint 
		
	    stomp = Stomp.over(socket);
	    
	    stomp.connect({}, function () {
	        console.log("Connected stomp!");
	        console.log(stomp.ws._transport.url); 

	        // Message 토픽 구독!
	        stomp.subscribe('/topic/script', function (event) {
	        	console.log("왼쪽 화면 메세제 event=? "+event);
	        	console.log("왼쪽 화면 메세제 event.body => "+event.body);
	        	console.log("-----------------------------------------------");
	        	
	            // event.body를 JSON 형식으로 파싱하여 객체로 변환
	            var messageData = JSON.parse(event.body);

	            // type 속성 값을 가져와서 사용
	            var messageType = messageData.type;

                console.log("고객 통화 데이터 넘어오는 중");

                console.log("모니터링 111111111111111111111111");
                console.log(messageData.agentId +" : "+ '<%=user_id%>');
                console.log("모니터링 2222222222222222222222222");
                
                
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
			    			          console.log("수동질의 성공");
			    			          console.log("AJAX 성공: \n" + data);
			    			          console.log("AJAX 성공: \n" + jsonString);
			    			          

			    			      },
			    			      error: function(request, status, error) {

			    						alert("수동질의 실패");
			    			          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    			      }
			    			  });
			    			  
			            	
			            	
			                
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
			            
			                console.log("통화시작");
			            	$("#chating_head").css("display", "flex");
			            	
			            	//{"callId":"callTest","recId":"recTest","agentId":"agentTest","orgPhoneNumber":"010-1111-1234","type":0,"stopStatus":0}
			            	
			            	
						
			                // 삽입할 HTML 코드를 생성합니다.
								var insertedHTML = '<div class="chating_head_inner">' +
								                  '<h2>'+messageData.orgPhoneNumber+'고객님과 전화상담이 시작되었습니다.</h2>' +
								                  '<p>시작일시 ('+messageData.startConvTime+')</p>' +
								                  '</div>';
								                  
	
			                // 선택한 요소 안에 HTML을 삽입합니다.
			                $('#chating_head').html(insertedHTML);
			                

		
			                
			                
			            } else if (messageType === 1) {
			            	$("#no_calling").css("display", "none");
			            	$("#no_answer").css("display", "none");
			            	$("#counsel_con_inner").css("display", "block");
			            	

			                console.log("통화중");
			                
			            	// 고객이 말하는거
			            	if(messageData.rxTxFlag=="RX"){
	
				                console.log("RX 고객 통화중");
	

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
									
								      
								    // AJAX 요청 설정
								    $.ajax({
								        url: "${path}/api/news.do",  // 서버의 API 엔드포인트 URL
								        type: "POST",              // HTTP 메서드 (POST, GET 등)
								        async: false,                // 동기적 요청 활성화
								        data: JSON.stringify(jsonData_news), // JSON 데이터 문자열로 변환
								        contentType: "application/json", // 요청 본문의 데이터 타입 설정
								        success: function(response) {

									        console.log("알림을 보냈습니다.");
									        console.log("response: " + response);
									        console.log("알림을 보냈습니다.");
								       
									     
								            
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
	
				                console.log("TX 상담사 통화중");
	
	
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
			    			          console.log("수동질의 성공");
			    			          console.log("AJAX 성공: \n" + data);
			    			          console.log("AJAX 성공: \n" + jsonString);
			    			          

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
												
			            	console.log("통화종료");
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
		        

				
	        });
	        // Message 토픽 구독!
	        

	        stomp.send("/recvScript", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": ""}));
	        

	    });
	
	}
	
	connectStomp();
	
});
/* 	$(document).ready(function(){ 
	$(".monitor_couseller a").click(function(){ 
	$("#counsel_history_popup").css("display", "block");
	}); 
	$("#counsel_dd > li > a").click(function(){ 
	$("#counsel_history_popup").css("display", "block");
	}); 
	$("#counsel_history_popup .btn_close").click(function(){ 
	$("#counsel_history_popup").css("display", "none"); 
	}); 
	});  */
</script>
</body>
</html>