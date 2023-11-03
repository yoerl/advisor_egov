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
					<div class="btn_close"><span><a href="javascript:fnPageLoad('${path}/page/answer.do','');"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a><span></div>
				
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
								          <div id="cpu_progress" class="progress" style=""></div>
								          <div id="cpu_progress-rate" class="progress-rate" style="left: 95%"></div>
								        </div>
								      </div>
								
								      <div class="skill-box">
								        <h4 class="skill-name">메모리</h4>
								
								        <div class="progress-bar">
								          <div id="memory_progress" class="progress" style=""></div>
								          <div id="memory_progress-rate" class="progress-rate" style="left: 95%"></div>
								        </div>
								      </div>
								
								      <div class="skill-box">
								        <h4 class="skill-name">디스크</h4>
								
								        <div class="progress-bar">
								          <div id="disk_progress" class="progress" style=""></div>
								          <div id="disk_progress-rate" class="progress-rate" style="left: 95%"></div>
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
        console.log("AJAX 성공: " + jsonArray.cpu);
        console.log("AJAX 성공: " + jsonArray.memory);
        console.log("AJAX 성공: " + jsonArray.disk);

        $("#cpu_progress").css("width", jsonArray.cpu+"%");
        $("#cpu_progress-rate").html(jsonArray.cpu + "%");
        

        $("#memory_progress").css("width", jsonArray.memory+"%");
        $("#memory_progress-rate").html(jsonArray.memory + "%");

        $("#disk_progress").css("width", jsonArray.disk+"%");
        $("#disk_progress-rate").html(jsonArray.disk + "%");
      
        
        
    },
    error: function(request, status, error) {
        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    }
});


</script>