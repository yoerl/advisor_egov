///*
// * Copyright 2008-2009 the original author or authors.
// *
// * Licensed under the Apache License, Version 2.0 (the "License");
// * you may not use this file except in compliance with the License.
// * You may obtain a copy of the License at
// *
// *      http://www.apache.org/licenses/LICENSE-2.0
// *
// * Unless required by applicable law or agreed to in writing, software
// * distributed under the License is distributed on an "AS IS" BASIS,
// * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// * See the License for the specific language governing permissions and
// * limitations under the License.
// */
//package egovframework.counseling.api.web;
//
//import java.util.List;
//
////import egovframework.advisor.counseling.auth.service.AuthDTO;
////import egovframework.advisor.counseling.auth.service.AuthService;
//import egovframework.example.sample.service.EgovSampleService;
//import egovframework.example.sample.service.SampleDefaultVO;
//import egovframework.example.sample.service.SampleVO;
//
//import org.egovframe.rte.fdl.property.EgovPropertyService;
//import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
//
//import javax.annotation.Resource;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.ui.ModelMap;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.support.SessionStatus;
//import org.springmodules.validation.commons.DefaultBeanValidator;
//
///**
// * @Class Name : EgovSampleController.java
// * @Description : EgovSample Controller Class
// * @Modification Information
// * @
// * @  수정일      수정자              수정내용
// * @ ---------   ---------   -------------------------------
// * @ 2009.03.16           최초생성
// *
// * @author 개발프레임웍크 실행환경 개발팀
// * @since 2009. 03.16
// * @version 1.0
// * @see
// *
// *  Copyright (C) by MOPAS All right reserved.
// */
//
//@Controller
//public class ApiController {
//
//	/**
//	 * 글 목록을 조회한다. (pageing)
//	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
//	 * @param model
//	 * @return "egovSampleList"
//	 * @exception Exception
//	 */
//	@RequestMapping(value = "/api.do", method = RequestMethod.GET)
//	public String authenticateUser(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
//
//		String id = loginVO.getId();
//		String password = "";
//		
//		boolean loginSucess = false;
//		
//		if(loginSucess)
//		{
////			model.addAttribute("paginationInfo", paginationInfo);
//			return "main/page_home";
//		}
//		else
//		{
////			model.addAttribute("paginationInfo", paginationInfo);
//			return "main/page_login";
//		}
//	}
//
//
//}
