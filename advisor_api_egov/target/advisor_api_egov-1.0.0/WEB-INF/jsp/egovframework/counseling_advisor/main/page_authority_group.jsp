<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String intt_cd = (String) session.getAttribute("intt_cd");

%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    
    <script>
    
        $(document).ready(  function() {


            $("#agentSelect").change(function() {
                var selectedAgent = $(this).val(); // 선택된 값 가져오기

                // 선택된 에이전트에 따라 다른 로직 수행 가능
                // 적절한 URL 및 AJAX 요청 등을 여기에 추가

               
                $.ajax({
                    url: "${path}/api/common/data/roleList.do",
                    type: "GET",
                    success: function(response) {


                        var targetElement = document.querySelector(".group_menu ul");
                        targetElement.innerHTML = ''; // ul 요소 초기화

                        var jsonArray = JSON.parse(response);
                        for (var i = 0; i < jsonArray.length; i++) {
                        	
                            var item = jsonArray[i];
                            

                            
                            var element = document.createElement("li");
                            
                            element.innerHTML += '<a href="#" onclick="setActive(' + i + ')" data-comn_cd_val="'+item.comnCdVal+'" >' + item.comnCdValNm + '</a>';

                            targetElement.appendChild(element);
                        }
                        
                        

                        $("#group_menu").css("display", "block");
                      	// 첫 번째 AJAX 요청
                        $.ajax({
            	            url: "${path}/api/common/data/roleList.do",
            	            type: "GET",
            	            success: function(response) {
            	                var roles = JSON.parse(response);
            	                var selectElement = $("select[name='role']");
            	                selectElement.append("<option value=''>그룹을 선택하세요.</option>");

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
                        // 요청 실패 시 실행할 코드
                        alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
                    }
                });
                
                
            });
            
            
            // AJAX DELETE 요청 보내기
            $.ajax({
            	///api/common/data.do
                //url: "${path}/api/common/agency.do", // 엔드포인트 URL
                
                url: "${path}/api/common/agency.do", // 엔드포인트 URL
                type: "GET", // HTTP DELTETE 메서드 사용
                success: function(response) {
                	
                    // JSON 데이터 파싱
                    var agencies = JSON.parse(response);

                    // select 요소 선택
                    var selectElement = $("select[name='agent']");

                    // 기관명 옵션 추가
                    selectElement.append("<option value=''>기관 선택</option>");
                    // 각 기관 옵션 추가
                    for (var i = 0; i < agencies.length; i++) {
                        var agency = agencies[i];
                        selectElement.append("<option value='" + agency.comnCdVal + "'>" + agency.comnCdValNm + "</option>");
                        
                        
                    }
                    

                    $("#agentSelect option[value='<%=intt_cd%>']").prop("selected", true);
                    $("#agentSelect").trigger("change");

                    //selectUsers($("select[name='agent']").val());
                    


                },
                error: function(xhr, status, error) {
                    // 요청 실패 시 실행할 코드
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
	    		
	    		
            
            

    		
            
            
	    		
	
        });
		    
    </script>
    <script>
function setActive(index) {
  // 모든 메뉴 항목의 "active" 클래스 제거
  const menuItems = document.querySelectorAll(".group_menu ul li a");
  menuItems.forEach(item => {
    item.classList.remove("active");
  });

  // 클릭한 메뉴 항목에 "active" 클래스 추가
  menuItems[index].classList.add("active");
  
  const comnCdVal = menuItems[index].getAttribute("data-comn_cd_val");
 
  
  $("#role_code").val(comnCdVal);
  
  
  $("#group_autho_list").css("display", "block");
  

  $.ajax({
      type: "GET",
      //url: "${path}/api/menu/power",
      //url: "${path}/api/common/data/1390000/menu_teacher.do",
      url: "${path}/api/auth/menu/1390000/"+comnCdVal+".do",
      
     
      success: function(jsonString) {

			var jsonArray = JSON.parse(jsonString);
			
	


	          for (let i = 0; i < jsonArray.length; i++) {

	            
	            $("input[name='"+jsonArray[i].comnCdVal+"'][value='"+jsonArray[i].useYn+"']").prop("checked", true);
	            
	            //comnCdVal
	            //useYn
	            
	            // 여기에서 원하는 작업을 수행할 수 있습니다.
	          }
          
          
          
        //  AJAX 성공: 
//[{"comnCd":"menu_systemAdmin","comnCdNm":"시스템 관리자 메뉴권한","comnCdVal":"history","comnCdValNm":"이력","hgrnComnCd":"1390000","useYn":"Y","amndId":"ADMIN","amntDttm":"Sep 11, 2023, 4:15:56 PM","rgsrId":"ADMIN","rgsnDttm":"Sep 11, 2023, 4:15:56 PM"},{"comnCd":"menu_systemAdmin","comnCdNm":"시스템 관리자 메뉴권한","comnCdVal":"memo","comnCdValNm":"메뉴","hgrnComnCd":"1390000","useYn":"Y","amndId":"ADMIN","amntDttm":"Sep 11, 2023, 4:15:56 PM","rgsrId":"ADMIN","rgsnDttm":"Sep 11, 2023, 4:15:56 PM"},{"comnCd":"menu_systemAdmin","comnCdNm":"시스템 관리자 메뉴권한","comnCdVal":"monitering","comnCdValNm":"모니터링","hgrnComnCd":"1390000","useYn":"Y","amndId":"ADMIN","amntDttm":"Sep 11, 2023, 4:15:56 PM","rgsrId":"ADMIN","rgsnDttm":"Sep 11, 2023, 4:15:56 PM"},{"comnCd":"menu_systemAdmin","comnCdNm":"시스템 관리자 메뉴권한","comnCdVal":"notice","comnCdValNm":"공지사항","hgrnComnCd":"1390000","useYn":"Y","amndId":"ADMIN","amntDttm":"Sep 11, 2023, 4:15:56 PM","rgsrId":"ADMIN","rgsnDttm":"Sep 11, 2023, 4:15:56 PM"},{"comnCd":"menu_systemAdmin","comnCdNm":"시스템 관리자 메뉴권한","comnCdVal":"permission","comnCdValNm":"권한","hgrnComnCd":"1390000","useYn":"Y","amndId":"ADMIN","amntDttm":"Sep 11, 2023, 4:15:56 PM","rgsrId":"ADMIN","rgsnDttm":"Sep 11, 2023, 4:15:56 PM"},{"comnCd":"menu_systemAdmin","comnCdNm":"시스템 관리자 메뉴권한","comnCdVal":"setting","comnCdValNm":"설정","hgrnComnCd":"1390000","useYn":"Y","amndId":"ADMIN","amntDttm":"Sep 11, 2023, 4:15:56 PM","rgsrId":"ADMIN","rgsnDttm":"Sep 11, 2023, 4:15:56 PM"}]


          

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
						</a>권한설정
					</h2>
					
					<div class="btn_close"><span><a href="/advisor_api_egov/page/home.do"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				</div>
				<div class="right_contents">
					<div class="notice_con_inner" style="height:100%;">
						<div class="setting_keyword">

								
							<select name="" onchange="fnPageLoad(value,'');">
									<option id="" value="${path}/page/authority.do" selected>선택</option>
									<option id="" value="${path}/page/authority_group.do">그룹권한</option>
									<option id="" value="${path}/page/authority_setting.do" >그룹 참여자 설정</option>
							</select>
								
						</div>	
						<div class="group_content">
							<div class="group_head">
									<select name="agent" id="agentSelect"> <!-- id 속성 추가 -->
									    <!-- 옵션 추가할 수 있음 -->
									</select>
							</div>
							<div class="group_authority_con">
							<div class="group_menu"  id="group_menu" style="display:none">
							  <ul> 
							  </ul>
							</div>
								 <div class="group_autho_list"  id="group_autho_list" style="display:none">
								 
								 	<table border="0" >
									<caption></caption>
									  <tr>
										<th></th>
									  </tr>
									  <tr>
										<td rowspan="6" class="border_none p30">메뉴권한</td>
										<td  class="border_none w30">메모</td>
										<td  class="border_none w20"><span class="radios"><input type="radio"  name = "memo"  value="N" id="memo_y"> <label for="memo_y">미사용</label></span></td>
										<td  class="border_none w20"><span class="radios"><input type="radio"  name = "memo" value="Y" id="memo_n"> <label for="memo_n">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">이력</td>
										<td class="w20"><span class="radios"><input type="radio" name = "history" value="N" id="history_y"> <label for="history_y">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio" name = "history" value="Y" id="history_n"> <label for="history_n">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">설정</td>
										<td class="w20"><span class="radios"><input type="radio"  name = "setting" value="N" id="setting_y"> <label for="setting_y">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "setting" value="Y" id="setting_n"> <label for="setting_n">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">모니터링</td>
										<td class="w20"><span class="radios"><input type="radio"  name = "monitering" value="N" id="monitering_y"> <label for="monitering_y">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "monitering" value="Y" id="monitering_n"> <label for="monitering_n">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">권한설정</td>
										<td class="w20"><span class="radios"><input type="radio"  name = "permission" value="N" id="permission_y"> <label for="permission_y">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "permission" value="Y" id="permission_n"> <label for="permission_n">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">공지사항</td>
										<td class="w20"><span class="radios"><input type="radio"  name = "notice" value="N" id="notice_y"> <label for="notice_y">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "notice" value="Y" id="notice_n"> <label for="notice_n">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">공동지식<br>보기권한</td>
										<td class="w30" style="padding-left: 0;">


										</td>
										<td class="w20"><span class="radios"><input type="radio"  name = "know" value="N" id="know_y"> <label for="know_y">미사용</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "know" value="Y" id="know_n"> <label for="know_n">사용</label></span></td>
									  </tr>
									  <tr>
										<td class="w30">시스템 점검</td>
										<td class="w30"></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "systemcheck" id="font_rd15" checked> <label for="font_rd15">미정검중</label></span></td>
										<td class="w20"><span class="radios"><input type="radio"  name = "systemcheck" id="font_rd16"> <label for="font_rd16">정검중</label></span></td>
									  </tr>
									</table>
								 
								 
								 						
								</div> 
							</div>
						</div>
						<input type="hidden" id="role_code" value = "" />
							<div id="btn_setting" class="setting_btn">
								<a href="#">저장</a>
							</div>

				</div>
				</div>
<script type="text/javascript">
	$("#btn_setting").on("click", function () {
	    
	 // 모든 라디오 버튼을 선택합니다.
	    var radioButtons = document.querySelectorAll('input[type="radio"]');

	    // 체크된 라디오 버튼의 값을 저장할 객체를 생성합니다.
	    var checkedRadioValues = {};

	    // 라디오 버튼을 반복하며 값을 가져옵니다.
	    radioButtons.forEach(function(radioButton) {
	        var name = radioButton.getAttribute('name');
	        var value = radioButton.value;

	        // 라디오 버튼이 체크되었을 때만 해당 값을 저장합니다.
	        if (radioButton.checked) {
	            checkedRadioValues[name] = value;
	        }
	    });

	    // 서버로 전송할 데이터를 객체 형태로 생성합니다.
	    var requestData = {
	        memo: checkedRadioValues.memo,
	        history: checkedRadioValues.history,
	        setting: checkedRadioValues.setting,
	        monitering: checkedRadioValues.monitering,
	        permission: checkedRadioValues.permission,
	        notice: checkedRadioValues.notice,
	        know: checkedRadioValues.know,
	        // 나머지 라디오 버튼의 값을 필요에 따라 추가합니다.
	        insttcode: '1390000',
	        rolecode: $("#role_code").val(),
	    };


        

        $.ajax({
            url: "${path}/api/auth/menu.do",  // 서버의 API 엔드포인트 URL
            type: "PUT",              // HTTP 메서드 (POST, GET 등)
            async: false,                // 동기적 요청 활성화
            data: JSON.stringify(requestData), // JSON 데이터 문자열로 변환
            contentType: "application/json", // 요청 본문의 데이터 타입 설정
            success: function(response) {
                // 요청 성공 시 실행할 코드
               	if(response=="true")
               	{
               		$("#group_auth_popup").css("display", "block");
               	 	//window.location.href = "${path}/page/notice.do";
               	 	//fnPageLoad('${path}/page/notice.do','');
               	}
               	else
               	{
               		alert("저장 실패 하였습니다");
               	}
               	
               	
            },
            error: function(xhr, status, error) {
                // 요청 실패 시 실행할 코드
                console.error("AJAX 오류: " + error);
            }
        });
	    
	    
	    
	    
	    
	    
	    
	});
</script>


</body>
</html>