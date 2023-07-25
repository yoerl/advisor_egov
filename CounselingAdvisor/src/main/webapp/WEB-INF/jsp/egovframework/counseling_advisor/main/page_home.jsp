<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    
    <style>
      /* 민원인 말풍선 */
      .balloon_complaint::after {
        content: "";
        position: absolute;
        top: 10px;
        left: -15px;
        border-top: 15px solid #E5E7EB;
        border-left: 15px solid transparent;
        border-right: 0px solid transparent;
        border-bottom: 0px solid transparent;
      }
      /* 상담원 말풍선 */
      .balloon_consultant::after {
        content: "";
        position: absolute;
        top: 10px;
        right: -15px;
        border-top: 15px solid #E5E7EB;
        border-left: 0px solid transparent;
        border-right: 15px solid transparent;
        border-bottom: 0px solid transparent;
      }
    </style>
</head>
<body>
<div class="flex row h-screen w-screen">
    <div class="w-48 bg-white ">
        <div class="flex flex-col">
            <div class="flex flex-row h-12 flex items-center justify-center">
                <img src="<c:url value='/images/icons/그림8.png'/>" class="w-4 h-4 mr-2">
                <span class="text-lg">국민권익위원회</span>
            </div>
            <div>
                <div class="flex items-center justify-center">
                    <img src="<c:url value='/images/icons/그림2.png'/>" class="w-24 h-24">
                </div>
            </div>
            <button class="w-40 h-12 mx-2 my-2 flex items-center justify-center bg-gray-200 rounded-md">
                <img src="<c:url value='/images/icons/그림2.png'/>" class="w-4 h-4 mr-2">
                <span class="text-lg text-black">메모</span>
            </button>
            <button class="w-40 h-12 mx-2 my-2 flex items-center justify-center bg-gray-200 rounded-md">
                <img src="<c:url value='/images/icons/그림3.png'/>" class="w-4 h-4 mr-2">
                <span class="text-lg text-black">이력</span>
            </button>
            <button class="w-40 h-12 mx-2 my-2 flex items-center justify-center bg-gray-200 rounded-md">
                <img src="<c:url value='/images/icons/그림4.png'/>" class="w-4 h-4 mr-2">
                <span class="text-lg text-black">공지사항</span>
            </button>
            <button class="w-40 h-12 mx-2 my-2 flex items-center justify-center bg-gray-200 rounded-md">
                <img src="<c:url value='/images/icons/그림5.png'/>" class="w-4 h-4 mr-2">
                <span class="text-lg text-black">사진</span>
            </button>
            <button class="w-40 h-12 mx-2 my-2 flex items-center justify-center bg-gray-200 rounded-md">
                <img src="<c:url value='/images/icons/그림6.png'/>" class="w-4 h-4 mr-2">
                <span class="text-lg text-black">설정</span>
            </button>
            <button class="w-40 h-12 mx-2 my-2 flex items-center justify-center bg-gray-200 rounded-md">
                <img src="<c:url value='/images/icons/그림7.png'/>" class="w-4 h-4 mr-2">
                <span class="text-lg text-black">모니터링</span>
            </button>
            <button class="w-40 h-12 mx-2 my-2 flex items-center justify-center bg-gray-200 rounded-md">
                <img src="<c:url value='/images/icons/그림8.png'/>" class="w-4 h-4 mr-2">
                <span class="text-lg text-black">권한설정</span>
            </button>
            <button class="w-40 h-12 mx-2 my-2 flex items-center justify-center bg-gray-200 rounded-md">
                <img src="<c:url value='/images/icons/그림9.png'/>" class="w-4 h-4 mr-2">
                <span class="text-lg text-black">로그아웃</span>
            </button>
        </div>
    </div>
    <section class="flex row w-full">
        <div class="w-1/2 h-full border border-purple-600 overflow-y-auto">
            <div class="relative m-12 w-100 h-24 bg-gray-200 rounded-lg balloon_complaint"></div>
            <div class="relative m-12 w-100 h-24 bg-gray-200 rounded-lg balloon_consultant"></div>
            <div class="relative m-12 w-100 h-24 bg-gray-200 rounded-lg balloon_complaint"></div>
            <div class="relative m-12 w-100 h-24 bg-gray-200 rounded-lg balloon_consultant"></div>
            <div class="relative m-12 w-100 h-24 bg-gray-200 rounded-lg balloon_complaint"></div>
            <div class="relative m-12 w-100 h-24 bg-gray-200 rounded-lg balloon_consultant"></div>
            <div class="relative m-12 w-100 h-24 bg-gray-200 rounded-lg balloon_complaint"></div>
            <div class="relative m-12 w-100 h-24 bg-gray-200 rounded-lg balloon_consultant"></div>
            <div class="relative m-12 w-100 h-24 bg-gray-200 rounded-lg balloon_complaint"></div>
            <div class="relative m-12 w-100 h-24 bg-gray-200 rounded-lg balloon_consultant"></div>
        </div>
    </section>
</div>
</body>
</html>
