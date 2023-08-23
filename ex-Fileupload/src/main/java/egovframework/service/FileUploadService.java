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

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * 파일업로드에 관한 인터페이스 클래스를 정의한다.
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
public interface FileUploadService {
	
	/**
	 * 파일을 업로드한다.
	 * @param request
	 * @return List<String>
	 * @throws Exception
	 */
	public List<String> fileuplaod(HttpServletRequest request) throws Exception;
	
}
