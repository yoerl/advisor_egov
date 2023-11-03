package egovframework.counseling.permission.web;



import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import egovframework.counseling.user.service.impl.UserInfoVO;

@RestController
public class PermissionController {

	private static final Logger logger = LogManager.getLogger(PermissionController.class);

	/** EgovSampleService */
	@Resource(name = "permissionService")
	private PermissionService permissionService;
	


	
	@PostMapping(value = "/api/{userId}/permission/req/{role}.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> selectUser(@RequestBody String inputJson,@PathVariable String userId,@PathVariable String role) {


		logger.debug("권aaaa요청 " + inputJson.toString());
		
       ObjectMapper objectMapper = new ObjectMapper();
       

       PermissionReqVO permissionReqVO = new PermissionReqVO();
       
       
		
		PermissionReqDTO permissionReqDTO = new PermissionReqDTO();
		

		try {
		    permissionReqDTO = objectMapper.readValue(inputJson, PermissionReqDTO.class);

			logger.debug("권wwww청 permissionReqDTO" + permissionReqDTO.toString());
		} catch (IOException e) {
		    logger.error("권한 요청 e: {}", e.toString());
		    // 예외 처리 로직 추가
		}

		
		permissionReqVO.setUserId(userId);
		permissionReqVO.setAthrTypeCd("role");
		permissionReqVO.setAthrCd(role);
		permissionReqVO.setUserNm(permissionReqDTO.getUserNm());
		permissionReqVO.setInttCd(permissionReqDTO.getInttCd());
		
        
		boolean result = permissionService.reqPermission(permissionReqVO);
		

        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
	}
	
	

	@GetMapping(value = "/api/permission/req.do")
	public ResponseEntity<String> selectPermissionReq(HttpServletRequest request, Model model, @ModelAttribute("PermissionReqVO") PermissionReqVO permissionReqVO){
		
		
		logger.error("/api/permission/req.do : " + permissionReqVO.toString());
		List<PermissionReqVO> result  = permissionService.selectPermissionRequest(permissionReqVO);
		
		
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(result);
		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
	
	
	
	@PutMapping(value = "/api/permission/{userId}.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> insertPermissionUserRole(@PathVariable String userId,@RequestBody String inputJson){

		
		UserInfoVO userInfoVO = new UserInfoVO();
	       ObjectMapper objectMapper = new ObjectMapper();
		try {
			userInfoVO = objectMapper.readValue(inputJson, UserInfoVO.class);

		} catch (IOException e) {

	    	logger.error(e.toString());
		}
		

	

		
		PermissionReqVO permissionReqVO = new PermissionReqVO();

		permissionReqVO.setUserId(userInfoVO.getUserId());
		permissionReqVO.setAthrCd(userInfoVO.getUserDivCd());
		
		boolean result  = permissionService.updatePermission(permissionReqVO);
	

	    return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
	}
	
	
	
	
	
	
	
}
 