//package egovframework.counseling.common.websocket.config;
//
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.socket.config.annotation.EnableWebSocket;
//import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
//import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
//
//import egovframework.counseling.common.websocket.ws.ChatWebSocketHandler;
//import egovframework.counseling.common.websocket.ws.EchoHandler;
//
//
//@Configuration
//@EnableWebSocket
//public class WsConfig implements WebSocketConfigurer {
//	
//
//	@Override
//	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//		registry.addHandler(echoHandler(), "/echo-ws");
//		registry.addHandler(chatHandler(), "/chat-ws");
//	}
//
//	@Bean
//	public EchoHandler echoHandler() {
//		return new EchoHandler();
//	}
//	
//	@Bean
//	public ChatWebSocketHandler chatHandler() {
//		return new ChatWebSocketHandler();
//	}
//
//}
