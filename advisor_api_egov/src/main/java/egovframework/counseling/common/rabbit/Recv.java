//package egovframework.counseling.common.rabbit;
//
//// RabbitMQ를 사용하기 위한 클래스를 import 합니다.
//import com.rabbitmq.client.Channel;
//import com.rabbitmq.client.Connection;
//import com.rabbitmq.client.ConnectionFactory;
//import com.rabbitmq.client.DeliverCallback;
//
//public class Recv {
//
//    // RabbitMQ에서 메시지를 가져올 대기열의 이름을 설정합니다.
//    private final static String QUEUE_NAME = "hello";
//
//    public static void message(String[] argv) throws Exception {
//        // ConnectionFactory는 RabbitMQ 서버에 대한 연결을 설정하는 데 사용됩니다.
//        ConnectionFactory factory = new ConnectionFactory();
//        // RabbitMQ 서버의 위치(여기서는 localhost)를 설정합니다.
//        factory.setHost("localhost");
//        // RabbitMQ 서버의 포트를 설정합니다. 기본 포트는 5672입니다.
//        factory.setPort(5672);
//        // RabbitMQ 서버에 접근하기 위한 사용자 이름을 설정합니다.
//        factory.setUsername("guest");
//        // RabbitMQ 서버에 접근하기 위한 비밀번호를 설정합니다.
//        factory.setPassword("guest");
//        // 설정된 정보를 바탕으로 RabbitMQ 서버에 연결합니다.
//        Connection connection = factory.newConnection();
//        // 연결을 통해 채널을 생성합니다. 채널은 메시지를 전송하는 데 사용됩니다.
//        Channel channel = connection.createChannel();
//
//        // 지정된 이름의 큐를 선언합니다. 이 큐에서 메시지를 가져옵니다.
//        channel.queueDeclare(QUEUE_NAME, false, false, false, null);
//        System.out.println(" [*] Waiting for messages. To exit press CTRL+C");
//
//        // DeliverCallback은 메시지가 도착할 때 호출되는 콜백입니다.
//        DeliverCallback deliverCallback = (consumerTag, delivery) -> {
//            // 메시지 본문을 가져와서 UTF-8 문자열로 변환합니다.
//            String message = new String(delivery.getBody(), "UTF-8");
//            System.out.println(" [x] Received '" + message + "'");
//        };
//        // 지정된 큐에서 메시지를 소비하는 소비자를 등록합니다. 메시지가 도착하면 위의 콜백이 호출됩니다.
//        channel.basicConsume(QUEUE_NAME, true, deliverCallback, consumerTag -> { });
//    }
//}
