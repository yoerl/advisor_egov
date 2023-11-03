<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String messageServerIp = getServletContext().getInitParameter("messageServerIp");
%>

<%

String user_id = (String) session.getAttribute("user_id");
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
            <a href="#">
                <img src="<c:url value='/images/icons/mark.png'/>" alt="">
                <span>농촌진흥청<i><img src="<c:url value='/images/icons/logo_arr.png'/>" alt=""></i></span>
            </a>
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
                       
                    </div>
                </div>
                <div id="chating_bottom" class="chating_bottom" style="display:none;"></div>

                
            </div>
        </section>
        <section id="sub_right_con" style="background: #f3f5fa;">
        			
				<div class="chating_con_mange" style="height: calc(100% - 85px);">
                    
                    <div class="chating_contents" style="height: 100%">
                        <ul id="chating_contents_manager">
                             
                            
                       
                        </ul>
                	</div>
                
                
        			</div>
					<div style="height:calc(85px);" class="chating_write">
						<div class="chating_write_con">
							<textarea id="text_send" placeholder="내용을 입력해 주세요."></textarea>
							<button style="height: 55px;" id="btn_send">전송</button>
						</div>
					</div>
        </section>
    </div>
</div>





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
            // 요청 성공 시 실행할 코드
            // JSON 데이터 파싱
            var responseData = JSON.parse(response);
            

	        // 요청 성공 시 실행할 코드
	        // JSON 데이터 파싱
	       
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
	
    

	var socket = null;
	var stomp = null;
	var answer_num = 1;
	
    

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
               if(messageData.agentId=='${userId}'){

            	   
                
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
			    			  
			            	
			            	
			                
			    			$("#call_id").val("");
			                //통화가 시작 되면 리셋 시키기
			                $('#chating_contents').html("");
			                $('#chating_bottom').html("");
			                $('#chating_bottom').css('display', 'none');
			                $('#answer_content').html("");
			                $("#answer_cnt").val("0");
			            	// 상담 종료시 요약화면 출력 
			                

					          
			            	
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
												
			            	
			            	
			            	
					          
			            	

			            	
			            	// 요약내용 삽입합니다.
			            	$('#summary_text').val(messageData.summary);
		            		$("#rec_id").val(messageData.recId);
												
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
	        
		            
	        });
	        

	        stomp.send("/recvScript", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": ""}));
	        stomp.send("/recvAnswer", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": ""}));
	        

	    });
	
	}

	$(document).on("click", "#btn_send", function() {
		
		
		
	    // 새로운 <li> 항목을 생성하여 추가합니다.
	    var newLi = '<li class="counseller"><em>관리자 <%=user_id%> (20231004204259)</em><div class="chattok"><p class="font_dotum" style="font-size: 16px;">'+$('#text_send').val()+'</p></div></li>';
	    $('#chating_contents_manager').append(newLi);
	    
        var msg = '{"callId":"","orgPhoneNumber":"매니저","segmentOffset":"<%=user_id%>","agentId":"${userId}","rxTxFlag":"RX","type":1,"transcript":"'+$('#text_send').val()+'","blackList":"","stopStatus":0}';
        
        

        stomp.send("/sendScript", {}, JSON.stringify({"roomId": "message", "id": "test", "msg": msg}));
 
        
		
		
	});
	
	
		$("#menu_logout").click(function(){ 
			
			$("#author_alert_popup").css("display", "block");
			
		}); 
	
        
	
		
            
            
			connectStomp();
			
			
			
			
			
			
		});
		


	</script>
	<input type="hidden" id ="call_id" value="">
	<input type="hidden" id ="rec_id" value="">
	<input type="hidden" id ="answer_cnt" value="">
	

    
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



						
</body>
</html>
