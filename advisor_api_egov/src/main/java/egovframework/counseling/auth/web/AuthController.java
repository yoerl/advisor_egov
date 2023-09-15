package egovframework.counseling.auth.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class AuthController {
	
	private static final Logger logger = LogManager.getLogger(AuthController.class);



	@GetMapping("/api/auth/login.do")
	public String moveLogin() throws Exception{
	    return "main/page_login";
	}
	
	@GetMapping("/api/auth/logout.do")
	public String moveLoOut(SessionStatus sessionStatus) throws Exception{

		System.out.println("로그아웃 처리1111");
        // 세션을 무효화하여 로그아웃 처리
        sessionStatus.setComplete();

		System.out.println("로그아웃 처리2222");

	    return "main/page_login";
	}
	
}
