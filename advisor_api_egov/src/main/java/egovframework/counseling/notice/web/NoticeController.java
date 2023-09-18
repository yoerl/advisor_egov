package egovframework.counseling.notice.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import egovframework.counseling.notice.service.NoticeService;
import egovframework.counseling.notice.service.impl.NoticeVO;

@RestController
public class NoticeController {
	
	private static final Logger logger = LogManager.getLogger(NoticeController.class);

	
	/** EgovSampleService */
	@Resource(name = "noticeService")
	private NoticeService noticeService;


	@GetMapping("/api/notices.do")
	public ResponseEntity<String> selectNotices(HttpServletRequest request, Model model, @ModelAttribute("NoticeVo") NoticeVO noticeVO) throws Exception{
		logger.info("공지사항 리스트 조회");
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		noticeVO.getPagination().setCurrentPage(currentPage);
		List<NoticeVO> result = noticeService.selectNotices(noticeVO);

		System.out.println("aaaaaa");
		System.out.println(result.toString());
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(result);
		model.addAttribute("pagination", result.get(0).getPagination());

		System.out.println("qqqqqqqqqqqqqq");
		System.out.println(resultJson);
		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}

	@GetMapping("/api/notice/{id}.do")
	public ResponseEntity<String> selectNotice(@PathVariable String id) throws Exception{
		logger.info("공지사항 단건 조회");
		
		List<NoticeVO> result = noticeService.selectNoticeOne(id);
		
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(result);
		
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}
	
    @PostMapping(value = "/api/notice.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
    public ResponseEntity<String> insertNotice(@RequestBody String input_json) throws Exception {
		logger.info("공지사항 입력");
    	
        ObjectMapper objectMapper = new ObjectMapper();
        NoticeVO noticeVO = objectMapper.readValue(input_json, NoticeVO.class);

        boolean result = noticeService.insertNoticeOne(noticeVO);
        
        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
    }
    
    @DeleteMapping("/api/notice/{id}.do")
    public ResponseEntity<String> deleteNotice(@PathVariable String id) throws Exception {
        logger.info("공지사항 삭제");
        logger.info(id.toString());

        boolean result = noticeService.deleteNoticeOne(id);

        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
    }
    

    @PutMapping(value = "/api/notice.do", headers = {"content-type=application/json,application/xml,application/x-www-form-urlencoded"})
    public ResponseEntity<String> updateNotice(@RequestBody String input_json) throws Exception {
        logger.info("공지사항 수정");

        ObjectMapper objectMapper = new ObjectMapper();
        NoticeVO noticeVO = objectMapper.readValue(input_json, NoticeVO.class);
        
        // 여기서 noticeVO 객체에 있는 데이터를 사용하여 공지사항을 수정하는 로직을 작성합니다.
        // 예를 들어, noticeService.updateNoticeOne(noticeVO)와 같은 메서드를 사용할 수 있습니다.
        boolean result = noticeService.updateNoticeOne(noticeVO);

        return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
    }

	
	
	
}