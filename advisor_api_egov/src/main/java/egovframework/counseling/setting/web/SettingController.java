package egovframework.counseling.setting.web;


import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import egovframework.counseling.setting.service.SettingService;
import egovframework.counseling.setting.service.impl.SettingVO;


@RestController
public class SettingController {

	private static final Logger LOGGER = LogManager.getLogger(SettingController.class);

	/** settingService */
	@Resource(name = "settingService")
	private SettingService settingService;
	
	@PostMapping("/api/setting.do")
	public ResponseEntity<String> selectSetting(@RequestBody String input_json) throws Exception{
		LOGGER.info("환경설정 조회1111");

        ObjectMapper objectMapper = new ObjectMapper();
        SettingVO settingVO = objectMapper.readValue(input_json, SettingVO.class);

		SettingVO result = settingService.selectSetting(settingVO);

		Gson gson = new Gson();
		String resultJson = gson.toJson(result);
		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
	
	@PostMapping("/api/setting/font.do")
	public ResponseEntity<String> insertFont(@RequestBody String input_json) throws Exception{
		LOGGER.info("폰트입력 2222");

        ObjectMapper objectMapper = new ObjectMapper();
        SettingVO settingVO = objectMapper.readValue(input_json, SettingVO.class);

//nvrStupDivCd=font, userId=ID9991, envrStupDivNm=null, envrStupVl=null, amndId=null, amntDttm=null, rgsrId=null, rgsnDttm=null]
       
		boolean result = settingService.inserfont(settingVO);

		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(String.valueOf(result), headers, HttpStatus.OK);
	}
	
	@PostMapping("/api/setting/fontSize.do")
	public ResponseEntity<String> insertFontSize(@RequestBody String input_json) throws Exception{
		LOGGER.info("폰트사이즈 입력");
		
		ObjectMapper objectMapper = new ObjectMapper();
		SettingVO settingVO = objectMapper.readValue(input_json, SettingVO.class);
		
//nvrStupDivCd=fontSize, userId=ID9991, envrStupDivNm=null, envrStupVl=null, amndId=null, amntDttm=null, rgsrId=null, rgsnDttm=null]
		
		boolean result = settingService.insertFontSize(settingVO);
		
		HttpHeaders headers = new HttpHeaders();
		headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
		return new ResponseEntity<>(String.valueOf(result), headers, HttpStatus.OK);
	}
	
	@GetMapping("/api/setting/font.do")
	public ResponseEntity<String> selectFont(@RequestBody String input_json) throws Exception{
		LOGGER.info("폰트입력 2222");

        ObjectMapper objectMapper = new ObjectMapper();
        SettingVO settingVO = objectMapper.readValue(input_json, SettingVO.class);
        
//nvrStupDivCd=font, userId=ID9991, envrStupDivNm=null, envrStupVl=null, amndId=null, amntDttm=null, rgsrId=null, rgsnDttm=null]
       
		boolean result = settingService.inserfont(settingVO);

	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(String.valueOf(result), headers, HttpStatus.OK);
	}
}
