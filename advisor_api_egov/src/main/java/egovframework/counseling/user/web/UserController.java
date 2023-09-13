package egovframework.counseling.user.web;



import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import egovframework.counseling.user.service.UserService;
import egovframework.counseling.user.service.impl.UserInfoVO;

@RestController
public class UserController {

	private static final Logger logger = LogManager.getLogger(UserController.class);

	/** EgovSampleService */
	@Resource(name = "userService")
	private UserService userService;
	
	
	@GetMapping("/api/user/{use_id}.do")
	public ResponseEntity<String> selectUser(@PathVariable String use_id) throws Exception{
		logger.info("행정기관11");
		
		
		UserInfoVO userInfoVO = new UserInfoVO();
		userInfoVO.setUserId(use_id);
		logger.info("행정기관11"+use_id.toString());
		List<UserInfoVO> result = userService.selectUser(userInfoVO);
		logger.info("행정기관2"+result.toString());
			Gson gson = new Gson();
			String resultJson = gson.toJson(result);
			
			

	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
	
	@GetMapping("/api/users.do")
	public ResponseEntity<String> selectUsers() throws Exception{
		logger.info("행정기관11");
		
		
		UserInfoVO userInfoVO = new UserInfoVO();
		List<UserInfoVO> result = userService.selectUsers(userInfoVO);
		
		
			Gson gson = new Gson();
			String resultJson = gson.toJson(result);
			
			

	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
}
 