/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.util.EgovFileUploadUtil;
import egovframework.com.util.EgovFormBasedFileUtil;
import egovframework.com.util.EgovProperties;
import egovframework.service.FileUploadService;

/**
 * 파일업로드 기능을 관리하는 컨트롤러 클래스를 정의한다.
 * 
 * @author 실행환경 개발팀 이영진
 * @since 2011.07.11
 * @version 1.0
 * @see
 * 
 *      <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.07.11  이영진          최초 생성
 * 
 *      </pre>
 */
@Controller
public class ExampleController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ExampleController.class);

	/** FileUploadService */
	@Resource(name = "fileUploadService")
	FileUploadService fileUploadServiceImpl;

	/**
	 * 파일업로드 후 화면으로 이동한다.
	 * 
	 * @return "view"
	 */
	@RequestMapping(value = "/fileUploadView.do")
	public String Viewmain() {
		return "view";
	}

	/**
	 * 파일을 업로드 한다.
	 * 
	 * @param request
	 * @param model
	 * @return "view"
	 * @throws Exception
	 */
	@RequestMapping(value = "/fileUpload.do")
	public String fileupload(final HttpServletRequest request, Model model) throws Exception {
		// 한글파일명을 사용하기위해서는 서버의 인코딩방식을 utf-8로 바꿔야합니다.
		model.addAttribute("fileName", fileUploadServiceImpl.fileuplaod(request).get(0));
		return "view";
	}

	/**
	 * 이미지 view를 제공한다.
	 *
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/imageSrc.do", method = RequestMethod.GET)
	public void download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String subPath = ".";
		String physical = request.getParameter("physical");
		String mimeType = "image/"+EgovFileUploadUtil.getFileExtension(physical);
		
		String uploadDir = EgovProperties.getProperty("file.upload.path");
		String uploadFileTag = "_"+EgovProperties.getProperty("Globals.fileUpload.Tag");
		
		LOGGER.debug("===>>> physical = "+physical);
		LOGGER.debug("===>>> mimeType = "+mimeType);
		LOGGER.debug("===>>> uploadDir = "+uploadDir);
		LOGGER.debug("===>>> uploadFileTag = "+uploadFileTag);
		
		EgovFormBasedFileUtil.viewFile(response, uploadDir, subPath, physical + uploadFileTag, mimeType);
	}

}
