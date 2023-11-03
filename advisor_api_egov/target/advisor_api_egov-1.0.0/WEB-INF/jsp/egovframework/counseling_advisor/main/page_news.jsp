<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%
//http://localhost:8080/advisor_api_egov/api/auth/login.do

String user_id = (String) session.getAttribute("user_id");
%>

<script>
    $(document).ready(function() {
    	
    	fnSearch(1);
    	
    });
    
    function fnSearch(currentPage) {
	    $.ajax({
		    type: "GET",
		    url: "${path}/api/news.do",
		    data : {"currentPage" : currentPage, "receiverId" : '<%=user_id%>'},
		    success: function(jsonString) {
		        var jsonArray = JSON.parse(jsonString);


				
				let html = "";
				
		        for (var i = 0; i < jsonArray.length; i++) {
		        	
		            var item = jsonArray[i];
		            
		        	
		        	html += "<li>";
		        	html += "	<div class='checkbox'>";
		        	html += "		<span>";
		        	html += "			<input type='checkbox' id='check" + (i+1) + "' name='chk" + (i+1) + "' value='" + item.newsSqno + "'>";
		        	html += "			<label for='check" + (i+1) + "'></label>";
		        	html += "		</span>";
		        	html += "	</div>";
		        	html += "	<a href=javascript:fnPageLoad('${path}/page/news_view.do','newsSqno="+item.newsSqno+"');";
		        	
		        	
		        	
		        	if(item.readYn == "Y") {
		        		html += "	class='visited'";
		        	}
		        	html += ">";
		        	html += "		<p>" + item.newsTitlNm + "</p>";
		        	html += "		<span class='notice_date'>" + item.rgsnDttm + "</span>";
		        	html += "	</a>";
		        	html += "</li>";

		        }
		        
		        $('.news-list').html(html);
		        newsNotReadCnt();
		        // 페이징
		        fnPaging(jsonArray[0].pagination);
	
		    },
		    error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }
		});
	    
    }
    
    // 전체선택 클릭 함수
    function fnSelAllBtn() {
    	let chkBox = $(".checkbox input[type=checkbox]");
    	let chkAllYn = $("#chkAllYn");

    	if(chkAllYn.val() == "N") {
	    	chkBox.prop("checked", true);
	    	chkAllYn.val("Y");
    	} else {
    		chkBox.prop("checked", false);
    		chkAllYn.val("N");
    	}
    }
    
    // 읽음처리 클릭 함수
    function fnReadAct() {
    	
		var chkArry = new Array();
		
		$(".checkbox input[type='checkbox']:checked").each(function() {
			chkArry.push($(this).val());
		});
		
		if(chkArry.length < 1) {
			alert("읽음처리 할 항목을 선택해주세요.");
			return false;
		}
		
		
		
    	$.ajax({
		    type: "GET",
		    url: "${path}/api/newsRead.do",
		    /* dataType: "json", */
		    data : { "chkArry" : chkArry },
		    success: function(jsonString) {
		    	
		    	fnSearch(1);
		    	$('#chk_news_popup').css('display', 'block');	
		    },
		    error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }
		});

    	
    }

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
    </script>

	<div class="notice_title">
		<h2>알림</h2>
		
	</div>
	<div class="notice_contents">
		<div class="notice_con_inner">
			<div class="view_total">
				<button type="button" class="btn_ranking"  onClick="fnPageLoad('${path}/page/ranking.do','');">키워드 랭킹</button>
				
				
				<div class="alim_button">
					<input type="hidden" id="chkAllYn" value="N">
					<a href="#" class="btn_choice_total" onclick="fnSelAllBtn();">전체선택</a>
					<a href="#" class="btn_view_total" onclick="fnReadAct();">읽음처리</a>
				</div>
			</div>
		<!-- notice-list -->
		<form id="frm" name="frm" method="post">
			<ul class="news-list"></ul>
		</form>
		<!-- 삭제팝업창 -->
			<div id="del_alert_popup">
				<div class="del_alert_head">
					<h3>삭제</h3>
				</div>
				<div class="del_alert_con">
					<p>게시물을 정말 삭제하시겠습니까?</p>
				</div>
				<div class="del_alert_btn">
					<a href="" class="bnt_cancle">취소</a><a href="">삭제</a>
				</div>
			</div>
		<!-- 삭제팝업창 -->
		</div>
		
		<!-- 페이징 -->
		<div class="code-html pagenation" id="pageArea">
		</div>
		
	</div>