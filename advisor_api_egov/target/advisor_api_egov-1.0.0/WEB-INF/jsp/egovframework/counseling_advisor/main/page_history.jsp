<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String messageServerIp = getServletContext().getInitParameter("messageServerIp");
%>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String taServer = getServletContext().getInitParameter("taServer");
%>
<%
// 맥락 파라미터 'userID' 값을 가져오기
String myServerIp = getServletContext().getInitParameter("myServerIp");
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
.ellipsis-text {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    width: 150px; /* 원하는 너비 설정 */
    display:inline-block;
    
    
}

a {
  white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 설정 */
  overflow: hidden; /* 넘치는 텍스트를 숨김 */
  text-overflow: ellipsis; /* 넘치는 텍스트에 말줄임 표시 (...) 적용 */
  max-width: 100%; /* a 태그의 최대 너비를 설정 (부모 요소에 따라 다를 수 있음) */
}

    </style>
    <script> 

function performAjaxRequest(page_no,serch_text) {
	

	var requestData = {
		    index_names: "tb_cons_meta_hstr",
		    date_format: "yyyy-MM-dd HH:mm:ss",
		    return_fields: "CONS_HSTR_ID/CONS_STT_TIME/CALL_ID/INTT_CD/INTT_CD_NM/CNSR_ID/CNSR_ID_NM/DPMS_ID",
		    date_display_columns: "CONS_STT_TIME",
		    date_display_format: "yyyy.MM.dd HH:mm:ss",
		    q:serch_text,
		    startPos: page_no,
		    retCount: 10,
		    sortOrder: "C_DATE desc"
		};
    
    
    
	

  $.ajax({
      type: "GET",
      url: "http://<%= taServer %>/api/history/search/tbConsMetaHstr",
      data: requestData, // 파라미터 데이터 설정
      
      success: function(data) {
          var jsonString = JSON.stringify(data, null, 2);
         
          
          // 'SEARCH_CNTN' 값을 추출하는 로직
          var returnObjects = data.returnObject;
          

	        var $boardList = $("#board-list");
	        
	    	$boardList.empty();
          for (var i = 0; i < returnObjects.length; i++) {
              
		        // 삽입할 `<li>` 항목 정의
		        var listItem = `
		            <li>
						<div style = "display:flex; flex-direction: row; justify-content: space-between;background: #fff;padding: 20px 20px 20px 20px;">
							<div>`+returnObjects[i].CONS_STT_TIME_FORMATTED+`</div>
							<div style = "display:flex; flex-direction: row;">
								<p style="padding-right:10px;">`+returnObjects[i].INTT_CD_NM+" | "+returnObjects[i].CALL_ID+" | "+returnObjects[i].CNSR_ID_NM+`</p>
								<div>
									<a href="#"  class="btn_view_history" data-call-id=`+returnObjects[i].CALL_ID+`>보기</a>
								</div>
							</div>
						</div>
		            </li>
		        `;
		        
	
                                    

		        // `<ul>` 태그 안에 `<li>` 항목 삽입
		        
                   $("#board-list").append(listItem);
		        
          }
          
    	  
    	  $('.btn_view_history').on('click', function() {
    		  

              	var callId = $(this).attr('data-call-id');
    		    // 팝업 창의 URL과 창의 속성을 설정합니다.
    		    var popupURL = "${path}/page/history_popup.do?call_id=" + callId;

    		    var popupName = "팝업 이름";
    		    // 팝업 창 열기
    		    window.open(popupURL, "_blank", "width=900, height=600");
    	  });
          
          

      },
      error: function(request, status, error) {
          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
      }
  });
  
 
  
}






function onpenPopup(){
	  
    // 팝업 창의 URL과 창의 속성을 설정합니다.
    var popupURL = "${path}/advisor_api_egov/page/history_popup.do";
    var popupName = "팝업 이름";
    // 팝업 창 열기
    window.open(popupURL, "_blank", "width=900, height=600");
}



</script>



				<div class="right_title">
					
						<h2><a href="javascript:history.go(-1);">
						</a>상담이력</h2>
					
					
					
					
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
						<div class="board_search">
								<input id="serch_text" type="text" size="20" maxlength="30" name="" value="" placeholder="검색어를 입력하세요.">
								<button  id="btn_search">조회</button>						
							
						</div>
						<ul class="board-list" id="board-list">

							

						</ul>
						
					</div>
					
					
					<div class="code-html pagenation">
						<div id="pagination1" class="tui-pagination"><a href="#" class="tui-page-btn tui-first"><span class="tui-ico-first">first</span></a><a href="#" class="tui-page-btn tui-prev"><span class="tui-ico-prev">prev</span></a><a href="#" class="tui-page-btn tui-first-child">1</a><strong class="tui-page-btn tui-is-selected">2</strong><a href="#" class="tui-page-btn">3</a><a href="#" class="tui-page-btn">4</a><a href="#" class="tui-page-btn">5</a><a href="#" class="tui-page-btn tui-next-is-ellip tui-last-child"><span class="tui-ico-ellip">...</span></a><a href="#" class="tui-page-btn tui-next"><span class="tui-ico-next">next</span></a><a href="#" class="tui-page-btn tui-last"><span class="tui-ico-last">last</span></a></div>	
					</div>
					
				</div>



<script class="code-js">
	var pagination1 = new tui.Pagination('pagination1', {
		totalItems: 500,
		itemsPerPage: 10,
		visiblePages: 5
	});
	
	 pagination1.on('afterMove', function(eventData) {
		    // 이벤트 핸들러 내에서 현재 페이지 번호를 가져옵니다.
		    var currentPage = eventData.page;
		    
		    
		    performAjaxRequest(currentPage,$("#serch_text").val());
		});
</script>


<script>

$(document).ready(function() {
    // 페이지 로드 후 실행되는 코드
    $("#btn_search").click(function() {
        // 검색 버튼 클릭 시 AJAX 요청 수행
        var currentPage = 1; // 현재 페이지
        var searchText = $("#serch_text").val(); // 검색어 입력란의 값

        performAjaxRequest(currentPage, searchText);
        pagination1.movePageTo(1);
    });

    
    // 페이지 로드 후 초기 데이터 가져오기
    var currentPage = 1; // 초기 페이지
    var searchText = ""; // 초기 검색어

    performAjaxRequest(currentPage, searchText);
    
});

</script>
