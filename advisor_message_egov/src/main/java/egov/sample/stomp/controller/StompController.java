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
import java.util.Timer;
import java.util.TimerTask;
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
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Controller
@Slf4j
public class StompController {

    private Connection connection;
    private Channel channel;
    private Timer timer;


	@Resource(name = "rabbitmqProperties")
	Properties rabbitmqProperties;
	

	@Autowired
	private SimpMessageSendingOperations messagingTemplate;
	
	@MessageMapping("/recvScript")
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
        channel.queueDeclare("SCRIPT", false, false, false, null);
        System.out.println(" [*] Waiting for messages. To exit press CTRL+C");

        // 메시지를 저장할 변수

        Consumer consumer = new DefaultConsumer(channel) {
            @Override
            public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {
                String message = new String(body, "UTF-8");
                System.out.println("received : " + message);
                
                // 메세지를 받았으므로 타이머 재설정
                resetTimer(connection);
                
                messagingTemplate.convertAndSend("/topic/script", message);
                
            }
        };
        channel.basicConsume("SCRIPT", true, consumer);
        
        startTimer(connection);
	}
	@MessageMapping("/recvAnswer")
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
        channel.queueDeclare("ANSWER", false, false, false, null);
        System.out.println(" [*] Waiting for messages. To exit press CTRL+C_a");

        // 메시지를 저장할 변수
        Consumer consumer = new DefaultConsumer(channel) {
            @Override
            public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {
                String message = new String(body, "UTF-8");
                System.out.println("received_a : " + message);

                // 메세지를 받았으므로 타이머 재설정
                resetTimer(connection);
                
                messagingTemplate.convertAndSend("/topic/answer", message);
                
            }
        };
        channel.basicConsume("ANSWER", true, consumer);
        
        startTimer(connection);
	}
	
	
	@MessageMapping("/sendScript")
	public void sendToRabbit(UserMessage userMessage) throws Exception {
		log.debug("===>>> sendToAll >>" + userMessage);

        ConnectionFactory factory = new ConnectionFactory();

        factory.setHost(rabbitmqProperties.getProperty("Globals.rabbitmq.Host"));
        factory.setPort(Integer.parseInt(rabbitmqProperties.getProperty("Globals.rabbitmq.Port").toString()));
        factory.setUsername(rabbitmqProperties.getProperty("Globals.rabbitmq.Username"));
        factory.setPassword(rabbitmqProperties.getProperty("Globals.rabbitmq.Password"));

        try (Connection connection = factory.newConnection(); Channel channel = connection.createChannel()) {
                channel.queueDeclare("SCRIPT", false, false, false, null);
                channel.basicPublish("", "SCRIPT", null, userMessage.getMsg().getBytes());
                System.out.println(" [x] Set '" + userMessage.getMsg() + "'");
                Thread.sleep(5);
        } catch (TimeoutException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
		
	}
	
	@MessageMapping("/sendAnswer")
	public void sendToRabbit_a(UserMessage userMessage) throws Exception {
		log.debug("===>>> sendToAll >>" + userMessage);

        ConnectionFactory factory = new ConnectionFactory();

        factory.setHost(rabbitmqProperties.getProperty("Globals.rabbitmq.Host"));
        factory.setPort(Integer.parseInt(rabbitmqProperties.getProperty("Globals.rabbitmq.Port").toString()));
        factory.setUsername(rabbitmqProperties.getProperty("Globals.rabbitmq.Username"));
        factory.setPassword(rabbitmqProperties.getProperty("Globals.rabbitmq.Password"));

        try (Connection connection = factory.newConnection(); Channel channel = connection.createChannel()) {
                channel.queueDeclare("ANSWER", false, false, false, null);
                channel.basicPublish("", "ANSWER", null, userMessage.getMsg().getBytes());
                System.out.println(" [x] Set '" + userMessage.getMsg() + "'");
                Thread.sleep(5);
        } catch (TimeoutException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
		
	}

    // 60분 타이머 시작
    private void startTimer(Connection connection) {
        timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                // 연결 종료 로직을 여기에 추가
            	closeConnection(connection);
            }
        }, 3600 * 60 * 1000); // 메세지가 없는 시간이 하루가 넘어가면 커넥션 종료
    }

    // 타이머 재설정
    private void resetTimer(Connection connection) {
        if (timer != null) {
            timer.cancel();
            timer = null;
        }
        startTimer(connection);
    }
	  
	  private void closeConnection(Connection connection) {
	    try {
	      connection.close();
	    } catch (IOException e) {
	      e.printStackTrace();
	    } 
	  }
	
	
	
	
}
