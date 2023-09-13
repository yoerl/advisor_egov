package egovframework.counseling.common.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import egovframework.counseling.common.service.CommonService;
import egovframework.counseling.common.service.impl.AgencyVO;
import egovframework.counseling.common.service.impl.CommonVO;
import egovframework.counseling.notice.service.NoticeService;
import egovframework.counseling.notice.service.impl.NoticeVO;
import egovframework.example.sample.service.EgovSampleService;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@RestController
public class CommonController {
	
	private static final Logger logger = LogManager.getLogger(CommonController.class);


	/** EgovSampleService */
	@Resource(name = "commonService")
	private CommonService commonService;
		
	@GetMapping("/api/common/agency.do")
	public ResponseEntity<String> selectAgency() throws Exception{
		logger.info("행정기관11");
		
		List<CommonVO> result = commonService.selectAgency();
		logger.info("행정기관2"+result.toString());
			Gson gson = new Gson();
			String resultJson = gson.toJson(result);

	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
	
	@GetMapping("/api/common/data/{common_code}.do")
	public ResponseEntity<String> selectCommonCode(@PathVariable String common_code) throws Exception{
		logger.info("행정기관11");
		
		
		CommonVO commonVO = new CommonVO();
		commonVO.setComnCd(common_code);
		
		List<CommonVO> result = commonService.selectCommonCode(commonVO);
		logger.info("행정기관2"+result.toString());
			Gson gson = new Gson();
			String resultJson = gson.toJson(result);

	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
	
//
//	@GetMapping("/api/notice/{id}.do")
//	public ResponseEntity<String> selectNotice(@PathVariable String id) throws Exception{
//		logger.info("공지사항 단건 조회");
//		
//		List<NoticeVO> result = noticeService.selectNoticeOne(id);
//		
//		Gson gson = new Gson();
//		
//		String resultJson = gson.toJson(result);
//		
//	    HttpHeaders headers = new HttpHeaders();
//	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
//	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
//	}
//	
//    @PostMapping(value = "/api/notice.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
//    public ResponseEntity<String> insertNotice(@RequestBody String input_json) throws Exception {
//		logger.info("공지사항 입력");
//    	
//        ObjectMapper objectMapper = new ObjectMapper();
//        NoticeVO noticeVO = objectMapper.readValue(input_json, NoticeVO.class);
//
//        boolean result = noticeService.insertNoticeOne(noticeVO);
//        
//        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
//    }
//    
//    @DeleteMapping("/api/notice/{id}.do")
//    public ResponseEntity<String> deleteNotice(@PathVariable String id) throws Exception {
//        logger.info("공지사항 삭제");
//        logger.info(id.toString());
//
//        boolean result = noticeService.deleteNoticeOne(id);
//
//        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
//    }
//    
//
//    @PutMapping(value = "/api/notice.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
//    public ResponseEntity<String> updateNotice(@RequestBody String input_json) throws Exception {
//        logger.info("공지사항 수정");
//
//        ObjectMapper objectMapper = new ObjectMapper();
//        NoticeVO noticeVO = objectMapper.readValue(input_json, NoticeVO.class);
//        
//        // 여기서 noticeVO 객체에 있는 데이터를 사용하여 공지사항을 수정하는 로직을 작성합니다.
//        // 예를 들어, noticeService.updateNoticeOne(noticeVO)와 같은 메서드를 사용할 수 있습니다.
//        boolean result = noticeService.updateNoticeOne(noticeVO);
//
//        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
//    }

	
	
	
}
