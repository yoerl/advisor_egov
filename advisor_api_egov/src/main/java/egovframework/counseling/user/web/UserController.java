package egovframework.counseling.user.web;



import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import egovframework.counseling.user.service.UserService;
import egovframework.counseling.user.service.impl.UserInfoVO;

@RestController
public class UserController {

	private static final String CONTENT_TYPE_UTF8 = "text/plain; charset=UTF-8";

	private static final Logger logger = LogManager.getLogger(UserController.class);

	/** EgovSampleService */
	@Resource(name = "userService")
	private UserService userService;
	
	
	@GetMapping("/api/user/{userId}.do")
	public ResponseEntity<String> selectUser(@PathVariable String userId){
		
		
		
		UserInfoVO userInfoVO = new UserInfoVO();
		userInfoVO.setUserId(userId);


		List<UserInfoVO> result = null;
		try {
		result = userService.selectUser(userInfoVO);
		
		
	    } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
	        // 예외 처리 로직 작성
	    	logger.error("유저정보 가져오기 문제 : ", e);
	    	
	    }
    
		
			Gson gson = new Gson();
			String resultJson = gson.toJson(result);
			
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, CONTENT_TYPE_UTF8);
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
	
	@PutMapping(value = "/api/cons-stat.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> updateConsStat(@RequestBody String inputJson) throws JsonProcessingException{
		logger.debug("통화 상태 수정 시작");
		
        ObjectMapper objectMapper = new ObjectMapper();

        
        
        UserInfoVO userInfoVO = objectMapper.readValue(inputJson, UserInfoVO.class);
        
        
		boolean result = userService.updateConsStat(userInfoVO);
		
		logger.debug("통화 상태 수정 종료");
		
		
		HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, CONTENT_TYPE_UTF8);
	    return new ResponseEntity<>(String.valueOf(result), headers, HttpStatus.OK);
	}
	
	
	
	@GetMapping("/api/users.do")
	public ResponseEntity<String> selectUsers(@ModelAttribute("userInfoVO") UserInfoVO userInfoVO) {
		logger.info("유저정보 조회 받은 파라미터 {}", userInfoVO);

		String resultJson ="";
		try {
		
		List<UserInfoVO> result = userService.selectUsers(userInfoVO);
		

			Gson gson = new Gson();
			resultJson = gson.toJson(result);
			

			
	    } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
	        // 예외 처리 로직 작성
	    	logger.error("유저정보 가져오기 문제 : ", e);
	    	
	    }	

	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, CONTENT_TYPE_UTF8);
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	

}
 