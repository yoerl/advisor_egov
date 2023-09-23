
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
   $(document).ready(function() {
   	
   	
   	$(document).on("click", "#btn_del", function() {

           // AJAX DELETE 요청 보내기
           $.ajax({
               url: "${path}/api/notice/" + $(this).data("noti_sqno") + ".do", // 엔드포인트 URL
               type: "DELETE", // HTTP DELETE 메서드 사용
               success: function(response) {
                   // 요청 성공 시 실행할 코드
                   if (response === "true") {
                       alert("공지사항이 삭제되었습니다.");
                       // 삭제 성공 후 필요한 동작 수행
                       location.reload();
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
   	
   	fnSearch(1);
   	
   });

   	
   function fnSearch(currentPage) {

	$.ajax({
		type: "GET", // HTTP 요청 방식 (GET, POST 등)
		url: "${path}/api/notices.do",
		/* dataType: "json", // 응답 데이터 형식 (JSON, XML 등) */
		data : {"currentPage" : currentPage},
		success: function(jsonString) {
			var jsonArray = JSON.parse(jsonString);
			// 요청 성공 시 실행될 함수
			console.log("AJAX  성공: " + jsonString);
			

			var ulElement = document.querySelector(".board-list");
			ulElement.innerHTML = '';
			
			for (var i = 0; i < jsonArray.length; i++) {
				
				var item = jsonArray[i];
				console.log("AJAX  성공2222: " + item.amntDttm);
				var liElement = document.createElement("li");
	
				liElement.innerHTML += '' +
				'<a href=${path}/page/notice_view.do?notiSqno='+item.notiSqno+'>' +
				'<p>' + item.notiTitlNm + '</p>' +
				'<span class="notice_date">'+item.rgsnDttmStr+'</span>' +
				'</a>' +
				'<div class="manager">' +
				'<span>'+item.rgsrNm+'</span>' +
				'<a href="#" id="btn_del" data-noti_sqno='+item.notiSqno+' class="btn_del_con">삭제</a>' +
				'</div>';
				
				ulElement.appendChild(liElement);
				
			}
			// 페이징 적용
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
		
		<a href="javascript:history.go(-1);">
			<img src="../images/icons/arrow-left.png" alt="">
		</a>공지사항</h2>
	
	<div class="btn_close">
		<a href="${path}/page/home.do">
			<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
		</a>
	</div>
</div>
<div class="right_contents">
	<div class="notice_con_inner">
	<form name="" method="" action="">
		<div class="board_write_btn">
				<a href="${path}/page/notice_write.do">등록</a>		
		</div>
		<ul class="board-list">
			 <li>
			</li>
		</ul>

		
	<!-- pagenation -->
		
	</div>
	<!-- 삭제팝업창 -->
		<div id="del_alert_popup">
			<div class="del_alert_head">
				<h3>삭제</h3>
			</div>
			<div class="del_alert_con">
				<p>게시물을 정말 삭제하시겠습니까?</p>
			</div>
			<div class="del_alert_btn">
				<a href="#" class="bnt_cancle">취소</a><a href="">삭제</a>
			</div>
		</div>
	<!-- 삭제팝업창 -->
	</form>
	
	<!-- 페이징 -->
	<div class="code-html pagenation" id="pageArea"></div>
	
</div>
<script> 
 	$(document).ready(function(){ 
	$("a.btn_del_con").click(function(){ 
	$("#del_alert_popup").css("display", "block");
	}); 
	$(".del_alert_btn a.bnt_cancle").click(function(){ 
	$("#del_alert_popup").css("display", "none"); 
	}); 
	}); 
</script>
