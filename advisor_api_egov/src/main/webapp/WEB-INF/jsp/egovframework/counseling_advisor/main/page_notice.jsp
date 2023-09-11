
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
    <script src="<c:url value='/js/egovframework/pagenation.js' />"></script>	
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/remixicon.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/style.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/pagenation.css'/>"/>
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

    	
    	
    	
        $.ajax({
            type: "GET", // HTTP 요청 방식 (GET, POST 등)
            url: "${path}/api/notices.do",
            /* dataType: "json", // 응답 데이터 형식 (JSON, XML 등) */
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
			        '<span class="notice_date">'+item.amntDttm+'</span>' +
			        '</a>' +
			        '<div class="manager">' +
			        '<span>'+item.rgsrId+'</span>' +
			        '<a href="#" id="btn_del" data-noti_sqno='+item.notiSqno+' class="btn_del_con">삭제</a>' +
			        '</div>';
			        
			        ulElement.appendChild(liElement);
		            
			    }
                
                
            },
            error: function(request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });

    </script>
</head>

<body>
<div id="wrap">
	<!-- header -->
	<header id="header">
		<div id="logo">
			<a href="${path}/page/home.do">
				<img src="<c:url value='/images/icons/mark.png'/>" alt="">
				<span>농촌진흥청<i><img src="<c:url value='/images/icons/logo_arr.png'/>" alt=""></i></span>
			</a>
		</div>
		<nav id="gnb">
			<a href="${path}/page/summary.do" class="active"><i><img src="<c:url value='/images/icons/gnb_01.png'/>" alt=""></i> 요약</a>
			<a href="${path}/page/history.do"><i><img src="<c:url value='/images/icons/gnb_02.png'/>" alt=""></i> 이력</a>
			<a href="${path}/page/setting.do"><i><img src="<c:url value='/images/icons/gnb_03.png'/>" alt=""></i> 설정</a>
			<a href="${path}/page/monitoring.do"><i><img src="<c:url value='/images/icons/gnb_04.png'/>" alt=""></i> 모니터링</a>
			<a href="${path}/page/authority.do"><i><img src="<c:url value='/images/icons/gnb_05.png'/>" alt=""></i> 권한</a>
			<a href="#"><i><img src="<c:url value='/images/icons/gnb_06.png'/>" alt=""></i> 로그아웃</a>
		</nav>
		<div id="lnb">
			<a href="${path}/page/notice.do" class="call"></a>
			<a href="${path}/page/news.do" class="push"><span>99+</span></a>
		</div>
	</header>
	<!-- header -->
	<!-- body -->
	<div id="container">
		<!-- chating -->
			<section id="charting">
				<div class="chating_inner">
				<!-- chating head -->
				<div class="chating_head">
					<div class="chating_head_inner">
						<h2>010-1234-5678 고객님과 전화상담이 시작되었습니다.</h2>
						<p>시작일시 (2023.12.31.23.59.59)</p>
					</div>
				</div>
				<!-- chating head -->
				<!-- chating con -->
				<div class="chating_con">
					
					<div class="chating_contents">
						<ul>
							<li class="guest">
								<em>010-1234-5678 (2023.12.31.23.59.59)</em>
								<div class="chattok"><p>안녕하세요</p></div>
							</li>
							<li class="guest">
								<em>010-1234-5678 (2023.12.31.23.59.59)</em>
								<div class="chattok"><p>군대 지원하려고 합니다.<br />어떻게 할까요?</p></div>
							</li>
							<li class="counseller">
								<em>상담사 이아름(1234) (2023.12.31.23.59.59)</em>
								<div class="chattok"><p>네  안녕하세요.<br />
									병역의무 이행<br />
									•현역병 육군,해병대(18개월) 해군(20개월) 공군(21개월)<br />
									•상근예비역(18개월)<br />
									•전환복무 의무경찰(18개월) 의무소방/해양경찰(20개월)<br />
									•사회복무요원(21개월)<br />
									•산업기능요원 현역 입영대상사(34개월)<br />
									우선 모집일정,지원자격 등<br />
									확인 후 지원특기.......	</p>
								</div>
							</li>
							<li class="guest">
								<em>010-1234-5678 (2023.12.31.23.59.59)</em>
								<div class="chattok">
									<span class="dengerus"><i>!</i>위험키워드 #탈영</span>
								<p>안녕하세요</p></div>
							</li>
						</ul>
					
					
					</div>
					</div>
					<!-- chating con -->
					<!-- chating bottom -->
					<div class="chating_bottom">
						<div class="chating_head_inner">
							<h2>010-1234-5678 고객님과 전화상담이 종료되었습니다.</h2>
							<p>종료일시 (2023.12.31.23.59.59)</p>
						</div>
					</div>
					<!-- chating bottom -->
				
				</div>
			</section>
		<!-- chating -->
		<!-- right -->
			<section id="sub_right_con">
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
					
					<div class="code-html pagenation">
						<div id="pagination1" class="tui-pagination"><a href="#" class="tui-page-btn tui-first"><span class="tui-ico-first">first</span></a><a href="#" class="tui-page-btn tui-prev"><span class="tui-ico-prev">prev</span></a><a href="#" class="tui-page-btn tui-first-child">1</a><strong class="tui-page-btn tui-is-selected">2</strong><a href="#" class="tui-page-btn">3</a><a href="#" class="tui-page-btn">4</a><a href="#" class="tui-page-btn">5</a><a href="#" class="tui-page-btn tui-next-is-ellip tui-last-child"><span class="tui-ico-ellip">...</span></a><a href="#" class="tui-page-btn tui-next"><span class="tui-ico-next">next</span></a><a href="#" class="tui-page-btn tui-last"><span class="tui-ico-last">last</span></a></div>	
					</div>
				</div>
			</section>
		<!-- right -->
	</div>
	<!-- body -->
</div>
<script class="code-js">
	var pagination1 = new tui.Pagination('pagination1', {
		totalItems: 500,
		itemsPerPage: 10,
		visiblePages: 5
	});
</script>
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
</body>
</html>











<%-- 
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagination Example</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 라이브러리 추가 -->
    <style>
        /* CSS 스타일링 */
        .pagenation {
            margin: 20px 0;
        }

        .pagenation ul {
            list-style: none;
            padding: 0;
            display: flex;
        }

        .pagenation li {
            margin-right: 10px;
        }

        .pagenation li a {
            text-decoration: none;
            padding: 5px 10px;
            background-color: #f0f0f0;
            color: #333;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .pagenation li.on a {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
    <!-- 페이징 컨테이너 -->
    <div class="pagenation" data-page_number="1" data-page_size="10" data-total_pages="14">
        <ul class="pagenation_content" id="pagination"></ul>
    </div>

    <script>
        var paginationContainer = document.querySelector(".pagenation");
        var pageNumber = parseInt(paginationContainer.getAttribute("data-page_number"));
        var pageSize = parseInt(paginationContainer.getAttribute("data-page_size"));
        var totalPageCount = parseInt(paginationContainer.getAttribute("data-total_pages"));

        function fetchDataAndUpdatePage() {
            $.ajax({
                type: "GET",
                url: "${path}/api/notices.do",
                data: {
                    pageNumber: pageNumber,
                    pageSize: pageSize
                },
                success: function(response) {
                    // Here, handle the response. For example, if you receive new page data, render it.

                    // Update the total page count if it's provided in the response
                    if (response.totalPages) {
                        totalPageCount = response.totalPages;
                    }

                    // After handling the data, re-render the pagination
                    renderPagination();
                },
                error: function(request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }

        function renderPagination() {
            var paginationContent = document.getElementById("pagination");
            paginationContent.innerHTML = ""; 
            
            // Previous button
            var prevButton = document.createElement("li");
            prevButton.innerHTML = `<a href="#">이전</a>`;
            prevButton.addEventListener("click", function () {
                if (pageNumber > 1) {
                    pageNumber--;
                    fetchDataAndUpdatePage();
                }
            });
            paginationContent.appendChild(prevButton);

            // Page numbers
            var pageStart = Math.max(1, Math.ceil(pageNumber / 5) * 5 - 4);
            var pageEnd = Math.min(totalPageCount, pageStart + 4);
            for (var i = pageStart; i <= pageEnd; i++) {
                var pageItem = document.createElement("li");
                pageItem.className = i === pageNumber ? "on" : "";
                pageItem.innerHTML = `<a href="#">${i}</a>`;
                pageItem.addEventListener("click", function () {
                    pageNumber = parseInt(this.textContent);
                    fetchDataAndUpdatePage();
                });
                paginationContent.appendChild(pageItem);
            }

            // Next button
            var nextButton = document.createElement("li");
            nextButton.innerHTML = `<a href="#">다음</a>`;
            nextButton.addEventListener("click", function () {
                if (pageNumber < totalPageCount) {
                    pageNumber++;
                    fetchDataAndUpdatePage();
                }
            });
            paginationContent.appendChild(nextButton);
        }

        // Initially fetch data and render pagination
        fetchDataAndUpdatePage();
    </script>
</body>
</html>
 --%>