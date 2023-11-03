<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="org.apache.log4j.Logger" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ page import="com.ubintis.api.ApiUserService" %>
<%@ page import="com.ubintis.common.util.StrUtil" %>
<%@ page import="com.ubintis.common.util.AddressUtil" %>
<%@ page import="com.fasterxml.jackson.databind.JsonNode" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>

<%
// 맥락 파라미터 'userID' 값을 가져오기
String messageServerIp = getServletContext().getInitParameter("messageServerIp");
%>

<%
//http://localhost:8080/advisor_api_egov/api/auth/login.do

String user_id = (String) session.getAttribute("user_id");
%>

	<style>
	.highlight {
      color: yellow;
    }
	</style>
	<script>
	
		
	
		$(document).ready(function() {
            
            

            
		});
		
	</script>

				<div class="counsel">
					<!-- 검색 -->
						<div class="counsel_search">
	
								<select id ="menual_query_div">
										<option value="ADA001B001">전체</option>
										<option value="ADA001B002">AI</option>
										<option value="ADA001B003">KMS</option>
								</select>
								<input id="text_adv_menual_question" type="text" size="20" name="" value="" placeholder="검색어를 입력하세요.">
								<button id="btn_adv_menual_question">검색</button>								
						
						</div>
					<!-- 내용 -->
						<div class="counsel_con" style="height: calc(100% - 90px);">
								
									<div class="label_sticky">
												<div class="counsel_flag"><a href="#" class="btn_flag"><img src="<c:url value='/images/icons/btn_tag.png'/>" alt=""> </a></div>
												
												<div class="counsel_pagenation code-html">
										
				
														<div id="pagination_answer" class="tui-pagination"><span class="tui-page-btn tui-is-disabled tui-first"><span class="tui-ico-first">first</span></span><span class="tui-page-btn tui-is-disabled tui-prev"><span class="tui-ico-prev">prev</span></span><strong class="tui-page-btn tui-is-selected tui-first-child">1</strong><a href="#" class="tui-page-btn">2</a><a href="#" class="tui-page-btn">3</a><a href="#" class="tui-page-btn">4</a><a href="#" class="tui-page-btn">5</a><a href="#" class="tui-page-btn">6</a><a href="#" class="tui-page-btn">7</a><a href="#" class="tui-page-btn">8</a><a href="#" class="tui-page-btn">9</a><a href="#" class="tui-page-btn">10</a><a href="#" class="tui-page-btn tui-next-is-ellip tui-last-child"><span class="tui-ico-ellip">...</span></a><a href="#" class="tui-page-btn tui-next"><span class="tui-ico-next">next</span></a><a href="#" class="tui-page-btn tui-last"><span class="tui-ico-last">last</span></a></div>	
													
												</div>
									</div>	
									<script>
										$( document ).ready(function() {
										  $('.btn_flag').on('click', function() {
											 $('.counsel_pagenation').toggleClass('open');
											 return false;
										  });
										});
									</script>
									
								<div id="no_answer" style="height: 100%; display: flex; justify-content: center; align-items: center; background-color:#f3f5f9;">
								    <p> 답변을 준비중 입니다. </p>
								</div>

							<div id="counsel_con_inner" class="counsel_con_inner" style="display:none;">
							

									
							<section id= "answer_content">
								
								
		
								
								
								
								</section>
							
								
							
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
									<p><img src="<c:url value='/images/icons/noimg.gif'/>" alt=""></p>
									<p>별도로 표기 테이블 문서도 있음 
										별도 퍼플리싱 필요함
										테이블 색상은 가이드 문서 참고 작성해주세요</p>
									<p><img src="<c:url value='/images/icons/noimg.gif'/>" alt=""></p>
								</div>

							</div>
						<!-- 팝업창 내용 -->
					<!-- cousel -->
				</div>




<script type="text/javascript">


</script>

</body>
</html>