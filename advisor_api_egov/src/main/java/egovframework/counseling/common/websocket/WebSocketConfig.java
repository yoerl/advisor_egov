//package egovframework.counseling.common.websocket;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.socket.WebSocketHandler;
//import org.springframework.web.socket.config.annotation.EnableWebSocket;
//import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
//import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
//
////Configuration 어노테이션으로 이 클래스가 스프링의 설정 클래스임을 나타냅니다.
//@Configuration
////EnableWebSocket 어노테이션으로 스프링의 웹소켓 지원을 활성화합니다.
//@EnableWebSocket
////WebSocketConfigurer 인터페이스를 구현하여 웹소켓 핸들러를 등록하는 등의 웹소켓 관련 설정을 하는 클래스입니다.
//public class WebSocketConfig implements WebSocketConfigurer {
//
// // WebSocketConfigurer 인터페이스의 registerWebSocketHandlers 메소드를 오버라이드합니다.
// // 이 메소드에서 웹소켓 핸들러를 등록하며, 각 핸들러는 웹소켓 메시지를 처리하는 역할을 합니다.
// @Override
// public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//     // "/myHandler"라는 경로로 오는 웹소켓 연결을 myHandler() 빈을 이용하여 처리하도록 설정합니다.
//     registry.addHandler(myHandler(), "/ws");
////     ws://localhost:80/advisor_api_egov/ws
// }
//
//    // MyHandler를 빈으로 등록합니다.
//    // 이 빈은 "/myHandler" 경로로 오는 웹소켓 메시지를 처리합니다.
//    @Bean
//    WebSocketHandler myHandler() {
//    	System.out.println("11111111111111111111111111");
//        return new MyHandler();
//    }
//
//}
