<%-- <%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/dist/tailwind.min.css'/>"/>
    <script src="<c:url value='/js/egovframework/fontawesome.min.js'/>"></script>
    <script src="<c:url value='/js/egovframework/jquery.min.js'/>"></script>
    <script>
		    function login() {
		        $.ajax({
		            url: "${pageContext.request.contextPath}/login.do",
		            type: 'post',
		            data: {
		                id: $("#userId").val(),     // 사용자가 입력한 아이디
		                password: $("#userPassword").val()  // 사용자가 입력한 비밀번호
		            },
		            success: function(response) {
		            	alert("11");
		                // handle response
		            },
		            error: function(error) {
		                // handle error
		            }
		        });
		    }
	</script>
</head>
<body>
	<div class="flex items-center justify-center h-screen bg-gray-200">
	    <div class="p-6 m-4 w-92 p-12">
	        <div class="mb-4">
	            <h1 class="flex justify-center text-2xl">AI 상담 어드바이저</h1>
	            <div class="flex mt-4">
	                <label class="w-12"><img src="<c:url value='/images/icons/그림8.png'/>" class="mr-2"></label>
	                <input id="userId" class="w-92 h-10 px-3 text-base placeholder-gray-600 placeholder-opacity-50 border rounded-lg focus:shadow-outline" type="text" placeholder="아이디"/>
	            </div>
	            <div class="flex mt-4">
	                <label class="w-12"><img src="<c:url value='/images/icons/그림8.png'/>" class="mr-2"></label>
	                <input id="userPassword" class="w-92 h-10 px-3 text-base placeholder-gray-600 placeholder-opacity-50 border rounded-lg focus:shadow-outline" type="password" placeholder="비밀번호"/>
	            </div>
	        </div>
	        <div class="flex justify-center mt-4">
	            <button class="w-72 h-12 px-3 text-white bg-indigo-500 rounded-lg hover:bg-indigo-600" onclick="login()">로그인</button>
	        </div>
	    </div>
	</div>
</body>
</html>
 --%>