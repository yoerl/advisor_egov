<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- right -->
	<div class="right_title">
		<h2>
			<a href="javascript:history.go(-1);">
				<img src="../images/icons/arrow-left.png" alt="">
			</a>설정</h2>
		<div class="btn_close">
			<a href="${path}/page/home.do">
				<span><img src="<c:url value='/images/icons/btn_close.gif'/>" alt = ""></span>
			</a>
		</div>
	</div>
	<div class="right_contents">
		<div class="notice_con_inner">
		<form name="" method="" action="">
			<div class="setting_keyword">
					<select name="" onchange="fnPageLoad(value,'');">
							<option id="" value="" selected>선택</option>
							<option id="" value="${path}/page/setting_system.do">시스템 정보</option>
							<option id="" value="${path}/page/setting_font.do">폰트종류</option>
							<option id="" value="${path}/page/setting_size.do">폰트크기</option>
							<option id="" value="${path}/page/setting_my.do">마이페이지</option>
					</select>
			</div>	
			<p class="no-massage">메뉴를 선택해 주세요.</p>
		</form>
		</div>
	</div>
<!-- right -->
