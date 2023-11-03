<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    
    
    <script>
    
        $(document).ready(  function() {
        	            
        	function selectReq() {
        	
		            $.ajax({
		                type: "GET", // HTTP 요청 방식 (GET, POST 등)
		                url: "${path}/api/permission/req.do",
		                //data: JSON.stringify(jsonDataReq),
		                data: {"athrCd" : $("#role").val(),"inttCd" : $("#agent").val()},
		                
		                
		                /* dataType: "json", // 응답 데이터 형식 (JSON, XML 등) */
		                success: function(jsonString) {
		                    console.log("0900000");
		                    var jsonArray = JSON.parse(jsonString);
		                    // 요청 성공 시 실행될 함수
		                    console.log("111111111111111");
		                    console.log(jsonArray)
		                    console.log("22222");
		                    console.log(jsonString);
		                    console.log("3333");

	                        $('#group_setting_con tbody').html("");
		    			    for (var i = 0; i < jsonArray.length; i++) {
		    			    	
		    			        var item = jsonArray[i];
		    			        
		
		                        var newRow = '<tr>' +
		                                        '<td>'+item.userNm+'</td>' +
		                                        '<td>'+item.athrNm+'</td>' +
		                                        '<td><a href="#" id="btn_autho_setting" class="btn_autho_setting"  data-user_div_cd="'+item.athrCd+'"  data-user_id="'+item.userId+'">승인</a></td>' +
		                                    '</tr>';
		                        $('#group_setting_con tbody').append(newRow);
		                       
		    			    }
		                    // 새로운 행을 생성하고 데이터를 추가합니다.
		                    
		                    // 테이블에 새로운 행을 추가합니다.
		                    
		
		                    // id가 btn_autho_setting인 요소를 클릭할 때 이벤트 핸들러를 등록합니다.
		                    $(".btn_autho_setting").click(function() {
		                        // 클릭된 요소의 data-user_id 값을 가져옵니다.
		                        var userId = $(this).data('user_id');
		                        var userDivId = $(this).data('user_div_cd');
		                        
		                        var jsonData = {
		                        		userId: userId,         // 문자열 데이터
		                        		userDivCd: userDivId,         // 문자열 데이터
		                        };
		                        
		                        
		                        $.ajax({
		                            url: "${path}/api/permission/"+userId+".do", // 엔드포인트 URL
		                            type: "PUT", // HTTP DELETE 메서드 사용
		     		                data: JSON.stringify(jsonData), // JSON 데이터 문자열로 변환
		     		                contentType: "application/json", // 요청 본문의 데이터 타입 설정
		                            success: function(response) {
		
										if(response=="true")
										{
							                $('#chg_auth_popup').css('display', 'block');
											fnPageLoad("${path}/page/authority_setting.do",'');
											
										}
										else
										{
											alert("권한 승인에 실패하였습니다.");
										}
		                            	
		                            	
		                            },
		                            error: function(xhr, status, error) {
		                                // 요청 실패 시 실행할 코드
		                                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		                            }
		                        });
		                        
		                        
		                        
		                    });
		                    
		    				
		                    
		                    
		                },
		                error: function(request, status, error) {
		                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		                }
		            });
        	}
        	
        	$('#btn_autho_setting').click(function() {
				$('#req_auth_confirm_popup').css('display', 'block');	
			}); 
	    		
        	// 첫 번째 AJAX 요청
        	$.ajax({
        	    url: "${path}/api/common/agency.do",
        	    type: "GET",
        	    success: function(response) {
        	        var agencies = JSON.parse(response);
        	        var selectElement = $("select[name='agent']");
        	        selectElement.append("<option value=''>전체 기관</option>");

        	        for (var i = 0; i < agencies.length; i++) {
        	            var agency = agencies[i];
        	            selectElement.append("<option value='" + agency.comnCdVal + "'>" + agency.comnCdValNm + "</option>");
        	        }

        	        // 첫 번째 요청이 완료되면 두 번째 AJAX 요청 실행
        	        // 두 번째 AJAX 요청 코드를 이곳에 넣어주세요.

        	        // 두 번째 AJAX 요청
        	        $.ajax({
        	            url: "${path}/api/common/data/roleList.do",
        	            type: "GET",
        	            success: function(response) {
        	                var roles = JSON.parse(response);
        	                var selectElement = $("select[name='role']");
        	                selectElement.append("<option value=''>전체 권한</option>");

        	                for (var i = 0; i < roles.length; i++) {
        	                    var role = roles[i];
        	                    selectElement.append("<option value='" + role.comnCdVal + "'>" + role.comnCdValNm + "</option>");
        	                }
        	            },
        	            error: function(xhr, status, error) {
        	                alert("두 번째 요청 실패: " + error);
        	            }
        	        });
        	    },
        	    error: function(xhr, status, error) {
        	        alert("첫 번째 요청 실패: " + error);
        	    }
        	});

        	selectReq();


            $("#role").change(function() {

            	console.log("dddddddddddddddddddddddddddddddddddddds");

            	selectReq();
            	console.log("1111");
                
            });
            

            $("#agent").change(function() {

            	console.log("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

            	selectReq();
            	console.log("1111");
                
            });
        	
        });
		    
    </script>
    

<div class="right_title">
					<h2>
					그룹 참여자 설정
					</h2>
						<div class="btn_close"><span><a href="javascript:fnPageLoad('${path}/page/answer.do','');"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				
					<div class="btn_close"><span><a href="/advisor_api_egov/page/home.do"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				</div>
				<div class="right_contents">
					<div class="notice_con_inner_auth">
						<div class="setting_keyword">
							<select name="" onchange="fnPageLoad(value,'');">
									<option id="" value="${path}/page/authority.do" selected>선택</option>
									<option id="" value="${path}/page/authority_group.do">그룹권한</option>
									<option id="" value="${path}/page/authority_setting.do" >그룹 참여자 설정</option>
							</select>
								
						</div>	
						<div class="group_content">
							<div class="group_head">
								<select name="agent" id="agent">
								</select> 
								<select name="role" id="role">
								</select>
								
							</div>
							<div class="group_setting_con">
								<table id="group_setting_con" border="0" >
								
									<caption></caption>
									<thead>
										  <tr style="position: sticky; top:0px; left: 0px;">
											<th>사용자명</th>
											<th>신청권한</th>
											<th>관리</th>
										  </tr>
									</thead>
									
									<tbody>
									</tbody>
								</table>	
								
							</div>
						</div>
						<!-- 삭제팝업창 -->
						<div id="author_alert_popup">
							<div class="author_alert_head">
								<h3>승인</h3>
							</div>
							<div class="author_alert_con">
								<p>사용자명(1234)의 리더로 승인하시겠습니까?</p>
							</div>
							<div class="author_alert_btn">
								<a href="" class="bnt_cancle">취소</a><a href="">승인</a>
							</div>
						</div>
					<!-- 삭제팝업창 -->
					
				</div>
		
					</div>
