package egov.sample.rabbit;

import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.TimeoutException;

import javax.annotation.Resource;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Consumer;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;

public class AMQPConsumer {

    @Resource(name = "rabbitmqProperties")
    Properties rabbitmqProperties;

    private final static String exchangeName = "amq.direct";
    private final static String queueName = "hello";
    String routingKey = "routingkey";

    public String directConsumer() throws IOException, TimeoutException {
        try (Connection connection = createConnection(); Channel channel = connection.createChannel()) {
            channel.queueDeclare(queueName, false, false, false, null);
            System.out.println(" [*] Waiting for messages. To exit press CTRL+C");

            final StringBuilder receivedMessage = new StringBuilder();

            Consumer consumer = new DefaultConsumer(channel) {
                @Override
                public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {
                    String message = new String(body, "UTF-8");
                    System.out.println("received : " + message);
                    receivedMessage.append(message);
                }
            };

            channel.basicConsume(queueName, true, consumer);

            while (receivedMessage.length() == 0) {
                // 대기
            }

            return receivedMessage.toString();
        }
    }

    private Connection createConnection() throws IOException, TimeoutException {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost(rabbitmqProperties.getProperty("Globals.rabbitmq.Host"));
        factory.setPort(Integer.parseInt(rabbitmqProperties.getProperty("Globals.rabbitmq.Port").toString()));
        factory.setUsername(rabbitmqProperties.getProperty("Globals.rabbitmq.Username"));
        factory.setPassword(rabbitmqProperties.getProperty("Globals.rabbitmq.Password"));

        return factory.newConnection();
    }
}
