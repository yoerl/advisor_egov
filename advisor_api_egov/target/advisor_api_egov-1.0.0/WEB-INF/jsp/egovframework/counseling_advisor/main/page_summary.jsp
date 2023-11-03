<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String taServer = getServletContext().getInitParameter("taServer");
%>


<script>

$(document).ready(function() {
	
	
	
	fnSearch(1);
	
});


function fnSearch(currentPage) {
	
	  $.ajax({
	      type: "GET",
		  url: "${path}/api/ext-api/summary.do",
		  data : {"currentPage" : currentPage, "searchText" : $("#serch_text").val()},
	      success: function(jsonString) {

				var jsonArray = JSON.parse(jsonString);
				// 요청 성공 시 실행될 함수
				
	          var $boardList = $("#board-list-summary");
		        
		      $boardList.empty();
		      for (var i = 0; i < jsonArray.length; i++) {
		    	  var item = jsonArray[i];
		    	  var recpNo = item.recpNo;
		    	  var aiBrfCntn = item.aiBrfCntn;
		    	  var kmsMemoCntn = item.kmsMemoCntn;
		    	  
		    	  
		    	  //{"recpNo":"11339994","aiBrfCntn":"부천_정리천리_세","kmsMemoCntn":"부천_정리천리_세"},{"recpNo":"11339995","aiBrfCntn":"의원,이,가재,백사,가재리타","kmsMemoCntn":"의원,이,가재,백사,가재리타"},{"recpNo":"10004001","aiBrfCntn":"피","kmsMemoCntn":"피"},{"recpNo":"11339994","aiBrfCntn":"하늘,바제사,가비,사원,병원","kmsMemoCntn":"하늘,바제사,가비,사원,병원"},{"recpNo":"11339995","aiBrfCntn":"아서,하늘,바제사,가비,사원","kmsMemoCntn":"아서,하늘,바제사,가비,사원"},{"recpNo":"11339995","aiBrfCntn":"꽃","kmsMemoCntn":"꽃"},{"recpNo":"11339994","aiBrfCntn":"날개","kmsMemoCntn":"날개"},{"recpNo":"11339994","aiBrfCntn":"공주육사교,인산,노림시사여구","kmsMemoCntn":"공주육사교,인산,노림시사여구"},{"recpNo":"11339995","aiBrfCntn":"화곡로_머브리하스_미니즈","kmsMemoCntn":"화곡로_머브리하스_미니즈"},{"recpNo":"01087491810","aiBrfCntn":"얼마,안,의원,의","kmsMemoCntn":"얼마,안,의원,의"}]
		    	  
			        // 삽입할 `<li>` 항목 정의
			        var listItem = `
			            <li>
			                <a href="javascript:fnPageLoad('${path}/page/summary_view.do','callId=`+item.callId+`');">
			                    <p class=".ellipsis-text" style="margin-right: 80px;">`+item.aiBrfCntn+`</p>
			                    <span class="notice_date">`+item.consSttTime+`</span> 
			                </a>
			                <div class="manager">
			                    <span>`+item.userNm+`</span>
			                    <span>`+item.recpNo+`</span>
			                </div>
			            </li>
			        `;
	
			        // `<ul>` 태그 안에 `<li>` 항목 삽입
			        $boardList.append(listItem);
			        
		    	}

				fnPaging(jsonArray[0].pagination);
	          
	
	      },
	      error: function(request, status, error) {
	          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	      }
	  });
	  
	 
	  
	}

</script>

				<div class="right_title">
					<h2>
						<a href="javascript:fnPageLoad('${path}/page/summary.do','');">
						</a>상담이력요약</h2>
					
					<div class="btn_close">
						<a href="javascript:fnPageLoad('${path}/page/answer.do','');">
							<%-- <span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span> --%>
						</a>
					</div>
					
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
						<div class="board_search">
								<input id="serch_text" type="text" size="20" maxlength="30" name="" value="" placeholder="검색어를 입력하세요.">
								<button id = "btn_search_summary">조회</button>								
							
						</div>
					<!-- notice-list -->
						<ul id="board-list-summary" class="board-list">

						</ul>
					<!-- notice-list -->
						
					</div>
					
					
					<div class="code-html pagenation" id="pageArea">
					</div>
				</div>



	<script> 

    // 페이지 로드 후 실행되는 코드
    $("#btn_search_summary").click(function() {
        // 검색 버튼 클릭 시 AJAX 요청 수행
        //var currentPage = 1; // 현재 페이지
        //var searchText = $("#serch_text").val(); // 검색어 입력란의 값

        fnSearch(currentPage);
        //pagination1.movePageTo(1);
    });

    // 페이지 로드 후 초기 데이터 가져오기
    var currentPage = 1; // 초기 페이지
    var searchText = ""; // 초기 검색어

    fnSearch(currentPage);
	
	</script>
	
<script class="code-js">
	var pagination1 = new tui.Pagination('pagination1', {
		totalItems: 500,
		itemsPerPage: 10,
		visiblePages: 5
	});
	

	 pagination1.on('afterMove', function(eventData) {
		    // 이벤트 핸들러 내에서 현재 페이지 번호를 가져옵니다.
		    var currentPage = eventData.page;
		    
		    
		    fnSearch(currentPage);
		});
</script>
