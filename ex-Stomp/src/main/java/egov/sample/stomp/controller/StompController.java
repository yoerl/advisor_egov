package egov.sample.stomp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import egov.sample.rabbit.AMQPProducer;
import egov.sample.stomp.domain.UserMessage;
import lombok.extern.slf4j.Slf4j;


import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.TimeoutException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Consumer;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;


@Controller
@Slf4j
public class StompController {
	

	@Resource(name = "rabbitmqProperties")
	Properties rabbitmqProperties;
	
	@Autowired
	private SimpMessageSendingOperations messagingTemplate;
	
//	@MessageMapping("/initStomp")
////	@SendTo("/topic/message")
//	public String initStomp(String message) throws Exception {
//		log.debug("===>>> /initStomp >>" + message);
//		return message;
//	}
//
//	@MessageMapping("/testStomp")
//	public void sendToAll(UserMessage userMessage) throws Exception {
//		AMQPProducer AMQPProducer = new AMQPProducer();
//		
//		log.debug("===>>> sendToAll >>" + userMessage);
//		AMQPProducer.directProducer(userMessage.getMsg());
////		messagingTemplate.convertAndSend("/topic/message", userMessage.getMsg());
//        
//		
//	}
	

	@MessageMapping("/recvRabbit")
	public void sendToAll2() throws Exception {
		ConnectionFactory factory = new ConnectionFactory();
        
        factory.setHost(rabbitmqProperties.getProperty("Globals.rabbitmq.Host"));
        factory.setPort(Integer.parseInt(rabbitmqProperties.getProperty("Globals.rabbitmq.Port").toString()));
        factory.setUsername(rabbitmqProperties.getProperty("Globals.rabbitmq.Username"));
        factory.setPassword(rabbitmqProperties.getProperty("Globals.rabbitmq.Password"));
        

        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();

        // Exchange 선언 (선택사항)
        // channel.exchangeDeclare(exchangeName, BuiltinExchangeType.DIRECT, true);

        // 지정된 이름의 큐를 선언합니다. 이 큐에서 메시지를 가져옵니다.
        channel.queueDeclare("hello", false, false, false, null);
        System.out.println(" [*] Waiting for messages. To exit press CTRL+C");

        // 메시지를 저장할 변수

        Consumer consumer = new DefaultConsumer(channel) {
            @Override
            public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {
                String message = new String(body, "UTF-8");
                System.out.println("received : " + message);
                
                messagingTemplate.convertAndSend("/topic/message", message);
                
            }
        };
        channel.basicConsume("hello", true, consumer);
        
		
	}
	@MessageMapping("/recvRabbit_a")
	public void sendToAll2_a() throws Exception {
		ConnectionFactory factory = new ConnectionFactory();
        
        factory.setHost(rabbitmqProperties.getProperty("Globals.rabbitmq.Host"));
        factory.setPort(Integer.parseInt(rabbitmqProperties.getProperty("Globals.rabbitmq.Port").toString()));
        factory.setUsername(rabbitmqProperties.getProperty("Globals.rabbitmq.Username"));
        factory.setPassword(rabbitmqProperties.getProperty("Globals.rabbitmq.Password"));
        

        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();

        // Exchange 선언 (선택사항)
        // channel.exchangeDeclare(exchangeName, BuiltinExchangeType.DIRECT, true);

        // 지정된 이름의 큐를 선언합니다. 이 큐에서 메시지를 가져옵니다.
        channel.queueDeclare("hello_a", false, false, false, null);
        System.out.println(" [*] Waiting for messages. To exit press CTRL+C_a");

        // 메시지를 저장할 변수

        Consumer consumer = new DefaultConsumer(channel) {
            @Override
            public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {
                String message = new String(body, "UTF-8");
                System.out.println("received_a : " + message);
                
                messagingTemplate.convertAndSend("/topic/message_a", message);
                
            }
        };
        channel.basicConsume("hello_a", true, consumer);
        
		
	}

	@MessageMapping("/sendRabbit")
	public void sendToRabbit(UserMessage userMessage) throws Exception {
		log.debug("===>>> sendToAll >>" + userMessage);

        ConnectionFactory factory = new ConnectionFactory();

        factory.setHost(rabbitmqProperties.getProperty("Globals.rabbitmq.Host"));
        factory.setPort(Integer.parseInt(rabbitmqProperties.getProperty("Globals.rabbitmq.Port").toString()));
        factory.setUsername(rabbitmqProperties.getProperty("Globals.rabbitmq.Username"));
        factory.setPassword(rabbitmqProperties.getProperty("Globals.rabbitmq.Password"));

        try (Connection connection = factory.newConnection(); Channel channel = connection.createChannel()) {
                channel.queueDeclare("hello", false, false, false, null);
                channel.basicPublish("", "hello", null, userMessage.getMsg().getBytes());
                System.out.println(" [x] Set '" + userMessage.getMsg() + "'");
                Thread.sleep(10);
        } catch (TimeoutException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
		
	}
	
	@MessageMapping("/sendRabbit_a")
	public void sendToRabbit_a(UserMessage userMessage) throws Exception {
		log.debug("===>>> sendToAll >>" + userMessage);

        ConnectionFactory factory = new ConnectionFactory();

        factory.setHost(rabbitmqProperties.getProperty("Globals.rabbitmq.Host"));
        factory.setPort(Integer.parseInt(rabbitmqProperties.getProperty("Globals.rabbitmq.Port").toString()));
        factory.setUsername(rabbitmqProperties.getProperty("Globals.rabbitmq.Username"));
        factory.setPassword(rabbitmqProperties.getProperty("Globals.rabbitmq.Password"));

        try (Connection connection = factory.newConnection(); Channel channel = connection.createChannel()) {
                channel.queueDeclare("hello_a", false, false, false, null);
                channel.basicPublish("", "hello_a", null, userMessage.getMsg().getBytes());
                System.out.println(" [x] Set '" + userMessage.getMsg() + "'");
                Thread.sleep(10);
        } catch (TimeoutException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
		
	}
	
}
