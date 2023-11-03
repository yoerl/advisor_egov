package egovframework.counseling.remote.web;



import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import egovframework.counseling.remote.service.RemoteService;
import egovframework.counseling.remote.service.impl.RecommendVO;
import egovframework.counseling.remote.service.impl.SummaryVO;

import org.springframework.http.MediaType;




@RestController
public class RemoteController {

	private static final Logger logger = LogManager.getLogger(RemoteController.class);

	/** EgovSampleService */
	@Resource(name = "remoteService")
	private RemoteService remoteService;
	

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	//AP 요약 정보 전송
	@PostMapping(value = "/ext-api/summary.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> saveSummary(@RequestBody String inputJson){

		

        // RestTemplate 객체 생성
        RestTemplate restTemplate = new RestTemplate();

        // API 엔드포인트 URL 설정
        String apiUrl = propertiesService.getString("AP_SERVER")+"/ext-api/advisor/cutt";
        
        
        // HTTP 요청 헤더 설정 (JSON 형식임을 나타냄)
        HttpHeaders headers = new HttpHeaders();

        headers.setContentType(MediaType.APPLICATION_JSON);

        // HTTP 요청 본문에 JSON 데이터를 포함하는 HttpEntity 생성
        HttpEntity<String> requestEntity = new HttpEntity<>(inputJson, headers);

        // API 호출 및 응답 받기 (POST 요청으로 JSON 데이터 전송)
		String responseData ="";
		try {
	        ResponseEntity<String> response = restTemplate.postForEntity(apiUrl, requestEntity, String.class);
		    responseData = response.getBody();
        	logger.error("ap에서 받은 값 : "+ responseData, responseData.toString());
		} catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {

		    logger.error("요약 정보 전송 error : %s", e.toString());
		    // 오류 처리 또는 예외 반환
		}
		
		return new ResponseEntity<>(responseData, HttpStatus.OK);
		
		
	}
	
	
	
	@PostMapping(value = "/ext-api/ai-query.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> aiQuery(@RequestBody String inputJson){

		logger.debug("수동질의 호출");
		

        // RestTemplate 객체 생성
        RestTemplate restTemplate = new RestTemplate();

        // API 엔드포인트 URL 설정
        String apiUrl = propertiesService.getString("AI_SERVER")+"/ai/search";

        
        // HTTP 요청 헤더 설정 (JSON 형식임을 나타냄)
        HttpHeaders headers = new HttpHeaders();

        headers.setContentType(MediaType.APPLICATION_JSON);

        // HTTP 요청 본문에 JSON 데이터를 포함하는 HttpEntity 생성
        HttpEntity<String> requestEntity = new HttpEntity<>(inputJson, headers);

        // API 호출 및 응답 받기 (POST 요청으로 JSON 데이터 전송)
		String responseData ="";
		try {
	        ResponseEntity<String> response = restTemplate.postForEntity(apiUrl, requestEntity, String.class);
		    responseData = response.getBody();
		} catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {
		    logger.error("Error occurred while making the POST request: ", e);
		    // 오류 처리 또는 예외 반환
		}
		
		return new ResponseEntity<>(responseData, HttpStatus.OK);
	}
	

	@PostMapping(value = "/ext-api/recommend.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> sendRecommendKMS(@RequestBody String inputJson) throws JsonProcessingException {

		logger.error("/ext-api/recommend.do :"  + inputJson.toString());

		    ObjectMapper objectMapper = new ObjectMapper();
		    RecommendVO recommendVO = objectMapper.readValue(inputJson, RecommendVO.class);

			logger.error("/ext-api/recommend.do  recommendVO :"  + recommendVO.toString());

		// RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();

		// API 엔드포인트 URL 설정
		
		
		//192.168.22.157
		String apiUrl = propertiesService.getString("KMS_SERVER")+"/kms/api/v1/recommend.do";

		
		
		
		// 각 cntntId 파라미터 개별적으로 POST 요청 보내기
		StringBuilder responseDataBuilder = new StringBuilder();
		try {
		    String[] cntntIds = recommendVO.getCntntId();
		    for (String cntntId : cntntIds) {
		        // 요청 본문 데이터 생성
				/*
				 * MultiValueMap<String, String> requestBody = new LinkedMultiValueMap<>();
				 * requestBody.add("userId", recommendVO.getUserId());
				 * requestBody.add("cntntId", cntntId);
				 * 
				 */
		        String jsonInputString = "{\"userId\": \""+recommendVO.getUserId()+"\", \"cntntId\": \""+cntntId+"\"}";

		        
		        // HTTP 헤더 설정 (옵션)
		        HttpHeaders headers = new HttpHeaders();
		        headers.setContentType(MediaType.APPLICATION_JSON);

		        // HTTP 요청 엔티티 생성
		        HttpEntity<String> requestEntity = new HttpEntity<>(jsonInputString, headers);

		        // API 호출 및 응답 받기 (POST 요청으로 요청 본문을 전송)
		        ResponseEntity<String> response = restTemplate.postForEntity(apiUrl, requestEntity, String.class);
		        String responseDataPart = response.getBody();

		        // responseData에 각 응답을 추가 또는 처리
		        responseDataBuilder.append(responseDataPart);

		    }
		} catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {
			logger.error("추천에러 {}", e.toString());
		    // 오류 처리 또는 예외 반환
		}

		return new ResponseEntity<>(responseDataBuilder.toString(), HttpStatus.OK);

	}
	
	
	@GetMapping("/api/ext-api/summary.do")
	public ResponseEntity<String> selectSummary(HttpServletRequest request, Model model, @ModelAttribute("SummaryVO") SummaryVO summaryVO) {

    	logger.error("/api/ext-api/summary.do : "+ summaryVO.toString(), summaryVO.toString());
		String resultJson = null;
		try {

			String searchText = request.getParameter("searchText");
			

			if("".equals(searchText))
			{
				searchText=null;
			}
			
			summaryVO.setRecpNo(searchText);
			summaryVO.setKmsMemoCntn(searchText);
			
		
			
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			summaryVO.getPagination().setCurrentPage(currentPage);
			 
			List<SummaryVO> result = remoteService.selectSummary(summaryVO);

			Gson gson = new Gson();
			
			resultJson = gson.toJson(result);
			model.addAttribute("pagination", result.get(0).getPagination());
			
		} catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("null 에러 : "+ e, e.toString());
        } catch (Exception e) {
        	logger.error("에러 : "+ e, e.toString());
		    // 오류 처리 또는 예외 반환
		}
		
		
		

		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
	

	@GetMapping("/api/ext-api/one/summary.do")
	public ResponseEntity<String> selectOneSummary(HttpServletRequest request, Model model, @ModelAttribute("SummaryVO") SummaryVO summaryVO){
		logger.debug("요약 조회");
		
		 
		List<SummaryVO> result = remoteService.selectOneSummary(summaryVO);

		Gson gson = new Gson();
		
		String resultJson = gson.toJson(result);
		

		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
	
	
	

}