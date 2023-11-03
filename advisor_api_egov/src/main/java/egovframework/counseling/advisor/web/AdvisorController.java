package egovframework.counseling.advisor.web;



import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.counseling.advisor.service.AdvisorService;
import egovframework.counseling.advisor.service.impl.AdvisorDTO;
import egovframework.counseling.remote.service.impl.RecommendVO;
import egovframework.counseling.remote.web.RemoteController;

@RestController
public class AdvisorController {

	private static final Logger logger = LogManager.getLogger(AdvisorController.class);



	@Resource(name = "advisorService")
	private AdvisorService advisorService;
	
	@PutMapping(value = "/api/summary.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> updateSummary(@RequestBody String inputJson) throws JsonProcessingException{
		
	       ObjectMapper objectMapper = new ObjectMapper();

	       AdvisorDTO advisorDTO = objectMapper.readValue(inputJson, AdvisorDTO.class);

	        boolean result = advisorService.updateSummary(advisorDTO);

	        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);

	}
	
	
	
	
	//AP 요약 정보 전송
	@PostMapping(value = "/api/recommend.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> updateRecommend(@RequestBody String inputJson){

			
	       ObjectMapper objectMapper = new ObjectMapper();
			try {
		
	       RecommendVO recommendVO = objectMapper.readValue(inputJson, RecommendVO.class);



	       
		    String[] KMSkey =  recommendVO.getKmsKey();

		    for (String kmskey : KMSkey) {
		    	// 구분자로 문자열 분할
		    	

		        String[] parts = kmskey.split("\\|\\|\\|");

		        
		    	AdvisorDTO advisorDTO = new AdvisorDTO();
		    	advisorDTO.setConsHstrId(parts[0]);
		    	advisorDTO.setSqnc(parts[1]);
		    	advisorDTO.setKmsCntsSqnc(parts[2]);
			       
		        advisorService.updateKmsRply(advisorDTO);
		        
		    }
		    
		    

		       
		    String[] AIkey =  recommendVO.getAiKey();
		    for (String aikey : AIkey) {
		    	// 구분자로 문자열 분할
		        String[] parts = aikey.split("\\|\\|\\|");
		        
		        
		    	AdvisorDTO advisorDTO = new AdvisorDTO();
		    	advisorDTO.setConsHstrId(parts[0]);
		    	advisorDTO.setSqnc(parts[1]);
		        advisorService.updateAiRplyHist(advisorDTO);
		        
		        
		    }
		    
		    
			} catch (NullPointerException  e) {
	            // 예외 처리 로직 작성
	        	logger.error("NullPointerException : "+ e, e.toString());
	        } catch (Exception e) {

			    logger.error("kms 활용 여부, ai 활용 여부 error : %s " + e.toString(), e.toString());
			    // 오류 처리 또는 예외 반환
			}
			
	        return new ResponseEntity<>(String.valueOf("true"), HttpStatus.OK);
	
		
		
	}
	
	
	
}
 