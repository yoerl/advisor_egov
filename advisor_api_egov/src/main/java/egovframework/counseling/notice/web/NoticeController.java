package egovframework.counseling.notice.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import egovframework.counseling.notice.service.NoticeService;
import egovframework.counseling.notice.service.impl.NoticeVO;
import egovframework.example.sample.service.EgovSampleService;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
public class NoticeController {
	
	/** EgovSampleService */
	@Resource(name = "noticeService")
	private NoticeService noticeService;

	@GetMapping("/hellos.do")
	public String hello(@RequestParam("name") String name){
		return "bbbbbbbbbbbbbbb";
	}
	
	@GetMapping("/hello.do")
	public ResponseEntity<String> hello() throws Exception{
		
		List<NoticeVO> result = noticeService.selectNotice();
	    HttpHeaders headers = new HttpHeaders();
	    headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
	    return new ResponseEntity<>(result.toString(), headers, HttpStatus.OK);
	}
	
}
