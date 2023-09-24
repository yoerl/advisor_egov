<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
    $(document).ready(function() {
    	
    	fnSearch(1);
    	
    });
    
    function fnSearch(currentPage) {
    	
	    $.ajax({
		    type: "GET",
		    url: "${path}/api/news.do",
		    /* dataType: "json", */
		    data : {"currentPage" : currentPage},
		    success: function(jsonString) {
		        var jsonArray = JSON.parse(jsonString);
		        console.log("AJAX 성공: " + jsonString);

				// 안읽은 알람 count
				let noReadCnt = 0;
				
				let html = "";
				
		        for (var i = 0; i < jsonArray.length; i++) {
		        	
		            var item = jsonArray[i];
	    	        console.log("AJAX 성공: " + item.newsSqno);
		            
		        	// 안읽은 알람 count
		        	if(item.readYn == 'N') noReadCnt++;
		        	
		        	html += "<li>";
		        	html += "	<div class='checkbox'>";
		        	html += "		<span>";
		        	html += "			<input type='checkbox' id='check" + i + "' name='chk" + i + "' value='" + item.newsSqno + "'>";
		        	html += "			<label for='check" + i + "'></label>";
		        	html += "		</span>";
		        	html += "	</div>";
		        	html += "	<a href='${path}/page/news_view.do?newsSqno=" + item.newsSqno + "'";
		        	if(item.readYn == "Y") {
		        		html += "	class='visited'";
		        	}
		        	html += ">";
		        	html += "		<p>" + item.newsCntn + "</p>";
		        	html += "		<span class='notice_date'>" + item.rgsnDttm + "</span>";
		        	html += "	</a>";
		        	html += "</li>";

		        }
		        
		        $('.news-list').html(html);
		        
		        // 페이징
		        fnPaging(jsonArray[0].pagination);
		        
		        // 안읽은 알람 cnt set
		        if(noReadCnt > 99) noReadCnt = "99+";
		        $("#nrdCnt").html(noReadCnt);
	
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
		
		console.log("chkArry :: " + chkArry);
		
		
    	$.ajax({
		    type: "GET",
		    url: "${path}/api/newsRead.do",
		    /* dataType: "json", */
		    data : { "chkArry" : chkArry },
		    success: function(jsonString) {
		    	
		    	fnSearch(1);
		    	
		    },
		    error: function(request, status, error) {
		        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    }
		});
    	
    }

    </script>

	<div class="notice_title">
		<h2>
			<a href="javascript:history.go(-1);">
				<img src="../images/icons/arrow-left.png" alt="">
			</a>알림</h2>
		
		<div class="btn_close">
			<a href="${path}/page/home.do">
				<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
			</a>
		</div>
	</div>
	<div class="notice_contents">
		<div class="notice_con_inner">
			<div class="view_total">
				<button type="button" class="btn_ranking"  onClick="location.href='${path}/page/ranking.do'">키워드 랭킹</button>
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
		<div class="code-html pagenation" id="pageArea"></div>
		
	</div>