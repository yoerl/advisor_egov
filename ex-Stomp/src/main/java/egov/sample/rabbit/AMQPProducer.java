package egov.sample.rabbit;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.TimeoutException;

import javax.annotation.Resource;

import com.rabbitmq.client.BuiltinExchangeType;
 
public class AMQPProducer{


	@Resource(name = "rabbitmqProperties")
	Properties rabbitmqProperties;
	
    // QUEUE_NAME은 메시지가 전송될 큐의 이름을 상수로 선언합니다.
    private final static String QUEUE_NAME = "hello";

    // 메인 메서드에서 메시지 전송 과정이 이루어집니다.
    public void directProducer(String message) {
        // ConnectionFactory 인스턴스를 생성하여 RabbitMQ 서버와의 연결을 설정합니다.
        ConnectionFactory factory = new ConnectionFactory();
        

//        factory.setHost(rabbitmqProperties.getProperty("Globals.rabbitmq.Host"));
//        factory.setPort(Integer.parseInt(rabbitmqProperties.getProperty("Globals.rabbitmq.Port").toString()));
//        factory.setUsername(rabbitmqProperties.getProperty("Globals.rabbitmq.Username"));
//        factory.setPassword(rabbitmqProperties.getProperty("Globals.rabbitmq.Password"));
//        

        factory.setHost("localhost");
        factory.setPort(5672);
        factory.setUsername("guest");
        factory.setPassword("guest");
        
        // try-with-resources 구문을 사용하여 Connection과 Channel을 자동으로 닫도록 합니다.
        try (Connection connection = factory.newConnection(); Channel channel = connection.createChannel()) {
            // 100,000번 메시지를 전송하는 반복문입니다.
//            for (int i = 0; i <= 10; i++) {
                // QUEUE_NAME이라는 이름의 큐를 선언하고, 그 큐에 메시지를 전송합니다.
                channel.queueDeclare(QUEUE_NAME, false, false, false, null);
                // "Hello World!"라는 메시지와 무작위 숫자를 함께 전송합니다.
//                String message = "Hello World!" + (int) (Math.random() * 100);
                channel.basicPublish("", QUEUE_NAME, null, message.getBytes());
                // 메시지를 전송했다는 것을 콘솔에 출력합니다.
                System.out.println(" [x] Set '" + message + "'");
                // 10 밀리초 동안 쓰레드를 일시 중단합니다. 이는 메시지 전송 사이의 간격을 제공합니다.
                Thread.sleep(10);
//            }
        } catch (TimeoutException e) {
            // 연결 시간 초과 예외를 처리합니다.
            e.printStackTrace();
        } catch (IOException e) {
            // 입출력 예외를 처리합니다.
            e.printStackTrace();
        } catch (InterruptedException e) {
            // 쓰레드가 중단되었을 때의 예외를 처리합니다.
            e.printStackTrace();
        }
    }
    
//
//    String host = "localhost";
//    int port = 5672;
//    String username = "guest";
//    String password = "guest";
// 
//    String exchangeName = "amq.direct";
//    String routingKey = "routingkey";
//    
//    public void directProducer(String message) throws IOException, TimeoutException 
//    {
//        ConnectionFactory factory = new ConnectionFactory();
//        factory.setHost(host);
//        factory.setPort(port);
//        factory.setUsername(username);
//        factory.setPassword(password);
//        
//        Connection connection = factory.newConnection();
//        Channel channel = connection.createChannel();
//        
//        message = "Hello World";
//        byte[] body = message.getBytes();
// 
//        // Publish
//        channel.basicPublish(exchangeName, routingKey, null, body);
//        
//        channel.close();
//        connection.close();
//    }
}