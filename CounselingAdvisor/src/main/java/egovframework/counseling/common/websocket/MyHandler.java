package egovframework.counseling.common.websocket;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


//WebSocketHandler를 상속 받은 MyHandler 클래스 선언
public class MyHandler extends TextWebSocketHandler {
 // String(사용자 ID)를 Key로, WebSocketSession을 Value로 하는 Map 선언
 // ConcurrentHashMap은 스레드 안전한 Map입니다.
 private Map<String, WebSocketSession> sessions = new ConcurrentHashMap<>();

 // 웹소켓 연결이 맺어질 때 호출되는 메소드
 @Override
 public void afterConnectionEstablished(WebSocketSession session) {
     // 사용자 ID를 얻어옵니다.
     String userId = getUserId(session);
     // 사용자 ID와 WebSocketSession을 Map에 저장합니다.
     sessions.put(userId, session);
 }

 // 웹소켓 연결이 끊어질 때 호출되는 메소드
 @Override
 public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
     // 사용자 ID를 얻어옵니다.
     String userId = getUserId(session);
     // 사용자 ID와 연관된 WebSocketSession을 Map에서 제거합니다.
     sessions.remove(userId);
 }

 // 특정 사용자에게 메시지를 보내는 메소드
 public void sendMessageToUser(String userId, TextMessage message) {
     // 사용자 ID에 해당하는 WebSocketSession을 얻어옵니다.
     WebSocketSession session = sessions.get(userId);
     // WebSocketSession이 null이 아니고, 연결이 열려있는 경우에만 메시지를 전송합니다.
     if (session != null && session.isOpen()) {
         try {
			session.sendMessage(message);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     }
 }

 // 각 WebSocketSession에서 사용자 ID를 추출하는 방법은 실제 애플리케이션에 따라 달라집니다.
 // 예를 들어, 사용자 ID는 WebSocket handshake 요청의 일부인 HTTP 헤더 또는 쿠키에서 가져올 수 있습니다.
 private String getUserId(WebSocketSession session) {
	return "";
     // 여기에 사용자 ID를 얻는 로직을 작성합니다.
 }
}
