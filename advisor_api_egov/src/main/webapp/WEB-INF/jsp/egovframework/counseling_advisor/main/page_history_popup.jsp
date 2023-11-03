<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String taServer = getServletContext().getInitParameter("taServer");


String intt_cd = (String) session.getAttribute("intt_cd");

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
	<script>

	$( document ).ready(function() {
	  $('#btn_flag').on('click', function() {
		 //$('.counsel_pagenation').toggleClass('open');
		 console.log("11111");
		 
         if($(".counsel_pagenation").css('display')==='block')
         {
         	$('.counsel_pagenation').css('display', 'none');
         }
         else
        {
        	$('.counsel_pagenation').css('display', 'block');     
        }
         
         
         
		 
		 return false;
	  });
	});
	</script>
	<style>
	

    .tui-page-btn.tui-prev-is-ellip.tui-first-child {
    display: none;
  	}
    .tui-page-btn.tui-next-is-ellip.tui-last-child {
    display: none;
  	}
	</style>
</head>

<body>

<!-- 레이어팝업창 -->
<div id="counsel_history_popup" style="display:block;">
	<div class="history_detail_popup">
	<div class="history_pop_header">
		<div id="logo"> 
			<a href="#">
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
				
				<div id="chating_popup" class="chating_popup" style="display:none;">
                    <h3><i><img src="/advisor_api_egov/images/icons/smile_icon.png" alt=""></i>상담요약</h3>
                    <div class="chating_popup_con">
                        <textarea placeholder="상담내용에 대한 요약 정보 입니다." id="summary_text" class="font_myeongjo" style="font-size: 14px;width:100%" readonly></textarea>
                        
                    </div>
                </div>

	
				<div class="chating_con" style="height:100%">
					
					<div id="chating_contents" class="chating_contents">
						<ul>
						</ul>
					</div>
				</div>
				
				</div>
			</section>
		<!-- chating -->
		<!-- right -->
			<section id="right_con">
						<div class="counsel_con" style="height: 100%;">
								
						
							<div id="counsel_popup" class="counsel_popup">
							<div style="text-align: right;margin-bottom: 10px;"><span>
								<a href="javascript:void($('#counsel_popup').css('display', 'none'),$('.label_sticky').css('display', 'block'));">				
								<img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
								<h2 id="counsel_poopup_title">군입대 지원하려고 합니다. 어떻게 해야 할까요?</h2>
								<div id="counsel_poopup_con" class="counsel_poopup_con">
									<p>병역의무 이행<br />
										•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
										•상근예비역(18개월)<br />
										•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
										•사회복무요원(21개월)
										•산업기능요원 현역 입영대상사(34개월)<br />
										•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
										•상근예비역(18개월)<br />
										•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
										•사회복무요원(21개월)
										•산업기능요원 현역 입영대상사(34개월)<br />
										•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
										•상근예비역(18개월)<br />
										•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
										•사회복무요원(21개월)<br />
										•산업기능요원 현역 입영대상사(34개월)</p>
									<p><img src="../img/noimg.gif" alt=""></p>
									<p>별도로 표기 테이블 문서도 있음 
										별도 퍼플리싱 필요함
										테이블 색상은 가이드 문서 참고 작성해주세요</p>
									<p><img src="../img/noimg.gif" alt=""></p>
								</div>

							</div>
									<div class="label_sticky" style="display:block;">
												<div class="counsel_flag" style="display:block;"><a href="#" id="btn_flag" class="btn_flag"><img src="<c:url value='/images/icons/btn_tag.png'/>" alt=""> </a></div>
												
												<div class="counsel_pagenation code-html" style="display:block;">
				
														<div id="pagination_answer" class="tui-pagination"><span class="tui-page-btn tui-is-disabled tui-first"><span class="tui-ico-first">first</span></span><span class="tui-page-btn tui-is-disabled tui-prev"><span class="tui-ico-prev">prev</span></span><strong class="tui-page-btn tui-is-selected tui-first-child">1</strong><a href="#" class="tui-page-btn">2</a><a href="#" class="tui-page-btn">3</a><a href="#" class="tui-page-btn">4</a><a href="#" class="tui-page-btn">5</a><a href="#" class="tui-page-btn">6</a><a href="#" class="tui-page-btn">7</a><a href="#" class="tui-page-btn">8</a><a href="#" class="tui-page-btn">9</a><a href="#" class="tui-page-btn">10</a><a href="#" class="tui-page-btn tui-next-is-ellip tui-last-child"><span class="tui-ico-ellip">...</span></a><a href="#" class="tui-page-btn tui-next"><span class="tui-ico-next">next</span></a><a href="#" class="tui-page-btn tui-last"><span class="tui-ico-last">last</span></a></div>	
													
												</div>
									</div>	
									
							<div id="counsel_con_inner" class="counsel_con_inner" style="background-color: #f3f5f9;">
							
								<section id= "answer_content">
									
									
			
									
									
									
								</section>
								
								
							
							</div>
							
						</div>
						
			</section>
		<!-- right -->
	</div>
	<!-- body -->
	</div>
</div>


<!-- 레이어팝업창 -->
<script> 

$.ajax({
	  type: 'GET',
	  url: 'http://<%= taServer %>/api/history/search/tbConsHstr',
	  data: {
	    index_names: 'tb_cons_hstr',
	    intt_cd: '<%=intt_cd%>',
	    cons_hstr_id: '${callId}',
	    //cons_hstr_id: '202309210000106168169526434911339994',
	    date_format: 'yyyy-MM-dd HH:mm:ss',
	    return_fields: 'INTT_CD/INTT_CD_NM/TALKER/TALKER_INFO/SCRT_CNTN/META_DPMS_ID/META_CONS_STT_TIME/META_CONS_END_TIME/RISK_KYWD',
	    date_display_columns: 'CONS_STT_TIME',
	    date_display_format: 'yyyy.MM.dd HH:mm:ss',
	    startPos: '1',
	    retCount: '1000',
	    sortOrder: 'RDNG_STT_TIME/RGSN_DTTM asc|RDNG_SQNC asc'
	  },
	  

	    
	  headers: {
	    'accept': 'application/json'
	  },
	  success: function(response) {
	    // 요청이 성공했을 때 실행할 코드
	    console.log(response);
	    console.log("1111111111111111111111111111");
	    console.log(response.returnObject);
	    

        for (var i = 0; i < response.returnObject.length; i++) {
           

    	    console.log("44444");
    	    console.log(response.returnObject[i]);

    	    
/////////////////////////
        	// 고객이 말하는거
        	
        	if(response.returnObject[i].TALKER=="RX"){

                console.log("RX 고객 통화중");


			var insertedHTML = ""
				insertedHTML += '<li class="guest">';
				insertedHTML += '<em>'+response.returnObject[i].TALKER_INFO+')</em>';
				insertedHTML += '<div class="chattok">';
										            

				if( response.returnObject[i].RISK_KYWD == "")
				{
				}
				else
				{
					insertedHTML += '<span class="dengerus"><i>!</i>' + response.returnObject[i].RISK_KYWD + '</span>';
					
					
				    
					
				}
										                  
				insertedHTML += '<p>'+response.returnObject[i].SCRT_CNTN+'</p>';
				insertedHTML += '</div>';
				insertedHTML += '</li>';
										                  
										                  
					$('#chating_contents').append(insertedHTML);

        	}
        	

        	// 상담사가 말하는거 말하는거
        	if(response.returnObject[i].TALKER=="TX")
           	{

                console.log("TX 상담사 통화중");


				var insertedHTML = '<li class="counseller">' +
				                  '<em>상담사 '+response.returnObject[i].TALKER_INFO+')</em>' +
				                  '<div class="chattok"><p>'+response.returnObject[i].SCRT_CNTN+'</p>'+
				                  '</div>';

				$('#chating_contents').append(insertedHTML);
				                
           	}
        	/////////////////////////
        	
        	
    	    console.log("5555");
        }
        
        
        
        
        
	    
	   	  },
		  error: function(xhr, textStatus, errorThrown) {
			    // 요청이 실패했을 때 실행할 코드
			    console.error(errorThrown);
			  },

		  complete: function() {


			  $.ajax({
				    url: 'http://<%= taServer %>/api/history/search/tbAiBrfHstr',
				    type: 'GET',
				    data: {
				        index_names: 'tb_ai_brf_hstr',
				        cons_hstr_id: '${callId}',
				        return_fields: 'AI_BRF_CNTN/CONS_HSTR_ID/KMS_MEMO_CNTN',
				        startPos: 1,
				        retCount: 1,
				        sortOrder: 'DOC_ID'
				    },
			      success: function(data) {
			          var jsonString = JSON.stringify(data.returnObject);

			          console.log("요약11111111111111wdq1122222"+JSON.stringify(data.returnObject));
			          console.log("요약1111111555fwe22"+(JSON.stringify(data.returnObject)=="[]"));
			          console.log("요약1111111qwwwwwwwwwwwwwwwwwwwwwwwww555fwe22"+data.returnObject);


			          if(JSON.stringify(data.returnObject)=="[]")
			          {
			        	  
			          }
			          else
			          {
			        	  $('#chating_popup').css("display", "block");
						  //$('#summary_text').val(JSON.stringify(Object.values(data.returnObject)[0].KMS_MEMO_CNTN).replace(/"/g, ''));
						  
						  $('#summary_text').val(Object.values(data.returnObject)[0].KMS_MEMO_CNTN);

						  $('.chating_con').css('height', 'calc(100% - 150px)');
							  
			          }

						 
			          console.log("요약22222");

			      },
			      error: function(request, status, error) {
			          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			      }
			  });
		  }
	});
	
//	http://192.168.90.91:8081/api/history/search/tbAiRplyHist?index_names=tb_ai_rply_hist&intt_cd=1390000&cons_hstr_id=202310200000102010169775170211339993&date_format=yyyy-MM-dd%20HH%3Amm%3Ass&return_fields=CONS_HSTR_ID%2FSQNC%2FCONS_TYPE_NM%2FCONS_QUST_CNTN%2FCONS_ANSR_CNTN%2FCONS_LRDV_NM%2FCONS_MDDV_NM%2FCONS_SMDV_NM%2FUSE_DIV_CD%2FUSE_DIV_CD_NM%2FCNSR_ID%2FCNSR_ID_NM%2FCONS_STT_TIME%2FCONS_CLSF_LVL1_NM%2FCONS_CLSF_LVL2_NM%2FRGSN_DTTM&date_display_columns=AMNT_DTTM%2CRGSN_DTTM&date_display_format=yyyy.MM.dd%20HH%3Amm%3Ass&startPos=1&retCount=1000&sortOrder=DOC_ID
			
	$.ajax({
		  type: 'GET',
		  url: 'http://<%= taServer %>/api/history/search/tbAiRplyHist',
		  async: false, // 동기적으로 요청을 보냅니다.
		  headers: {
		    'accept': 'application/json'
		  },
		  data: {

              index_names: 'tb_ai_rply_hist',
              intt_cd: '<%=intt_cd%>',
              cons_hstr_id: '${callId}',
              date_format: 'yyyy-MM-dd HH:mm:ss',
              return_fields: 'CONS_HSTR_ID/SQNC/CONS_TYPE_NM/CONS_QUST_CNTN/CONS_ANSR_CNTN/CONS_LRDV_NM/CONS_MDDV_NM/CONS_SMDV_NM/USE_DIV_CD/USE_DIV_CD_NM/CNSR_ID/CNSR_ID_NM/CONS_STT_TIME/CONS_CLSF_LVL1_NM/CONS_CLSF_LVL2_NM/CONS_CLSF_LVL3_NM/RGSN_DTTM',
              date_display_columns: 'AMNT_DTTM,RGSN_DTTM',
              date_display_format: 'yyyy.MM.dd HH:mm:ss',
              startPos: 1,
              retCount: 1000,
              sortOrder: 'DOC_ID'
              
    
		  },
		  success: function(response) {
		    // 성공적으로 응답을 받았을 때 실행할 코드를 여기에 작성하세요.
		    console.log(":::답변리스트");
		    console.log(":::답변리스트" + response);
	          var jsonString = JSON.stringify(response);
			    console.log(":::답변리스트" + jsonString);
		    console.log(":::답변리스트" + response.returnObject);
		    
		    var returnObjectArray = response.returnObject;

			var insertedHTML = ``; 
		 // returnObject 배열에서 DOC_ID 값 추출
		 
		 	var answer_num = 0;
			 for (var i = 0; i < returnObjectArray.length; i++) {
				   var ansr = returnObjectArray[i].CONS_ANSR_CNTN;
				   var qust = returnObjectArray[i].CONS_QUST_CNTN;
			   

				   console.log("qust: " + qust);
				   console.log("ansr: " + ansr);
				   insertedHTML += `
					   <div id="scroll_`+(i+1)+`">
					     <div class="counsel_date" style="background-color: white;">
					       <p>`+returnObjectArray[i].RGSN_DTTM_FORMATTED+`</p>
					     </div>
					     <div class="counsel_contents">
					       <ul>`;
/* 					         "CONS_CLSF_LVL2_NM": "경영유통",
					         "USE_DIV_CD": "N",
					         "CONS_CLSF_LVL1_NM": "채소", */
					 		
					         if(returnObjectArray[i].CONS_CLSF_LVL1_NM!=="")
					        {
					         insertedHTML += `<li class="counsel_kind">
					         		<h3>분류</h3>
					         		<div>`;     
					        }
						         		
					         if(returnObjectArray[i].CONS_CLSF_LVL1_NM!=="")
					        {
					        	 insertedHTML += `<span><i>대</i>`+returnObjectArray[i].CONS_CLSF_LVL1_NM+`</span>`;     
						    }
					         
					         
					         if(returnObjectArray[i].CONS_CLSF_LVL2_NM!=="")
						        {
						         insertedHTML += `<span><i>중</i>`+returnObjectArray[i].CONS_CLSF_LVL2_NM+`</span>`;         
							    }
					         
					         
					         if(returnObjectArray[i].CONS_CLSF_LVL3_NM!=="")
						        {
						         insertedHTML += `<span><i>소</i>`+returnObjectArray[i].CONS_CLSF_LVL3_NM+`</span>`;
							    }
					         
					         
					         
			         			
					         if(returnObjectArray[i].CONS_CLSF_LVL1_NM!=="")
						        {
					         		 insertedHTML += `</div>`;
							         insertedHTML += ` </li>`;
						        }
				         		
					         

					         insertedHTML += ` <li class="ai_part">
					           <h3>질문</h3>
					           <div>
					             <div class="ai_part_txt">
					             <h4><p>`+qust+`</p></h4>
					             </div>
					           </div>
					         </li>`;
					         
					 			
					         if(ansr!=="")
						        {
						         insertedHTML += ` <li class="ai_part">
						           <h3>AI</h3>
						           <div>
						             <div class="ai_part_txt">
						             <p>`+ansr+`</p>
						               <div class="chang_open_con">

						            	 <span><button class="chang_open_btn trigger">
						            	 <input type="hidden" class="counsel_poopup_title_val" value="`+qust+`">
						            	 <input type="hidden" class="counsel_poopup_con_val" value="`+ansr+`">
						            	 </button></span>
						                 <span><input type="checkbox" id="ai_check_1" name="ai_check_1" disabled><label for="ai_check_1"></label></span>
						               </div>
						             </div>
						           </div>
						         </li>`;

						        }
				         		
					               $.ajax({
								   type: 'GET',
								   url: 'http://<%= taServer %>/api/history/get/tbAiKMSRplyHist',
								   async: false, // 동기적으로 요청을 보냅니다.
								   data: {
								     cons_hstr_id: '${callId}',
								     sqnc: i+1
								   },
								   dataType: 'json',
								   async: false,
								   success: function(data) {
								     // 성공적으로 데이터를 받았을 때 실행할 코드

							          var jsonString = JSON.stringify(data);
									    console.log("::: KMS" + jsonString);
									    
					    			    var dataArray = data.returnObject;

									    console.log("::: KMSwwwwwwwwwwwwwwwwwwwwww " + dataArray.length);
									    console.log("::: KMSwwwwwwwwwwwwwwwwwwwwww123 " + (dataArray.length==0));
									    console.log("::: KMSwwwwwwwwwwwwwwwwwwwwww123555 " + (dataArray.length>0));
					    				
									    if(dataArray.length>0)
									    	{
									    	
									    insertedHTML += `<li class="kms_part">
					    						           <h3>KMS</h3>
					    						           <div>
					    						             <div class="kms_part_txt">
					    						               <ul>`;
					    						               
								        for (var i = 0; i < dataArray.length; i++) {
								        	

										    console.log("::: KMS11" + dataArray[i].kms_cnts_url);

										    console.log("::: KMS22" + dataArray[i].kms_cnts_titl);

										    console.log("::: KMS33" + dataArray[i].use_div_cd);
								        	
								        	
										    insertedHTML += `
										    <li>
								                   <a href="javascript:window.open('`+dataArray[i].kms_cnts_url+`', '_blank', 'width=1200, height=600');">
							                     <div class="kms_part_con">
							                       `+dataArray[i].kms_cnts_titl;

							                       if("Y"==dataArray[i].use_div_cd)
							                    	{

										               insertedHTML += `<span><input type="checkbox" data-cntnt-id="518" checked><label for=""></label></span>`;
							                    	}
							                        else
							                    	{
							                        	   insertedHTML += `<span><input type="checkbox" data-cntnt-id="518"><label for=""></label></span>`;
							                    	}
							                       
							                       
							                       
							                       
							               insertedHTML += `</div>
							                   </a>
							                 </li>
							                 `;
								        	
								            
								        }

										insertedHTML += `</ul>
										             </div>
										           </div>
										         </li>`;
								   

									    	}
								   
								   },
								   error: function(xhr, status, error) {
								     // 오류가 발생했을 때 실행할 코드
								     console.error(error);
								   }
								 });
					               
		  insertedHTML += `</ul>
					     </div>
					   </div>`;
				 

						 console.log("1111111111111111111111111");
			 answer_num = (i+1);
			 console.log("2222222222222222222222222");
			 }
			 console.log("333333");

			 
			 if(answer_num==0||answer_num==1)
			{
				 $('.label_sticky').css("display", "none");
						 
			}else
			{
				 $('.label_sticky').css("display", "block");
				
			}
			 
			 
			 

			 
			 var pagination_answer = new tui.Pagination('pagination_answer', {
                 totalItems: answer_num,
         		itemsPerPage: 1,
         		visiblePages: 10
         	});
			 console.log("444444");
			 
	    		$('#answer_content').append(insertedHTML);
		 

	    		// 삽입할 HTML 코드를 생성합니다.
					

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
	    		


	            $(".chang_open_btn").click(function() {

	            	$('.label_sticky').css('display', 'none');

	 				$("#counsel_poopup_title").html($(this).find(".counsel_poopup_title_val").val());
					$("#counsel_poopup_con").html($(this).find(".counsel_poopup_con_val").val()); 
					
					
					$('#counsel_popup').css('display', 'block');
	            	$('.label_sticky').css('display', 'none');
	            	
	            	
	            	
	            	
	                //alert("버튼이 클릭되었습니다!");
	                // 원하는 동작을 여기에 추가
	            });
		 
		  },
		  error: function(error) {
		    // 오류가 발생했을 때 실행할 코드를 여기에 작성하세요.
		    console.error(error);
		  }
		});
		
	
</script>
<script class="code-js">

/* 	////22222
	console.log("222222222222222222222222222222222222222222222");
	var pagination_answer = new tui.Pagination('pagination_answer', {
        totalItems: 1,
		itemsPerPage: 1,
		visiblePages: 1
	});
 */



	
</script>
</body>
</html>