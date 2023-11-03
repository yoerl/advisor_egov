<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.ubintis.common.util.StrUtil" %>

<%
	String errorCode = StrUtil.NVL( request.getParameter( "errorCode" ) );
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title></title>

<script type="text/javascript">

</script>

</head>
<body>

<strong>Error Code [<%=errorCode%>]</strong>
<br/>
<p>
<%
	if( "EA0001".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 초기화 실패" );
	} else if( "EA0002".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 필수 파라미터 정보 없음" );
	} else if( "EA0003".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 서버와의 통신 오류" );
	} else if( "EA0004".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 서버와의 통신 오류(예외사항)" );
	} else if( "EA0005".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 인증서 로드 실패(RSA KEY)" );
	} else if( "EA0006".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) JSON 데이터 생성 오류" );
	} else if( "EA0007".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) JSON 데이터 파싱 오류" );
	} else if( "EA0008".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 암호화 키 교환 오류(데이터 서명 검증)" );
	} else if( "EA0009".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 암호화 키 교환 오류(데이터 서명 정보 생성)" );
	} else if( "EA0010".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 암호화 키 교환 오류(암호화 키 없음)" );
	} else if( "EA0011".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 데이터 암호화 오류" );
	} else if( "EA0012".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 데이터 복호화 오류" );
	} else if( "EA0013".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 서버에서 전달받은 데이터 오류(값 없음)" );
	} else if( "EA0014".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 서버에서 전달받은 데이터 오류(랜덤값 상이)" );
	} else if( "EA0015".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 암호화 키 교환 오류(ECC KEY)" );
	} else if( "EA0016".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 서버에서 전달받을 데이터 오류(HMAC 검증)" );
	} else if( "EA0017".equals( errorCode ) ) {
		out.println( "(SSO 에이전트) 서버에서 전달받을 데이터 오류(SPLIT DATA)" );
		
	} else if( "ES0002".equals( errorCode ) ) {
		out.println( "(SSO 서버) 서버 초기화 오류" );
	} else if( "ES0003".equals( errorCode ) ) {
		out.println( "(SSO 서버) 필수 파라미터 정보 없음" );
	} else if( "ES0004".equals( errorCode ) ) {
		out.println( "(SSO 서버) 연동시스템 정보 없음" );
	} else if( "ES0005".equals( errorCode ) ) {
		out.println( "(SSO 서버) 연동시스템 식별코드 정보 없음" );
	} else if( "ES0006".equals( errorCode ) ) {
		out.println( "(SSO 서버) ECC Key 생성 오류" );
	} else if( "ES0007".equals( errorCode ) ) {
		out.println( "(SSO 서버) 전자서명 데이터 생성 오류" );
	} else if( "ES0008".equals( errorCode ) ) {
		out.println( "(SSO 서버) 서버 공개키/개인키 정보 로드 오류" );
	} else if( "ES0009".equals( errorCode ) ) {
		out.println( "(SSO 서버) 전자서명 검증 오류" );
	} else if( "ES0010".equals( errorCode ) ) {
		out.println( "(SSO 서버) 연동시스템 키 생성 오류[Calculate Key]" );
	} else if( "ES0011".equals( errorCode ) ) {
		out.println( "(SSO 서버) 정상적이지 않은 요청 정보[Challenge]" );
	} else if( "ES0012".equals( errorCode ) ) {
		out.println( "(SSO 서버) 서버 ECC Key 정보 로드 오류" );
	} else if( "ES0013".equals( errorCode ) ) {
		out.println( "(SSO 서버) 데이터 암호화 오류" );
	} else if( "ES0014".equals( errorCode ) ) {
		out.println( "(SSO 서버) 데이터 복호화 오류" );
	} else if( "ES0015".equals( errorCode ) ) {
		out.println( "(SSO 서버) 사용자 정보 없음" );
	} else if( "ES0016".equals( errorCode ) ) {
		out.println( "(SSO 서버) JSON 데이터 생성 오류" );
	} else if( "ES0017".equals( errorCode ) ) {
		out.println( "(SSO 서버) 요청 정보 없음" );
	} else if( "ES0018".equals( errorCode ) ) {
		out.println( "(SSO 서버) JSON 데이터 파싱 오류" );
	} else if( "ES0019".equals( errorCode ) ) {
		out.println( "(SSO 서버) SSO 서버 시스템 오류" );
		
	} else if( "ES0021".equals( errorCode ) ) {
		out.println( "(SSO 서버) 올바르지 않은 인증 토큰 정보" );
	} else if( "ES0022".equals( errorCode ) ) {
		out.println( "(SSO 서버) 인증 토큰 전자서명 검증 오류" );
	} else if( "ES0023".equals( errorCode ) ) {
		out.println( "(SSO 서버) 올바르지 않은 인증 토큰 정보[ISS]" );
	} else if( "ES0024".equals( errorCode ) ) {
		out.println( "(SSO 서버) 올바르지 않은 인증 토큰 정보[SUB]" );
	} else if( "ES0025".equals( errorCode ) ) {
		out.println( "(SSO 서버) 올바르지 않은 인증 토큰 정보[IP]" );
	} else if( "ES0026".equals( errorCode ) ) {
		out.println( "(SSO 서버) 올바르지 않은 인증 토큰 정보[DATE]" );
		
	} else {
		out.println( "(SSO 에이전트) 시스템 오류" );
	}
%>
</p>
<br/>

<br/><br/>
<a href="main.jsp">Pass-Ni SSO Sample Page 로 이동</a>

</body>
</html>
