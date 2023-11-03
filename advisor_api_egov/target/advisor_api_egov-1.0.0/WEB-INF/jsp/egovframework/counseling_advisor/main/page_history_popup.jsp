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
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/font.css'/>"/>
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
				<div class="counsel">
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
							
							
							</div>
							
						</div>
						
					<!-- cousel -->
					<!-- chating popup -->
					<!-- chating popup -->
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
	    retCount: '10',
	    sortOrder: 'DOC_ID'
	  },
	  headers: {
	    'accept': 'application/json'
	  },
	  success: function(response) {
	    // 요청이 성공했을 때 실행할 코드
	    

        for (var i = 0; i < response.returnObject.length; i++) {
           


    	    
        	
        	if(response.returnObject[i].TALKER=="R"){



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
        	if(response.returnObject[i].TALKER=="C")
           	{



				var insertedHTML = '<li class="counseller">' +
				                  '<em>상담사 '+response.returnObject[i].TALKER_INFO+')</em>' +
				                  '<div class="chattok"><p>'+response.returnObject[i].SCRT_CNTN+'</p>'+
				                  '</div>';

				$('#chating_contents').append(insertedHTML);
				                
           	}
        }
        
        
        
        
        
	    
	   	  },
	  error: function(xhr, textStatus, errorThrown) {
	    // 요청이 실패했을 때 실행할 코드
	    console.error(errorThrown);
	  }
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