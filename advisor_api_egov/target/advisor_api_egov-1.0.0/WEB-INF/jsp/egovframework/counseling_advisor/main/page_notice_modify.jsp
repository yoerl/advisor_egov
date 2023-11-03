<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <style>
	  .ck-editor__editable { height: 2000px; }
	</style>
    <script>
	$(document).ready(function() {



	    // AJAX 요청 보내기
	    $.ajax({
	        type: "GET",
	        url: "${path}/api/notice/<%= request.getParameter("notiSqno")%>.do",
	        success: function(jsonString) {
	            // 요청 성공 시 응답을 처리하는 함수 호출
	            

		        var jsonArray = JSON.parse(jsonString);

		        // 공지사항 내용 출력
		        editor.setData(jsonArray[0].notiCntn);

		        document.getElementById("area_noti_title").value = jsonArray[0].notiTitlNm;;

		        
	        },
	        error: function(request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	    
        
        
	    	
	        // 버튼 클릭 이벤트 핸들러
	        $("#btn_save").click(function() {        
	            var jsonData = {
	                    notiSqno: <%= request.getParameter("notiSqno")%>,          // 문자열 데이터
	                    userId: "test_userId",        // 문자열 데이터
	                    userNm: "test_userNm",       // 문자열 데이터
	                    notiTitlNm: document.getElementById("area_noti_title").value, // 문자열 데이
	                    notiCntn: editor.getData(), // 문자열 데이터
	                    amndId: "",       // 문자열 데이터
	                    amndNm: "",          // 문자열 데이터
	                    amntDttm: "", // Timestamp 형식의 문자열 데이터
	            };


	    	    // AJAX 요청 보내기
	    	    $.ajax({
	    	        type: "PUT",
	    	        url: "${path}/api/notice.do",
	                data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
	    	        success: function(response) {
	    	            // 요청 성공 시 응답을 처리하는 함수 호출
	                   	if(response=="true")
	                   	{
	                   		alert("수정 완료 하였습니다.");

	            	        fnPageLoad('${path}/page/notice.do','');
	                   	}
	                   	else
	                   	{
	                   		alert("수정 실패 하였습니다");
	                   	}
	    	            
	    				

	    		        
	    	        },
	    	        error: function(request, status, error) {
	    	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	    	        }
	    	    });
	        });
	        
	    
		 // "취소" 버튼 클릭 이벤트 핸들러
	    document.getElementById("btn_cancel").addEventListener("click", function() {
	        // 페이지 자동 이동
	        
	        fnPageLoad('${path}/page/notice.do','');
	    });

	    
	    
	});
    </script>
				<div class="right_input_title">
					<h2>
						<a href="javascript:history.go(-1);">
							<img src="../images/icons/arrow-left.png" alt="">
						</a><input id="area_noti_title" type="text" size="20" maxlength="30" name="" value="" placeholder="공지사항 제목을 작성해주세요."></h2>
					
					<div class="btn_close">
						<a href="${path}/page/home.do">
							<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></span>
						</a>
					</div>
				</div>
				<div class="right_contents">
					<div class="view_con_inner">
						
						<div class="edit_write_content">
							<textarea name="area_noti_content" id="area_noti_content"></textarea>
							<script type="text/javascript">
								/* ck editor 5 적용 */
							  ClassicEditor
							    .create( document.querySelector( '#area_noti_content' ),{
							    	language : "ko"
							    } )
							    .then( newEditor => {
								    editor = newEditor;
								  } )
							    .catch( error => {
							    } );
							</script>
						</div>
						<!-- button -->
							<!-- button -->
							<div class="board_bottom_btn">
							    <button type="button" id="btn_cancel" class="btn_cancel">취소</button>
							    <button type="button" id="btn_save">저장</button>
							</div>

						
						<!-- button -->
					
					</div>
				</div>