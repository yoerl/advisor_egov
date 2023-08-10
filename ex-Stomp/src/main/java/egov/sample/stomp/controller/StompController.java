package egov.sample.stomp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import egov.sample.stomp.domain.UserMessage;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StompController {
	
	@Autowired
	private SimpMessageSendingOperations messagingTemplate;
	
	@MessageMapping("/initStomp")
	@SendTo("/topic/message")
	public String initStomp(String message) throws Exception {
		log.debug("===>>> /initStomp >>" + message);
		return message;
	}
	
	@MessageMapping("/testStomp")
//	@SendTo("/topic/message")
	public UserMessage sendToAll(UserMessage userMessage) throws Exception {
		log.debug("===>>> sendToAll >>" + userMessage);
		
		messagingTemplate.convertAndSend("/topic/" + userMessage.getRoomId(), userMessage.getMsg());
		
		return userMessage;
	}
	
}
