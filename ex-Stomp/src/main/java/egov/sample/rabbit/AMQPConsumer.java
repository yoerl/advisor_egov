package egov.sample.rabbit;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.core.MessageSendingOperations;
import org.springframework.messaging.simp.SimpMessageSendingOperations;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Consumer;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;
public class AMQPConsumer {

    private final static String host = "localhost";
    int port = 5672;
    private final static String username = "guest";
    private final static String password = "guest";

    private final static String exchangeName = "amq.direct";
    private final static String queueName = "hello";
    String routingKey = "routingkey";

    public static String directConsumer() throws IOException, TimeoutException {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost(host);
        factory.setPort(5672);
        factory.setUsername(username);
        factory.setPassword(password);

        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();

        // Exchange 선언 (선택사항)
        // channel.exchangeDeclare(exchangeName, BuiltinExchangeType.DIRECT, true);

        // 지정된 이름의 큐를 선언합니다. 이 큐에서 메시지를 가져옵니다.
        channel.queueDeclare(queueName, false, false, false, null);
        System.out.println(" [*] Waiting for messages. To exit press CTRL+C");

        // 메시지를 저장할 변수
        final StringBuilder receivedMessage = new StringBuilder();

        Consumer consumer = new DefaultConsumer(channel) {
            @Override
            public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {
                String message = new String(body, "UTF-8");
                System.out.println("received : " + message);
                receivedMessage.append(message); // 메시지 저장
            }
        };

        channel.basicConsume(queueName, true, consumer);

        // 이 예제에서는 단일 메시지를 수신하고 연결을 종료합니다. 실제 시나리오에서는 적절한 조건을 설정해야 할 수 있습니다.
        while(receivedMessage.length() == 0) {
            // 대기
        }

        connection.close();
        return receivedMessage.toString(); // 받은 메시지 반환
    }
}
