package egovframework.counseling.news.web;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.counseling.news.service.NewsService;
import egovframework.counseling.news.service.impl.NewsVO;
import egovframework.counseling.notice.service.impl.NoticeVO;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@RestController
public class NewsController {
	
	private static final Logger logger = LogManager.getLogger(NewsController.class);

	
	/** EgovSampleService */
	@Resource(name = "newsService")
	private NewsService newsService;


	@GetMapping("/api/news.do")
	public ResponseEntity<String> selectNews() throws Exception {
		logger.info("소식 리스트 조회");
		
		NewsVO newsVo = new NewsVO();

		logger.info("소식 리스트 조회1111");
		List<NewsVO> result = newsService.selectNewss(newsVo);

		logger.info("소식 리스트 조회222");
		Gson gson = new Gson();

		String resultJson = gson.toJson(result);
		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}

	/*
	 * @GetMapping("/api/news/{id}.do") public ResponseEntity<String>
	 * selectNewsOne(@PathVariable String id) throws Exception{
	 * logger.info("소식 단건 조회");
	 * 
	 * List<NoticeVO> result = newsService.selectNewsOne(id);
	 * 
	 * Gson gson = new Gson();
	 * 
	 * String resultJson = gson.toJson(result);
	 * 
	 * HttpHeaders headers = new HttpHeaders();
	 * headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8"); return
	 * new ResponseEntity<>(resultJson, headers, HttpStatus.OK); }
	 * 
	 * 
	 * 
	 * @PostMapping(value = "/api/news/{id}/read.do", headers =
	 * {"content-type=application/json,application/xml,application/x-www-form-urlencoded"
	 * }) public ResponseEntity<String> newsRead(@RequestBody String input_json)
	 * throws Exception { logger.info("소식 읽음 처리"); boolean result =
	 * newsService.readNews("");
	 * 
	 * return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK); }
	 */
    

    
	
	
}
