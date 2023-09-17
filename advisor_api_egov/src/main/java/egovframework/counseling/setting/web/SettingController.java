package egovframework.counseling.setting.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		LOGGER.info("환경설정 조회");

        ObjectMapper objectMapper = new ObjectMapper();
        SettingVO settingVO = objectMapper.readValue(input_json, SettingVO.class);

        System.out.println("qqqqqqqqqqqqqqq");
        System.out.println(settingVO.toString());
        System.out.println("wwwwwwwwwww");
        

		SettingVO result = settingService.selectSetting(settingVO);

		Gson gson = new Gson();
		String resultJson = gson.toJson(result);
		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
}
