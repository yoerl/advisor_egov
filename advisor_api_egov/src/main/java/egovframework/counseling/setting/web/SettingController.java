package egovframework.counseling.setting.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import egovframework.counseling.setting.service.SettingService;
import egovframework.counseling.setting.service.impl.SettingVO;
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

@RestController
public class SettingController {
  private static final Logger LOGGER = LogManager.getLogger(SettingController.class);
  
  @Resource(name = "settingService")
  private SettingService settingService;
  
  @PostMapping({"/api/setting.do"})
  public ResponseEntity<String> selectSetting(@RequestBody String inputJson) throws Exception {

    ObjectMapper objectMapper = new ObjectMapper();
    SettingVO settingVO = objectMapper.readValue(inputJson, SettingVO.class);

	String resultJson = "";
    SettingVO result = null;
    try {

    	result = this.settingService.selectSetting(settingVO);
    	

    	if(result.getEnvrStupVl()==null)
    	{


        	SettingVO settingVO1 = new SettingVO();


        	settingVO1.setUserId(settingVO.getUserId());
        	settingVO1.setEnvrStupDivCd("font");
        	settingVO1.setEnvrStupVl("font_dotum");


        	settingService.inserfont(settingVO1);


        	SettingVO settingVO2 = new SettingVO();


        	settingVO2.setUserId(settingVO.getUserId());
        	settingVO2.setEnvrStupDivCd("fontSize");
        	settingVO2.setEnvrStupVl("18");



        	settingService.insertFontSize(settingVO2);
        	



            result = this.settingService.selectSetting(settingVO);

    	}
    	
    	

    } catch (NullPointerException  e) {

    	LOGGER.error("/api/setting.do NullPointerException : " + e.toString(), e);

    	
    } catch (Exception e) {
        // 예외 처리 로직 작성
    	LOGGER.error("/api/setting.do Exception : " + e.toString(), e);
    }
    
    

    Gson gson = new Gson();

    resultJson = gson.toJson(result);
    
    HttpHeaders headers = new HttpHeaders();
    headers.set("Content-Type", "text/plain; charset=UTF-8");
    return new ResponseEntity<String>(resultJson, headers, HttpStatus.OK);
  }
  
  @PostMapping({"/api/setting/font.do"})
  public ResponseEntity<String> insertFont(@RequestBody String inputJson) throws Exception {
   
    ObjectMapper objectMapper = new ObjectMapper();
    SettingVO settingVO = objectMapper.readValue(inputJson, SettingVO.class);
    boolean result = this.settingService.inserfont(settingVO);
    HttpHeaders headers = new HttpHeaders();
    headers.set("Content-Type", "text/plain; charset=UTF-8");
    return new ResponseEntity<String>(String.valueOf(result), headers, HttpStatus.OK);
  }
  
  @PostMapping({"/api/setting/fontSize.do"})
  public ResponseEntity<String> insertFontSize(@RequestBody String inputJson) throws Exception {

    ObjectMapper objectMapper = new ObjectMapper();
    SettingVO settingVO = (SettingVO)objectMapper.readValue(inputJson, SettingVO.class);
    boolean result = this.settingService.insertFontSize(settingVO);
    HttpHeaders headers = new HttpHeaders();
    headers.set("Content-Type", "text/plain; charset=UTF-8");
    return new ResponseEntity<String>(String.valueOf(result), headers, HttpStatus.OK);
  }
  
  @GetMapping({"/api/setting/font.do"})
  public ResponseEntity<String> selectFont(@RequestBody String inputJson) throws Exception {
    LOGGER.info("api/setting/font.do");
    
    ObjectMapper objectMapper = new ObjectMapper();
    SettingVO settingVO = (SettingVO)objectMapper.readValue(inputJson, SettingVO.class);
    boolean result = this.settingService.inserfont(settingVO);
    HttpHeaders headers = new HttpHeaders();
    headers.set("Content-Type", "text/plain; charset=UTF-8");
    return new ResponseEntity<String>(String.valueOf(result), headers, HttpStatus.OK);
  }
  
  @GetMapping({"/api/performance.do"})
  public ResponseEntity<String> selectPerformance(SettingVO settingVO) throws Exception {

    String result = this.settingService.checkPerformance(settingVO);
    LOGGER.debug("done!");
    HttpHeaders headers = new HttpHeaders();
    headers.set("Content-Type", "text/plain; charset=UTF-8");
    return new ResponseEntity<String>(String.valueOf(result), headers, HttpStatus.OK);
  }
}
