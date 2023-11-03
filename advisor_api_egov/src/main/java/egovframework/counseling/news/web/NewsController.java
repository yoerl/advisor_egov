package egovframework.counseling.news.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import egovframework.counseling.news.service.NewsService;
import egovframework.counseling.news.service.impl.NewsVO;

@RestController
public class NewsController {
	
	private static final Logger logger = LogManager.getLogger(NewsController.class);

	private static final String CONTENT_TYPE_UTF8 = "text/plain; charset=UTF-8";
	
	/** EgovSampleService */
	@Resource(name = "newsService")
	private NewsService newsService;


	@GetMapping("/api/news.do")
	public ResponseEntity<String> selectNews(HttpServletRequest request, Model model, @ModelAttribute("newsVO") NewsVO newsVO) {
	    logger.info("소식 리스트 조회");

	    HttpHeaders headers = null;
	    String resultJson = null;
	    
	        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	        newsVO.getPagination().setCurrentPage(currentPage);
	        List<NewsVO> result = newsService.selectNewss(newsVO);

	        if(!result.isEmpty())
	        {

		        Gson gson = new Gson();
		        resultJson = gson.toJson(result);
		    	model.addAttribute("pagination", result.get(0).getPagination());
	        }
	    	

			headers = new HttpHeaders();
			headers.set(HttpHeaders.CONTENT_TYPE, CONTENT_TYPE_UTF8); 
        return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}


	
	@GetMapping("/api/news/{id}.do")
	public ResponseEntity<String> selectNewsOne(@PathVariable int id){
		logger.info("소식 단건 조회");
	  
		NewsVO result = newsService.selectNewsOne(id);
	  
		Gson gson = new Gson();
	  
		String resultJson = gson.toJson(result);
	  
		HttpHeaders headers = new HttpHeaders();
		headers.set(HttpHeaders.CONTENT_TYPE, CONTENT_TYPE_UTF8); 
		return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	  

	
	@GetMapping("/api/newsRead.do")
	public ResponseEntity<String> updateNewsRead(@RequestParam("chkArry[]") List<Integer> newsSqnoArry, @ModelAttribute("newsVO") NewsVO newsVO)  {
		
		boolean result = newsService.updateNewsRead(newsSqnoArry);

		return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
	}
	
	
	
    

	@PostMapping(value = "/api/news.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
	public ResponseEntity<String> insertNews(@RequestBody String inputJson) throws JsonProcessingException{

			logger.debug("알람 인서트");

		
	       ObjectMapper objectMapper = new ObjectMapper();

			NewsVO newsVO = objectMapper.readValue(inputJson, NewsVO.class);

			
			
			
	        boolean result = newsService.insertNews(newsVO);

	        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
	

	}
	
	@GetMapping("/api/news/cnt/read-not.do")
	public ResponseEntity<String> selectNewsNotReadCnt(HttpServletRequest request, Model model) {

			logger.debug("알람 읽지 않음 처리");

	        

		    try {
		        String receiverId = request.getParameter("receiverId");

				NewsVO newsVO = new NewsVO();
				
				newsVO.setReceiverId(receiverId);
				
		        int result = newsService.selectNewsNotReadCnt(newsVO);

		        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
		    } catch (NullPointerException  e) {
		           // 예외 처리 로직 작성
		       	logger.error("NullPointerException : "+ e, e.toString());
		       } catch (Exception e) {
		    	logger.error(e.toString());
		        
		    }
			return null;

	}
    
	
	
	
	
}
