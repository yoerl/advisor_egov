package egovframework.counseling.notice.web;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
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
	public ResponseEntity<String> selectNotices(HttpServletRequest request, Model model,
			@ModelAttribute("NoticeVo") NoticeVO noticeVO) {
		logger.info("공지사항 리스트 조회");

		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		noticeVO.getPagination().setCurrentPage(currentPage);
		List<NoticeVO> result = noticeService.selectNotices(noticeVO);

		String resultJson = "";
		if (!result.isEmpty()) {

			Gson gson = new Gson();

			resultJson = gson.toJson(result);
			model.addAttribute("pagination", result.get(0).getPagination());

		}

		HttpHeaders headers = new HttpHeaders();
		headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
		return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}

	@GetMapping("/api/notice/{id}.do")
	public ResponseEntity<String> selectNotice(@PathVariable String id) {
		logger.info("공지사항 단건 조회");

		List<NoticeVO> result = noticeService.selectNoticeOne(id);

		Gson gson = new Gson();

		String resultJson = gson.toJson(result);

		HttpHeaders headers = new HttpHeaders();
		headers.set(HttpHeaders.CONTENT_TYPE, "text/plain; charset=UTF-8");
		return new ResponseEntity<>(resultJson, headers, HttpStatus.OK);
	}

	@PostMapping(value = "/api/notice.do", headers = {
			"content-type=application/json,application/xml,application/x-www-form-urlencoded" })
	public ResponseEntity<String> insertNotice(@RequestBody String inputJson) throws JsonProcessingException {
		logger.info("공지사항 입력");

		ObjectMapper objectMapper = new ObjectMapper();
		NoticeVO noticeVO = objectMapper.readValue(inputJson, NoticeVO.class);

		boolean result = noticeService.insertNoticeOne(noticeVO);

		return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
	}

	@DeleteMapping("/api/notice/{id}.do")
	public ResponseEntity<String> deleteNotice(@PathVariable String id) {
		logger.info("공지사항 삭제");

		boolean result = noticeService.deleteNoticeOne(id);

		return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
	}

	@PutMapping(value = "/api/notice.do", headers = {
			"content-type=application/json,application/xml,application/x-www-form-urlencoded" })
	public ResponseEntity<String> updateNotice(@RequestBody String inputJson) throws JsonProcessingException {
		logger.info("공지사항 수정");

		ObjectMapper objectMapper = new ObjectMapper();
		NoticeVO noticeVO = objectMapper.readValue(inputJson, NoticeVO.class);

		// 여기서 noticeVO 객체에 있는 데이터를 사용하여 공지사항을 수정하는 로직을 작성합니다.
		// 예를 들어, noticeService.updateNoticeOne(noticeVO)와 같은 메서드를 사용할 수 있습니다.
		boolean result = noticeService.updateNoticeOne(noticeVO);

		return new ResponseEntity<>(String.valueOf(result), HttpStatus.OK);
	}

	 @RequestMapping(value = "/api/fileUpload.do")
	    public String fileupload(final MultipartHttpServletRequest multiRequest, Model model) {
	        MultipartFile file = null;
	        try {
	            // 파일 업로드된 파트들을 얻습니다.
	            Iterator<String> fileNames = multiRequest.getFileNames();
	            while (fileNames.hasNext()) {
	                String fileName = fileNames.next();
	                file = multiRequest.getFile(fileName);
	                
	                // 파일 정보 출력 예시
	                if (file != null) {
	                    String originalFileName = file.getOriginalFilename();
	                    long fileSize = file.getSize();
	                    String contentType = file.getContentType();
	                    
	                    logger.error("/fileUpload - OriginalFileName: " + originalFileName);
	                    logger.error("/fileUpload - FileSize: " + fileSize);
	                    logger.error("/fileUpload - ContentType: " + contentType);
	                    
	                    // 파일 저장 로직
	                    String uploadDir = "/files/advisor"; // This should be the absolute path.
	                    File destinationFile = new File(uploadDir, originalFileName);
	                    
	                    // Ensure that the directory exists
	                    destinationFile.getParentFile().mkdirs();

	                    // Transfer the file
	                    file.transferTo(destinationFile);
	                    
	                    logger.error("File uploaded successfully: " + destinationFile.getAbsolutePath());
	                }
	            }
	        } catch (Exception e) {
	            logger.error("Exception during file upload: " + e.getMessage(), e);
	            return "error"; // You might want to navigate to an error page or handle the exception differently
	        }
	        
	        // Redirect or forward to a success page, or return success response
	        return "successView"; // Assuming "successView" is the view name of your success page
	    }
	 
	 
	
	/*
	 * @RequestMapping(value = "/api/ckeditor5Upload.do") public void
	 * fileUpload(@RequestBody String test) { logger.error("/common/fms/c  55555" +
	 * test); }
	 */
	@RequestMapping(value = "/api/ckeditor5Upload.do")
	public ResponseEntity<String> fileUpload(final HttpServletRequest request, Model model) throws Exception {
		// public String fileupload(final HttpServletRequest request, Model model)
		// throws Exception {
		// public ResponseEntity<String> fileUpload() throws Exception {
		/*
		 * try { logger.error("/common/fms/ckeditor5Upload.do"); final
		 * MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)
		 * request; logger.error("/common/fms/ckeditor5Upload.do" + request); final
		 * Map<String, MultipartFile> files = multiRequest.getFileMap();
		 * Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		 * MultipartFile file; String filePath; String fileName;
		 * logger.error("/common/fms/c  333222"); while (itr.hasNext()) {
		 * 
		 * Entry<String, MultipartFile> entry = itr.next(); file = entry.getValue();
		 * logger.error("/common/fms/c  333wwww222"); fileName =
		 * file.getOriginalFilename(); logger.error("/common/fms/c  333222ss22"); if
		 * (!"".equals(fileName)) {
		 * 
		 * // macOS 한글 풀어쓰기 => 모아쓰기 처리 // UTF-8 NFD => NFC 처리 // ex) ㅅㅡㅋㅡㄹㅣㄴ.txt =>
		 * 스크린.txt fileName = Normalizer.normalize(fileName, Normalizer.Form.NFC);
		 * 
		 * // 파일 전송 filePath = "/contents/test.png";
		 * logger.error("/common/fms/c  33322cvcvvcvc2"); file.transferTo(new
		 * File(filePath)); file.transferTo(new File("/contents/"));
		 * logger.error("/common/fms/c  333csvwve222");
		 * 
		 * } } }catch (Exception e) { logger.error(e); }
		 */

		logger.error("/common/fms/c  11111111111" + request.toString());
		final String real_save_path = "/contents/";
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

		// MultipartFile file = fileVo.getFile();
		logger.error("/common/fms/c  222222"); // 폴더가 없을 경우 생성
		File saveFolder = new File(real_save_path);
		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.mkdirs();
		}

		logger.error("/common/fms/c  333");

		// logger.error("/common/fms/c 444-1 " + fileVo.getFile());
		// logger.error("/common/fms/c 444-2 " + file.ge()); //filename 취득
		// String fileName = fileload.getOriginalFilename();

		logger.error("/common/fms/c  55555");
		// int index = fileName.lastIndexOf("."); //String ext =
		// fileName.substring(index+1);
		// Random ran = new Random(System.currentTimeMillis()); //fileName =
		// System.currentTimeMillis()+"_"+(int)(ran.nextDouble()*10000)+"."+ext;

		logger.error("/common/fms/c  66666"); // 폴더 경로 설정
		String newfilename = real_save_path + "test.png";

		logger.error("/common/fms/c  7777" + newfilename.toString());

		// file.transferTo(new File(newfilename));

		logger.error("/common/fms/c  99999");
		// JSONObject outData = new JSONObject();
		// outData.put("uploaded", true);
		// outData.put("url", request.getScheme() + "://" + request.getServerName() +
		// ":" +
		// request.getServerPort() +
		// "/advisor_api_egov/api/getImageForContents.do?fileNm=" + fileName);
		// response.setContentType("application/json");
		// response.setCharacterEncoding("UTF-8");
		// response.getWriter().print(outData.toString()); } catch (Exception e) {
		// logger.error(e);
		return new ResponseEntity<>(String.valueOf("qq1111sd"), HttpStatus.OK);

	}

	@RequestMapping("/api/getImageForContents.do")
	public void getImageForContents(ModelMap model, @RequestParam Map<String, Object> commandMap,
			HttpServletResponse response) throws Exception {
		String fileNm = (String) commandMap.get("fileNm");
		String fileStr = "contents/";

		File tmpDir = new File(fileStr);
		if (!tmpDir.exists()) {
			tmpDir.mkdirs();
		}

		FileInputStream fis = null;
		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;

		try {

			fis = new FileInputStream(new File(fileStr, fileNm));
			in = new BufferedInputStream(fis);
			bStream = new ByteArrayOutputStream();

			int imgByte;
			while ((imgByte = in.read()) != -1) {
				bStream.write(imgByte);
			}

			String type = "";
			String ext = fileNm.substring(fileNm.lastIndexOf(".") + 1).toLowerCase();

			if ("jpg".equals(ext)) {
				type = "image/jpeg";
			} else {
				type = "image/" + ext;
			}

			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());

			bStream.writeTo(response.getOutputStream());

			response.getOutputStream().flush();
			response.getOutputStream().close();

		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

}