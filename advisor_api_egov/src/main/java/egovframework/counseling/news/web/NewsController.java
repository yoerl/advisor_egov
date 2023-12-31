package egovframework.counseling.news.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import egovframework.counseling.news.service.NewsService;
import egovframework.counseling.news.service.impl.NewsVO;

@RestController
public class NewsController {
	
	private static final Logger logger = LogManager.getLogger(NewsController.class);

	
	/** EgovSampleService */
	@Resource(name = "newsService")
	private NewsService newsService;


	@GetMapping("/api/news.do")
	public ResponseEntity<String> selectNews(HttpServletRequest request, @ModelAttribute("newsVO") NewsVO newsVO) throws Exception {
		logger.info("소식 리스트 조회");
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		newsVO.getPagination().setCurrentPage(currentPage);
		List<NewsVO> result = newsService.selectNewss(newsVO);

		Gson gson = new Gson();

		String resultJson = gson.toJson(result);
		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}

	@GetMapping("/api/news/{id}.do")
	public ResponseEntity<String> selectNewsOne(@PathVariable int id) throws Exception{
		logger.info("소식 단건 조회");
	  
		NewsVO result = newsService.selectNewsOne(id);
	  
		Gson gson = new Gson();
	  
		String resultJson = gson.toJson(result);
	  
		HttpHeaders headers = new HttpHeaders();
		headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8"); 
		return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	  

	
	@GetMapping("/api/newsRead.do")
	public ResponseEntity<String> updateNewsRead(@RequestParam("chkArry[]") List<Integer> newsSqnoArry, @ModelAttribute("newsVO") NewsVO newsVO) throws Exception {
		
		boolean result = newsService.updateNewsRead(newsSqnoArry);

		return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
	}
	
	
	
	/*
	@PostMapping(value = "/api/news/{id}/read.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"}) 
	public ResponseEntity<String> newsRead(@RequestBody String input_json) throws Exception {
		logger.info("소식 읽음 처리"); boolean result = newsService.readNews("");
  
		return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK); 
	}*/
	 
    

    
	
	
}
