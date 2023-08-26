package egov.sample.setup;

import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.rabbitmq.client.ConnectionFactory;

import egov.sample.stomp.controller.StompController;

public class MyServletContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        // 웹 어플리케이션 시작 시에 실행되는 코드
        System.out.println("웹 어플리케이션 시작됨");
        
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        // 웹 어플리케이션 종료 시에 실행되는 코드
        System.out.println("웹 어플리케이션 종료됨");
        
        // 여기에 리소스 정리 작업을 추가할 수 있습니다.
    }
}
