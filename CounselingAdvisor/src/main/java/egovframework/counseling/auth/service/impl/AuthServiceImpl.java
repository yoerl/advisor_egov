/*
 * Copyright 2008-2009 the original author or authors.
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
package egovframework.counseling.auth.service.impl;

import java.util.List;


import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import egovframework.counseling.auth.service.AuthDTO;
import egovframework.counseling.auth.service.AuthService;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */


@Service("AuthService")
public class AuthServiceImpl extends EgovAbstractServiceImpl implements AuthService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AuthServiceImpl.class);
	
	@Override
	public AuthDTO loginSSO(AuthDTO vo) throws Exception {

		AuthDTO loginDTO = new AuthDTO();
		
		//TODO SSO솔루션 호출
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject("http://example.com", String.class);
        System.out.println(result);
        
		
		return loginDTO;
	}
	
	
	

}
