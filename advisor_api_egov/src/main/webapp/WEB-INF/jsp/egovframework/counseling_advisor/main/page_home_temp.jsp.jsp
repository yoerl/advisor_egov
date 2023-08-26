<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/dist/tailwind.min.css'/>"/>
    <script src="<c:url value='/js/egovframework/fontawesome.min.js'/>"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.3/dist/tailwind.min.css" rel="stylesheet">

    <!-- 캐시를 사용하지 않도록 설정하는 메타 태그 -->
    <meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="0">

	<style>
	  button:hover p {
	    color: white;
	  }
	</style>
</head>
<body>
<div class="flex row h-screen w-screen">

    <section class="flex row w-full">
    
    
        <!-- 왼쪽 화면 -->
        <div class="flex flex-col w-1/2 h-220">
            <header class="flex justify-between">
                <span>로고</span>
                <section>
	                <span>버튼</span>
	                <span>버튼</span>
                </section>
            </header>
            <section class="h-full overflow-y-auto bg-gray-200">

                <!-- 첫 번째 말풍선 -->
                <div class="flex justify-start">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-start">010-5166-4177</div>
                        <div class="ml-2 p-4 bg-white rounded-3xl rounded-tl-none">
                            <p class="whitespace-pre">안녕하세요.</p>
                        </div>
                    </div>
                </div>

                <!-- 두 번째 말풍선 -->
                <div class="flex justify-start">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-start">010-5166-4177</div>
                        <div class="ml-2 p-4 bg-white rounded-3xl rounded-tl-none">
                            <p class="whitespace-pre">군입 자원하려고 합니다 어떻게 해야 할까요?</p>
                        </div>
                    </div>
                </div>

                <!-- 세 번째 말풍선 -->
                <div class="flex justify-end">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-end">상담사 / 배우열 / 119</div>
                        <div class="ml-2 p-4 bg-indigo-800 rounded-3xl rounded-tr-none">
                            <p class="whitespace-pre text-white">네 안녕하세요. 우선 모집일정, 지원자격을 확인후 지원특기</p>
                        </div>
                    </div>
                </div>

                <!-- 첫 번째 말풍선 -->
                <div class="flex justify-start">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-start">010-5166-4177</div>
                        <div class="ml-2 p-4 bg-white rounded-3xl rounded-tl-none">
                            <p class="whitespace-pre">안녕하세요.</p>
                        </div>
                    </div>
                </div>

                <!-- 두 번째 말풍선 -->
                <div class="flex justify-start ">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-start">010-5166-4177</div>
                        <div class="ml-2 p-4 bg-white rounded-3xl rounded-tl-none">
                            <p class="whitespace-pre">군입 자원하려고 합니다 어떻게 해야 할까요?</p>
                        </div>
                    </div>
                </div>

                <!-- 세 번째 말풍선 -->
                <div class="flex justify-end">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-end">상담사 / 배우열 / 119</div>
                        <div class="ml-2 p-4 bg-indigo-800 rounded-3xl rounded-tr-none">
                            <p class="whitespace-pre text-white">네 안녕하세요. 우선 모집일정, 지원자격을 확인후 지원특기</p>
                        </div>
                    </div>
                </div>

                <!-- 첫 번째 말풍선 -->
                <div class="flex justify-start">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-start">010-5166-4177</div>
                        <div class="ml-2 p-4 bg-white rounded-3xl rounded-tl-none">
                            <p class="whitespace-pre">안녕하세요.</p>
                        </div>
                    </div>
                </div>

                <!-- 두 번째 말풍선 -->
                <div class="flex justify-start">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-start">010-5166-4177</div>
                        <div class="ml-2 p-4 bg-white rounded-3xl rounded-tl-none">
                            <p class="whitespace-pre">군입 자원하려고 합니다 어떻게 해야 할까요?</p>
                        </div>
                    </div>
                </div>

                <!-- 세 번째 말풍선 -->
                <div class="flex justify-end">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-end">상담사 / 배우열 / 119</div>
                        <div class="ml-2 p-4 bg-indigo-800 rounded-3xl rounded-tr-none">
                            <p class="whitespace-pre text-white">네 안녕하세요. 우선 모집일정, 지원자격을 확인후 지원특기</p>
                        </div>
                    </div>
                </div>

                <!-- 첫 번째 말풍선 -->
                <div class="flex justify-start">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-start">010-5166-4177</div>
                        <div class="ml-2 p-4 bg-white rounded-3xl rounded-tl-none">
                            <p class="whitespace-pre">안녕하세요.</p>
                        </div>
                    </div>
                </div>

                <!-- 두 번째 말풍선 -->
                <div class="flex justify-start">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-start">010-5166-4177</div>
                        <div class="ml-2 p-4 bg-white rounded-3xl rounded-tl-none">
                            <p class="whitespace-pre">군입 자원하려고 합니다 어떻게 해야 할까요?</p>
                        </div>
                    </div>
                </div>

                <!-- 세 번째 말풍선 -->
                <div class="flex justify-end">
                    <div class="flex flex-col">
                        <div class="ml-2 pl-2 flex justify-end">상담사 / 배우열 / 119</div>
                        <div class="ml-2 p-4 bg-indigo-800 rounded-3xl rounded-tr-none">
                            <p class="whitespace-pre text-white">네 안녕하세요. 우선 모집일정, 지원자격을 확인후 지원특기</p>
                        </div>
                    </div>
                </div>

            </section>
        </div>
        
        
    <!-- 오른쪽 화면 -->      
	<div class="flex flex-col w-1/2 h-220">
	            <header class="flex justify-around">
					<button class="bg-gray-200 text-white rounded-lg py-2 px-4 hover:bg-blue-700">
					<div class="flex flex-col items-center justify-center">
					    <img src="images/icons/gear.svg"/>
						<p class="text-black">
					  		요약
					  	</p>
					</div>
					</button>
					<button class="bg-gray-200 text-white rounded-lg py-2 px-4 hover:bg-blue-700">
					<div class="flex flex-col items-center justify-center">
					    <img src="images/icons/gear.svg"/>
						<p class="text-black">
					  		이력
					  	</p>
					</div>
					</button>
					<button class="bg-gray-200 text-white rounded-lg py-2 px-4 hover:bg-blue-700">
						<div class="flex flex-col items-center justify-center">
						    <img src="images/icons/gear.svg"/>
							<p class="text-black">
						  		설정
						  	</p>
						</div>
					</button>
					<button class="bg-gray-200 text-white rounded-lg py-2 px-4 hover:bg-blue-700">
						<div class="flex flex-col items-center justify-center">
						    <img src="images/icons/gear.svg"/>
							<p class="text-black">
						  		모니터링
						</div>
					</button>
					<button class="bg-gray-200 text-white rounded-lg py-2 px-4 hover:bg-blue-700">
						<div class="flex flex-col items-center justify-center">
						    <img src="images/icons/gear.svg"/>
							<p class="text-black">
						  		권한
						</div>
					</button>
					<button class="bg-gray-200 text-white rounded-lg py-2 px-4 hover:bg-blue-700">
						<div class="flex flex-col items-center justify-center">
						    <img src="images/icons/gear.svg"/>
							<p class="text-black">
						  		로그아웃
						</div>
					</button>
	            </header>
					<div class="relative my-2">
					  <input type="text" class="border rounded-3xl p-2 pl-3 pr-10 w-full bg-gray-200" placeholder="검색어를 입력해 주세요.">
					  <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
					    <svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
					      <path d="M6 9a3 3 0 11-6 0 3 3 0 016 0zM8 9a5 5 0 0110 0 5 5 0 01-10 0z"/>
					    </svg>
					  </div>
					</div>
	            <section class="h-full overflow-y-auto bg-gray-200">
	            
						<div class="flex h-screen">
						  <!-- 왼쪽 사이드 메뉴 -->
						  <aside class="bg-gray-200 w-16 h-120 p-2 border border-blue-500 flex flex-col justify-between">
								<button class="bg-transparent w-8 h-8 flex">
							    	<img src="images/icons/label.svg" />
								</button>
								<div>
									<button class="bg-transparent hover:bg-blue-700 flex">
								    	<img src="images/icons/control_up.svg" class="w-8 h-8"/>
									</button>
								    <ul>
								      <li>
										    <button class="bg-blue-500 w-8 h-8 rounded-full text-white flex items-center justify-center">
											  <p>1</p>
											</button>
								      </li>
								      <li>
										    <button class="bg-blue-500 w-8 h-8 rounded-full text-white flex items-center justify-center">
											  <p>2</p>
											</button>
								      </li>
								      <li>
										    <button class="bg-blue-500 w-8 h-8 rounded-full text-white flex items-center justify-center">
											  <p>3</p>
											</button>
								      </li>
								      <li>
										    <button class="bg-blue-500 w-8 h-8 rounded-full text-white flex items-center justify-center">
											  <p>4</p>
											</button>
								      </li>
								    </ul>
									<button class="bg-transparent hover:bg-blue-700">
								    	<img src="images/icons/control_down.svg" class="w-8 h-8"/>
									</button>
								</div>
						  </aside>
						  <!-- 오른쪽 주 콘텐츠 영역 -->
						  <main class="flex-1 p-4">
						    <h1 class="text-2xl font-bold">제목</h1>
						    <h1 class="text-2xl font-bold">AI</h1>
						    <h1 class="text-2xl font-bold">KMS</h1>
						    <!-- 추가 콘텐츠 -->
						  </main>
						</div>
	
	            </section>
	        </div>
	    </section>
	
	</div>
</body>
</html>
