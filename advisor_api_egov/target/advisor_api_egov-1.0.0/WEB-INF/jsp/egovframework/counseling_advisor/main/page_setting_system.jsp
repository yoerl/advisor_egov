<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

     <style>

      .skill-box:not(:first-child) {
        margin-top: 50px;
      }
      .skill-name {
        color: #878787;
        font-size: 18px;
        font-weight: 400;
        margin-bottom: 10px;
      }
      .progress-bar {
        position: relative;
        width: 100%;
        height: 10px;
        border-radius: 10px;

        background: #333333;
      }
      .progress {
        height: 10px;
        border-radius: 10px;
        background: #293e89;
        transform: scaleX(0);
        transform-origin: left;
        animation: scaleUp 0.1s cubic-bezier(0.1, 0.1, 0.1, 0.1) forwards;
      }
      .progress-rate {
        position: absolute;
        background: #222;
        color: #96764f;
        font-size: 14px;
        bottom: calc(100% + 10px);
        transform: translateX(-50%);
        padding: 2px 8px;
      }
      .progress-rate::after {
        content: "";
        position: absolute;
        top: 100%;
        left: 50%;
        transform: translate(-50%, -50%) rotate(45deg);
        background: #293e89;
        width: 5px;
        height: 5px;
      }
      @keyframes scaleUp {
        0% {
          transform: scaleX(0);
        }
        100% {
          transform: scaleX(1);
        }
      }
    </style>

<div class="right_title">
					<h2>설정</h2>
					
				</div>
				<div class="right_contents">
					<div class="notice_con_inner">
						<div class="setting_keyword">
							<select name="" onchange="fnPageLoad(value,'');">
									<option id="" value="${path}/page/setting.do">선택</option>
									<option id="" value="${path}/page/setting_system.do" selected>시스템 정보</option>
									<option id="" value="${path}/page/setting_font.do">폰트종류</option>
									<option id="" value="${path}/page/setting_size.do">폰트크기</option>
									<option id="" value="${path}/page/setting_my.do">마이페이지</option>
							</select>
						</div>	
						<div class="setting_content">
						      		<div class="skill-box">
				        				<h4 class="skill-name">CPU</h4>
				
								        <div class="progress-bar">
								          <div class="progress" style="width: 95%"></div>
								          <div class="progress-rate" style="left: 95%">95%</div>
								        </div>
								      </div>
								
								      <div class="skill-box">
								        <h4 class="skill-name">메모리</h4>
								
								        <div class="progress-bar">
								          <div class="progress" style="width: 95%"></div>
								          <div class="progress-rate" style="left: 95%">95%</div>
								        </div>
								      </div>
								
								      <div class="skill-box">
								        <h4 class="skill-name">디스크</h4>
								
								        <div class="progress-bar">
								          <div class="progress" style="width: 95%"></div>
								          <div class="progress-rate" style="left: 95%">95%</div>
								        </div>
								      </div>
								      
						
						</div>
					</div>
</div>

<script>

$.ajax({
    type: "GET",
    url: "${path}/api/performance.do",
    success: function(jsonString) {
        var jsonArray = JSON.parse(jsonString);

    },
    error: function(request, status, error) {
        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    }
});


</script>