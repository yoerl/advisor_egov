package egovframework.counseling.permission.web;



import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import egovframework.counseling.notice.service.impl.NoticeVO;
import egovframework.counseling.permission.service.PermissionService;
import egovframework.counseling.permission.service.impl.PermissionReqDTO;
import egovframework.counseling.permission.service.impl.PermissionReqVO;
import egovframework.counseling.permission.service.impl.UserAthrReqVO;
import egovframework.counseling.user.service.UserService;
import egovframework.counseling.user.service.impl.UserInfoVO;

@RestController
public class PermissionController {

	private static final Logger logger = LogManager.getLogger(PermissionController.class);

	/** EgovSampleService */
	@Resource(name = "permissionService")
	private PermissionService permissionService;
	


	
	@PostMapping(value = "/api/{use_id}/permission/req/{role}.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> selectUser(@RequestBody String input_json,@PathVariable String use_id,@PathVariable String role) throws Exception{


		logger.info("권한 요청"+input_json.toString());
		
       ObjectMapper objectMapper = new ObjectMapper();
       

       PermissionReqVO permissionReqVO = new PermissionReqVO();
       
       
		
		PermissionReqDTO permissionReqDTO = new PermissionReqDTO();
		try {
			 permissionReqDTO = objectMapper.readValue(input_json.toString(), PermissionReqDTO.class);

		} catch (IOException e) {
		    logger.error("JSON을 객체로 변환하는 중에 예외 발생: " + e.getMessage());
		    // 예외 처리 로직 추가
		}

		permissionReqVO.setUserId(use_id);
		permissionReqVO.setAthrTypeCd("role");
		permissionReqVO.setAthrCd(role);
		permissionReqVO.setUserNm(permissionReqDTO.getUserNm());
		
        
		boolean result = permissionService.reqPermission(permissionReqVO);
		

        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
	}
	
	

	@GetMapping(value = "/api/permission/req.do")
	public ResponseEntity<String> selectPermissionReq() throws Exception{


		PermissionReqVO permissionReqVO = new PermissionReqVO();
		
		
		List<PermissionReqVO> result  = permissionService.selectPermissionRequest(permissionReqVO);
		
		
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(result);
		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
	
	
	
	@PutMapping(value = "/api/permission/{use_id}.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> insertPermissionUserRole(@PathVariable String use_id,@RequestBody String input_json) throws Exception{

		logger.info("/api/permission/{use_id}.do");
		logger.info("/api/permission/{use_id}.do input_json" + input_json.toString());
		
		UserInfoVO userInfoVO = new UserInfoVO();
	       ObjectMapper objectMapper = new ObjectMapper();
		try {
			userInfoVO = objectMapper.readValue(input_json.toString(), UserInfoVO.class);

		} catch (IOException e) {
		    logger.error("JSON을 객체로 변환하는 중에 예외 발생: " + e.getMessage());
		    // 예외 처리 로직 추가
		}
		

	

		logger.info("4444  --  "+userInfoVO.toString());
		
		PermissionReqVO permissionReqVO = new PermissionReqVO();

		permissionReqVO.setUserId(userInfoVO.getUserId());
		permissionReqVO.setAthrCd(userInfoVO.getUserDivCd());
		
		boolean result  = permissionService.updatePermission(permissionReqVO);
	

	    return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
	}
	
	
}
 