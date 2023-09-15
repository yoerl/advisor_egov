<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>농촌진흥청</title>
<meta name="description" content="">
<meta name="keywords" content="">
    <script src="<c:url value='/js/egovframework/jquery-latest.js' />"></script>	
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    
    
</head>

<body>
<div id="wrap">
<!-- 레이어팝업창 -->
<div id="counsel_history_popup" style="display:block;">
	<div class="history_detail_popup">
	<div class="history_pop_header" id="header">

		<div id="logo">
			<a href="${path}/page/home.do">
				<img src="<c:url value='/images/icons/mark.png'/>" alt="">
				<span>농촌진흥청<i><img src="<c:url value='/images/icons/logo_arr.png'/>" alt=""></i></span>
			</a>
		</div>
	
					</div>
		<!-- body -->
	<div class="detail_pop_container">
		<!-- 기관명 -->
			<div class="organ_name">
				<h2>기관명 또는 그룹명</h2>
				<p class="organ_date">2023.01.01 12:12:12</p>
				<div class="manager"><span>상담사</span><span>1234</span></div>
			</div>
		<!-- 기관명 -->
		<!-- chating -->
						<section id="charting">
				<div class="chating_inner">
				
				<div id="no_calling" style="height: 100%; display: flex; justify-content: center; align-items: center;">
				    <p> 현재 통화 상태가 아닙니다. </p>
				</div>
				
				<!-- chating head -->
				<div id="chating_head" class="chating_head" style="display:none;">
<!-- 					<div class="chating_head_inner">
						<h2>010-1234-5678 고객님과 전화상담이 시작되었습니다.</h2>
						<p>시작일시 (2023.12.31.23.59.59)</p>
					</div> -->
				</div>
				<!-- chating head -->
				<!-- chating con -->
				<div class="chating_con">
					
					<div class="chating_contents">
						<ul>
						</ul>
					</div>
					</div>
					<!-- chating con -->
					<!-- chating bottom -->
					<div class="chating_bottom" style="display:none;">
					</div>
					<!-- chating bottom -->
					<!-- chating popup -->
					<div class="chating_popup" style="display:none;">
						<form name="" method="" action="">
						<h3><i><img src="<c:url value='/images/icons/smile_icon.png'/>" alt=""></i>상담요약</h3>
						<div class="chating_popup_con">
							<textarea placeholder="군입대에 대한 상담"></textarea>
							<button>저장</button>
						</div>
						</form>
					</div>
					<!-- chating popup -->
				
				</div>
			</section>
		<!-- chating -->
		<!-- right -->
			<section id="right_con">
				<div class="counsel">
					<!-- 검색 -->
						<div class="counsel_search">
							<form name="" method="" action="">
	
								<select name="">
									<option id="" value="">전체</option>
										<option id="" value="">AI</option>
										<option id="" value="">KMS</option>
									</select>
								<input type="text" size="20" maxlength="30" name="" value="" placeholder="검색어를 입력하세요.">
								<button>검색</button>								
							</form>
						</div>
					<!-- 내용 -->
						<div class="counsel_con">
							<div class="counsel_con_inner">
								<div class="counsel_flag"><a href="#" class="btn_flag"><img src="../images/icons/btn_tag.png" alt=""></a></div>
								<div class="counsel_pagenation">
									<ul>
										<li class="page_prev"><a href="#"><img src="../images/icons/page_prev.png" alt=""></a></li>
										<li class="on"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
										<li><a href="#">7</a></li>
										<li><a href="#">8</a></li>
										<li><a href="#">9</a></li>
										<li><a href="#">10</a></li>
										<li class="page_next"><a href="#"><img src="../images/icons/page_next.png" alt=""></a></li>
									</ul>
								</div>
								<script>
									$( document ).ready(function() {
									  $('.btn_flag').on('click', function() {
										 $('.counsel_pagenation').toggleClass('open');
										 return false;
									  });
									});
								</script>
								<!-- 1 -->
								<div class="counsel_date"><p>2023.12.31.23.59.59</p></div>

								<div class="counsel_contents">
									<ul>
										<li class="counsel_kind">
											<h3>분류</h3>
											<div>
												<span><i>대</i>입영</span><span><i>중</i>입소</span><span><i>소</i>자원입대</span>
											</div>
										</li>
										<li class="ai_part">
											<h3>AI</h3>
											<div>
												<div class="ai_part_txt">
													<div class="chang_open_con">
														<span><button class="chang_open_btn trigger"></button></span>
														<span><input type="checkbox" id="check1" name="check1"><label for="check1"></label></span>														
													</div>
													<h4>군입대 지원하려고 합니다. 어떻게 해야 할까요?</h4>
													<p>병역의무 이행<br />•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월) <br />•상근예비역(18개월) <br />•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월) <br />•사회복무요원(21개월) <br />•산업기능요원 현역 입영대상사(34개월)</p>
												</div>
												<div class="counsel_more_btn"><a href="#">더보기<i><img src=<c:url value='/images/icons/arr_down.png'/> alt=""></i></a><div>
											</div>
										</li>
										<li class="kms_part">
											<h3>KMS</h3>
											<div>
												<div class="kms_part_txt">
													<ul>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 병역의무 이행과 이해능력....</p><span><input type="checkbox" id="check5" name="check5"><label for="check5"></label></span></div></li>
														<li><div class="kms_part_con"><p>병역판정검사</p><span><input type="checkbox" id="check2" name="check2"><label for="check2"></label></span></div></li>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력....</p><span><input type="checkbox" id="check3" name="check3"><label for="check3"></label></span></div></li>
														<li><div class="kms_part_con"><p>연령별 병역의무 이행과 이해능력 연령별 병역의무 이행과 이해능력....</p><span><input type="checkbox" id="check4" name="check4"><label for="check4"></label></span></div></li>
													</ul>
												</div>
												<div class="counsel_more_btn"><a href="#">더보기<i><img src=<c:url value='/images/icons/arr_down.png'/> alt=""></i></a><div>
											</div>
										</li>
									<ul>
								</div>
							<!-- 내용 -->
							<!-- 1 -->
							
							</div>
							
						</div>
						<!-- 팝업창 내용 -->
							<div class="counsel_popup">
								<div class="btn_popup_close"><a href="#"><img src="<c:url value='/images/icons/btn_close.gif'/>" alt=""></a></div>
								<h2>군입대 지원하려고 합니다. 어떻게 해야 할까요?</h2>
								<div class="counsel_poopup_con">
									<p>병역의무 이행<br />
										•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
										•상근예비역(18개월)<br />
										•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
										•사회복무요원(21개월)
										•산업기능요원 현역 입영대상사(34개월)<br />
										•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
										•상근예비역(18개월)<br />
										•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
										•사회복무요원(21개월)
										•산업기능요원 현역 입영대상사(34개월)<br />
										•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
										•상근예비역(18개월)<br />
										•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
										•사회복무요원(21개월)<br />
										•산업기능요원 현역 입영대상사(34개월)</p>
									<p><img src="../images/icons/noimg.gif" alt=""></p>
									<p>별도로 표기 테이블 문서도 있음 
										별도 퍼플리싱 필요함
										테이블 색상은 가이드 문서 참고 작성해주세요</p>
									<p><img src="../images/icons/noimg.gif" alt=""></p>
								</div>

							</div>
						<!-- 팝업창 내용 -->
						<script>
							$( document ).ready(function() {
							  $('.chang_open_btn').on('click', function() {
								 $('.counsel_popup').toggleClass('show');
								 return false;
							  });
							   $('.btn_popup_close a').on('click', function() {
								 $('.counsel_popup').removeClass('show');
								 return false;
							  });
							});
						</script>
					<!-- cousel -->
				</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
	</div>
</div>
</div>


<!-- 레이어팝업창 -->


<script> 
	$(document).ready(function(){ 
	$(".btn_view_history").click(function(){ 
	$("#counsel_history_popup").css("display", "block");
	}); 
	$("#counsel_dd > li > a").click(function(){ 
	$("#counsel_history_popup").css("display", "block");
	}); 
	$("#counsel_history_popup .btn_close").click(function(){ 
	$("#counsel_history_popup").css("display", "none"); 
	}); 
	}); 
</script>
</body>
</html>