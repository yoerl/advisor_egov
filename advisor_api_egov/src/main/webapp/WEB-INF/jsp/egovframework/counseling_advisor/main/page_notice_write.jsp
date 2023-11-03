<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
//http://localhost:8080/advisor_api_egov/api/auth/login.do

String user_id = (String) session.getAttribute("user_id");
String user_nm = (String) session.getAttribute("user_nm");
%>
    <style>
	  .ck-editor__editable { height: 2000px; }
	</style>
    <script>
	$(document).ready(function() {
        
	        // 버튼 클릭 이벤트 핸들러
	        $("#btn_save").click(function() {
	        	
	            // 서버로 보낼 JSON 데이터
	            var jsonData = {
	                    notiTitlNm: document.getElementById("area_noti_title").value, // 문자열 데이터
	                    notiCntn: editor.getData(), // 문자열 데이터
	                    rgsrId: '<%=user_id%>',        // 문자열 데이터
	                    rgsrNm: '<%=user_nm%>'     // 문자열 데이터
	            };
	            
	            // AJAX 요청 설정
	            $.ajax({
	                url: "${path}/api/notice.do",  // 서버의 API 엔드포인트 URL
	                type: "POST",              // HTTP 메서드 (POST, GET 등)
	                async: false,                // 동기적 요청 활성화
	                data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
	                contentType: "application/json", // 요청 본문의 데이터 타입 설정
	                success: function(response) {
	                    // 요청 성공 시 실행할 코드
	                   	if(response=="true")
	                   	{
	                   		$('#reg_alert_popup').css('display', 'block');	
	                   	 	//window.location.href = "${path}/page/notice.do";
	                   	 	
	                   	 										
								      var jsonData_news = {
								            	"receiverId": "<%=user_id%>" ,
								            	"newsTitlNm": "공지사항이 등록 되었습니다. " + document.getElementById("area_noti_title").value,
								            	"newsCntn": editor.getData(),
											}
							            
								      
								    // AJAX 요청 설정
								    $.ajax({
								        url: "${path}/api/news.do",  // 서버의 API 엔드포인트 URL
								        type: "POST",              // HTTP 메서드 (POST, GET 등)
								        async: false,                // 동기적 요청 활성화
								        data: JSON.stringify(jsonData_news), // JSON 데이터 문자열로 변환
								        contentType: "application/json", // 요청 본문의 데이터 타입 설정
								        success: function(response) {

									     
								            
								        },
								        error: function(xhr, status, error) {
								            // 요청 실패 시 실행할 코드
								            console.error("AJAX 오류: " + error);
								        }
								    });
								      
								      
	                   	 	fnPageLoad('${path}/page/notice.do','');
	                   	}
	                   	else
	                   	{
	                   		alert("등록 실패 하였습니다");
	                   	}
	                   	
	                   	
	                },
	                error: function(xhr, status, error) {
	                    // 요청 실패 시 실행할 코드
	                    console.error("AJAX 오류: " + error);
	                }
	            });
	        });
	        
	    


	    
	    
	});

    </script>
					<div class="right_input_title">
						<h2>
							<a href="javascript:fnPageLoad('${path}/page/notice.do','');">
								<img src="../images/icons/arrow-left.png" alt="">
							</a>
							<input id="area_noti_title" type="text" size="20" maxlength="30" placeholder="공지사항 제목을 작성해주세요.">
						</h2>
					<div class="btn_close"><span><a href="javascript:fnPageLoad('${path}/page/answer.do','');"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				
					</div>
					<div class="right_contents">
						<div class="view_con_inner">
							<div class="edit_write_content">
								<textarea name="area_noti_content" id="area_noti_content"></textarea>
								<script type="text/javascript">
								function MyCustomUploadAdapterPlugin(editor) {
								    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
								        return new UploadAdapter(loader)
								    }
								}
									/* ck editor 5 적용 */
								  ClassicEditor.create( document.querySelector( '#area_noti_content' ),{
								    	language : "ko",
								    	extraPlugins: [MyCustomUploadAdapterPlugin]
								    } )
								    .then( newEditor => {
									    editor = newEditor;
									  })
								    .catch( error => {
								    });
								</script>
							</div>
							<!-- button -->
								<!-- button -->
								<div class="board_bottom_btn">
								 <a href="javascript:fnPageLoad('${path}/page/notice.do','');"><button type="button" id="btn_cancel" class="btn_cancel">취소</button></a>
								    <button type="button" id="btn_save">저장</button>
								</div>
	
							
							<!-- button -->
						
						</div>
					</div>
					
					
					
					<form:form name="uploadForm" method="post" enctype="multipart/form-data">
						<input id="imgfile" type="file" name="image" size="60" title="file"/>
						<input type="button" name="btnSubmit" value="업로드"  onclick="fn_egov_save()" />
					</form:form>
					<script>

					
					function fn_egov_save() {	

						frm = document.uploadForm;
						inputImage = frm.image.value;
						
					    frm.action = "<c:url value='/api/fileUpload.do'/>";
					    frm.submit();
					}
					</script>