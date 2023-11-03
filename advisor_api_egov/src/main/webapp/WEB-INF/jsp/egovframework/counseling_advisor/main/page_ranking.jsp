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

				<div class="rangking_title">

						<a href="javascript:fnPageLoad('${path}/page/news.do','');">
							<img src="../images/icons/arrow-left.png" alt="">
						</a>
						<h2 id="keyword" style="display: inline-block;">
							급상승 키워드
						</h2>
						<div class="btn_close"><span><a href="javascript:fnPageLoad('${path}/page/answer.do','');"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				
				</div>
				
				
				<div class="rangking_contents">
					<div class="rangking_con_inner">
						<div class="rangking_keyword">
											<select id="keyword_type" name="keyword_type">
											    <option value="trending">급상승 키워드</option>
											    <option value="accumulated">누적 키워드 랭킹</option>
											    <option value="dangerous">위험/블랙 키워드 랭킹</option>
											</select>					
							
						</div>
						<div class="rangking_data_table">
						    <ul>
						        <li class="header"><div>순번</div><div>키워드</div><div>%(건)</div></li>
						    </ul>
						</div>
													
						</div>

					
					</div>
					
					
					
					
<script>
function performAjaxRequest(selectedValue) {
	
	var currentDate = new Date();

	var year = currentDate.getFullYear();
	var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
	var day = currentDate.getDate().toString().padStart(2, '0');

	var formattedDate = year + '-' + month + '-' + day;
	
    // 선택된 값에 따라 다른 작업 수행
    if (selectedValue === "trending") {
		$("#keyword").text("급상승 키워드");
    	
			    $.ajax({
			    	  url: 'http://<%= taServer %>/api/ta/rank/rising',
			    	  type: 'GET',
			    	  data: {
			    	    intt_cd: '<%=intt_cd%>',
			    	    date_from: formattedDate,
			    	    day_count: '1',
			    	    top_rank: '5',
			    	    rank_type: 'RISING_SUDDEN'
			    	  },
			    	  dataType: 'json',
			   		 success: function(data) {

				          
			   			
				          var jsonString = JSON.stringify(data);
				

			                console.log("data : " +data);
			                console.log("jsonString : " +jsonString);
		            		var ulElement = $(".rangking_data_table ul");
		            		ulElement.html("<li class='header'><div>순위</div><div>키워드</div><div>현재순위</div></li>");
		            		
		            		
				            for (var i = 0; i < Object.values(data.returnObject)[0].length; i++) {
				                var term = Object.values(data.returnObject)[0][i].term; // "term" 속성 가져오기
				               

				                var rank = parseFloat(Object.values(data.returnObject)[0][i].rank);
				                var beforeRank = parseFloat(Object.values(data.returnObject)[0][i].beforeRank);

				                console.log("11111 : " +rank);
				                console.log("2222 : " + beforeRank);
						     
				                // 두 숫자를 뺄셈
				                var upSize = beforeRank - rank;
				                if(upSize<0)
				                {
				                	upSize = "new!"
				                }
				                	
				                	
				                    var newLi = $("<li class='rangking_data'><div>" + (i+1) + "</div><div>" + term + "</div><div>" + upSize + "</div></li>");
				                    ulElement.append(newLi);
				                    
				                    
				            }
				            
			    },
			    error: function(request, status, error) {
			        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			    }
			});

    	  
        // 급상승 키워드에 대한 동작 수행
    } else if (selectedValue === "accumulated") {
    	$("#keyword").text("누적 키워드 랭킹");

		$.ajax({
			  url: 'http://<%= taServer %>/api/dashboard/rank/top',
			  type: 'GET',
			  data: {
			    intt_cd: '<%=intt_cd%>',
			  	//date_from: '2023-09-22',
			  	date_from: formattedDate,
	    	    
			    day_count: '1',
			    top_rank: '5',
			    rank_type: 'RISING'
			  },
			  dataType: 'json',
			  headers: {
			    'accept': 'application/json'
			  },
		    success: function(data) {
		    	


		          var jsonString = JSON.stringify(data);
		          

          		var ulElement = $(".rangking_data_table ul");
          		ulElement.html("<li class='header'><div>순번</div><div>키워드</div><div>건수</div></li>");
          		
          		
		            for (var i = 0; i < Object.values(data.returnObject)[0].length; i++) {
		                var rank = Object.values(data.returnObject)[0][i].rank; // "term" 속성 가져오기
		                var term = Object.values(data.returnObject)[0][i].term; // "term" 속성 가져오기
		                var df = Object.values(data.returnObject)[0][i].df; // "term" 속성 가져오기
		            
		                	
		                    var newLi = $("<li class='rangking_data'><div>" + rank + "</div><div>" + term + "</div><div>" + df + "</div></li>");
		                    ulElement.append(newLi);
		                    
		                    
		            }
		            
		            
		            

		          var jsonString = JSON.stringify(data);
		    },
		    error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }
		});
        // 누적 키워드 랭킹에 대한 동작 수행
    } else if (selectedValue === "dangerous") {
    	$("#keyword").text("위험/블랙 키워드 랭킹");
    	
		$.ajax({

			  url: 'http://<%= taServer %>/api/dashboard/rank/black',
			  type: 'GET',
			  data: {
			    intt_cd: '<%=intt_cd%>',
			  	// date_from: '2023-09-22',
			  	date_from: formattedDate,
	    	    
			    return_fields: '*',
			    startPos: '1',
			    retCount: '5',
			    sortOrder: 'DOC_COUNT DESC'
			  },
			  dataType: 'json',
			  headers: {
			    'accept': 'application/json'
			  },
			  
			  
			  
		    success: function(data) {
		          var jsonString = JSON.stringify(data);
			

            		var ulElement = $(".rangking_data_table ul");
            		ulElement.html("<li class='header'><div>순번</div><div>키워드</div><div>건수</div></li>");
            		
            		
		            for (var i = 0; i < data.returnObject.length; i++) {
		                var doc_count = data.returnObject[i].DOC_COUNT; // "term" 속성 가져오기
		                var keyword = data.returnObject[i].KEYWORD; // "term" 속성 가져오기
		                var row_num = data.returnObject[i].ROW_NUM; // "term" 속성 가져오기
		
		                    var newLi = $("<li class='rangking_data'><div>" + row_num + "</div><div>" + keyword + "</div><div>" + doc_count + "</div></li>");
		                    ulElement.append(newLi);
		                    
		                    
		            }
		            
		            
		    },
		    error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }
		});
    }
	
	
}
</script>
