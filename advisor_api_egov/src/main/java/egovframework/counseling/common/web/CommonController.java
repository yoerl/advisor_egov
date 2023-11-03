
package egovframework.counseling.common.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.counseling.common.service.CommonService;
import egovframework.counseling.common.service.impl.ChatbotVO;
import egovframework.counseling.common.service.impl.CommonVO;
import egovframework.counseling.common.service.impl.MenuAuthVO;
import egovframework.counseling.permission.web.PermissionController;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;



@RestController
public class CommonController {

	private static final String CONTENT_TYPE_UTF8 = "text/plain; charset=UTF-8";
	private static final Logger logger = LogManager.getLogger(CommonController.class);
	private static final String MENU_PREFIX = "menu_";
	
	/** EgovSampleService */
	@Resource(name = "commonService")
	private CommonService commonService;

	@GetMapping("/api/common/agency.do")
	public ResponseEntity<String> selectAgency() {

		List<CommonVO> result = commonService.selectAgency();
		Gson gson = new Gson();
		String resultJson = gson.toJson(result);

		HttpHeaders headers = new HttpHeaders();
		headers.set(HttpHeaders.CONTENT_TYPE, CONTENT_TYPE_UTF8);
		return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}

	@GetMapping("/api/common/data/{commonCode}.do")
	public ResponseEntity<String> selectCommonCode(@PathVariable String commonCode) {
		logger.info("/api/common/data/{commonCode}.do");

		CommonVO commonVO = new CommonVO();
		commonVO.setComnCd(commonCode);

		List<CommonVO> result = commonService.selectCommonCode(commonVO);
		Gson gson = new Gson();
		String resultJson = gson.toJson(result);

		HttpHeaders headers = new HttpHeaders();
		headers.set(HttpHeaders.CONTENT_TYPE, CONTENT_TYPE_UTF8);
		return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	

	@GetMapping("/api/auth/menu/{insttCode}/{authCd}.do")
	public ResponseEntity<String> selectUserAuthCd(@PathVariable String insttCode, @PathVariable String authCd) {
		logger.debug("행342424");
		logger.debug("행342424 : " + insttCode.toString());
		logger.debug("행342424 " + authCd.toString());

		CommonVO commonVO = new CommonVO();
		commonVO.setComnCd(authCd);
		commonVO.setHgrnComnCd(insttCode);
		List<CommonVO> result = commonService.selectAuthMenu(commonVO);
		
		

		CommonVO commonwVO = new CommonVO();
		commonwVO.setComnCd("system_check");
		commonwVO.setComnCdVal(insttCode);
		
		
		CommonVO ad= commonService.selectSystemChkAuth(commonwVO).get(0);
		
		
		
		CommonVO sysVo = new CommonVO();

		
		sysVo.setUseYn(ad.getUseYn());
		sysVo.setComnCdVal("systemcheck");
		

		
		result.add(sysVo);

		Gson gson = new Gson();
		String resultJson = gson.toJson(result);

		HttpHeaders headers = new HttpHeaders();
		headers.set(HttpHeaders.CONTENT_TYPE, CONTENT_TYPE_UTF8);
		return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
	
	
    @PutMapping(value = "/api/auth/menu.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
    public ResponseEntity<String> updateMunuAuth(@RequestBody String inputJson) throws JsonProcessingException {
       ObjectMapper objectMapper = new ObjectMapper();
 
       MenuAuthVO menuAuthVO = objectMapper.readValue(inputJson, MenuAuthVO.class);

	   
	   
	   CommonVO cmmonVO = new CommonVO();
	   
	   cmmonVO.setUseYn(menuAuthVO.getMemo());
	   cmmonVO.setComnCd(MENU_PREFIX+menuAuthVO.getRolecode());
	   cmmonVO.setComnCdVal("memo");
	   cmmonVO.setHgrnComnCd(menuAuthVO.getInsttcode());  
       commonService.updateMunuAuth(cmmonVO);
       
	   
	   cmmonVO.setUseYn(menuAuthVO.getHistory());
	   cmmonVO.setComnCd(MENU_PREFIX+menuAuthVO.getRolecode());
	   cmmonVO.setComnCdVal("history");
	   cmmonVO.setHgrnComnCd(menuAuthVO.getInsttcode());  
       commonService.updateMunuAuth(cmmonVO);
       
	   
       cmmonVO.setUseYn(menuAuthVO.getSetting());
	   cmmonVO.setComnCd(MENU_PREFIX+menuAuthVO.getRolecode());
	   cmmonVO.setComnCdVal("setting");
	   cmmonVO.setHgrnComnCd(menuAuthVO.getInsttcode());  
       commonService.updateMunuAuth(cmmonVO);
       

       cmmonVO.setUseYn(menuAuthVO.getMonitering());
	   cmmonVO.setComnCd(MENU_PREFIX+menuAuthVO.getRolecode());
	   cmmonVO.setComnCdVal("monitering");
	   cmmonVO.setHgrnComnCd(menuAuthVO.getInsttcode());  
       commonService.updateMunuAuth(cmmonVO);
       

       cmmonVO.setUseYn(menuAuthVO.getPermission());
	   cmmonVO.setComnCd(MENU_PREFIX+menuAuthVO.getRolecode());
	   cmmonVO.setComnCdVal("permission");
	   cmmonVO.setHgrnComnCd(menuAuthVO.getInsttcode());  
       commonService.updateMunuAuth(cmmonVO);
       
       

       cmmonVO.setUseYn(menuAuthVO.getNotice());
	   cmmonVO.setComnCd(MENU_PREFIX+menuAuthVO.getRolecode());
	   cmmonVO.setComnCdVal("notice");
	   cmmonVO.setHgrnComnCd(menuAuthVO.getInsttcode());  
	   
	   cmmonVO.setUseYn(menuAuthVO.getKnow());
	   cmmonVO.setComnCd(MENU_PREFIX+menuAuthVO.getRolecode());
	   cmmonVO.setComnCdVal("know");
	   cmmonVO.setHgrnComnCd(menuAuthVO.getInsttcode());  
	   
       commonService.updateMunuAuth(cmmonVO);
	   

       CommonVO cmmonVOs = new CommonVO();
       cmmonVOs.setComnCd("system_check");
       // 기간
       cmmonVOs.setComnCdVal(menuAuthVO.getInsttcode());
       cmmonVOs.setUseYn(menuAuthVO.getSystemChk());
       
       logger.debug("21d21d21d1 : " +cmmonVOs.toString());
       boolean result = commonService.updateSystemChkAuth(cmmonVOs);

       logger.debug("ecqncoeqvciehoc");
       
       // 봇 ID 변경
       ChatbotVO chatbotVO = new ChatbotVO();
       
       chatbotVO.setInttCd(menuAuthVO.getInsttcode());
       chatbotVO.setUserDivCd(menuAuthVO.getRolecode());
       
       if("Y".equals(menuAuthVO.getKnow())) {
           chatbotVO.setCmnSpcDivCd("CMN");
       }
       else
       {
    	   chatbotVO.setCmnSpcDivCd("SPC");
       }
       
		

       try {
           commonService.updateChatBotGrop(chatbotVO);
       } catch (NullPointerException  e) {
           // 예외 처리 로직 작성
       	logger.error("NullPointerException : "+ e, e.toString());
       } catch (Exception e) {
           // 예외 처리 로직 작성
       		logger.error("봇 ID 변경 하다 에러 : ", e);
       }

	   

       
       
        
        
       return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
    }
    


}
