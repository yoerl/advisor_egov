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
package egovframework.service;

import java.io.File;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 파일업로드에 관한 비지니스 클래스를 정의한다.
 * @author 실행환경 개발팀 이영진
 * @since 2011.07.11
 * @version 1.0
 * @see 
 * <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.07.11  이영진          최초 생성
 * 
 * </pre>
 */
@Service("fileUploadService")
public class FileUploadServiceImpl extends EgovAbstractServiceImpl  implements FileUploadService {

	@Resource(name = "fileUploadProperties")
	Properties fileuploadProperties;
	
	/**
	 * 파일을 업로드 한다.
	 * @param request
	 * @return List<String> 파일명리스트 
	 * @throws Exception
	 */
	public List<String> fileuplaod(HttpServletRequest request) throws Exception{
		final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

		// extract files
		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		// process files
		String uploadLastPath = fileuploadProperties.getProperty("file.upload.path");
		String uploadFileTag = "_"+fileuploadProperties.getProperty("Globals.fileUpload.Tag");
		String uploadPath = uploadLastPath;
		File saveFolder = new File(uploadPath);
		String fileName = null;
		List<String> result = new ArrayList<String>();
		// 디렉토리 생성
		boolean isDir = false;

		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.mkdirs();
		}

		if (!isDir) {

			Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
			MultipartFile file;
			String filePath;

			while (itr.hasNext()) {

				Entry<String, MultipartFile> entry = itr.next();
				file = entry.getValue();
				fileName = file.getOriginalFilename();
				if (!"".equals(fileName)) {

					// macOS 한글 풀어쓰기 => 모아쓰기 처리
					// UTF-8 NFD => NFC 처리
					// ex) ㅅㅡㅋㅡㄹㅣㄴ.txt => 스크린.txt
					fileName = Normalizer.normalize(fileName, Normalizer.Form.NFC);
					
					// 파일 전송
					filePath = uploadPath + File.separator + fileName + uploadFileTag;
					System.out.println("1111111111111111111111");
					System.out.println(filePath);
					System.out.println("2222222222222222222222");
					file.transferTo(new File(filePath));
					result.add(fileName);
				}
			}
		}
		return result;
	}
}
