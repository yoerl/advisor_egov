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
package egovframework.counseling.common.web;

import java.util.List;

//import egovframework.advisor.counseling.auth.service.AuthDTO;
//import egovframework.advisor.counseling.auth.service.AuthService;
import egovframework.example.sample.service.EgovSampleService;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
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

@Controller
public class PageController {


	@RequestMapping(value = "/page/home.do", method = RequestMethod.GET)
	public String movePageHome(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_home";
	}
	
	@RequestMapping(value = "/page/summary.do", method = RequestMethod.GET)
	public String movePageSummary(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_summary";
	}
	
	
	@RequestMapping(value = "/page/history.do", method = RequestMethod.GET)
	public String movePageHistory(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_history";
	}

	@RequestMapping(value = "/page/setting.do", method = RequestMethod.GET)
	public String movePageSetting(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_setting";
	}
	

	@RequestMapping(value = "/page/setting_font.do", method = RequestMethod.GET)
	public String movePageSettingFont(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_setting_font";
	}
	

	@RequestMapping(value = "/page/setting_my.do", method = RequestMethod.GET)
	public String movePageSettingMy(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_setting_my";
	}
	
	

	@RequestMapping(value = "/page/setting_size.do", method = RequestMethod.GET)
	public String movePageSettingSize(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_setting_size";
	}
	@RequestMapping(value = "/page/setting_system.do", method = RequestMethod.GET)
	public String movePageSettingSystem(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_setting_system";
	}
	
	@RequestMapping(value = "/page/monitoring.do", method = RequestMethod.GET)
	public String movePageMonitoring(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_monitoring";
	}
	
	@RequestMapping(value = "/page/authority.do", method = RequestMethod.GET)
	public String movePageAuthority(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_authority";
	}

	@RequestMapping(value = "/page/authority_setting.do", method = RequestMethod.GET)
	public String moveAuthoritySetting(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_authority_setting";
	}

	@RequestMapping(value = "/page/authority_group.do", method = RequestMethod.GET)
	public String moveAuthorityGroup(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_authority_group";
	}

	@RequestMapping(value = "/page/summary_view.do", method = RequestMethod.GET)
	public String moveSummaryView(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_summary_view";
	}
	
	@RequestMapping(value = "/page/summary_modify.do", method = RequestMethod.GET)
	public String moveSummaryModify(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_summary_modify";
	}

	
	
	@RequestMapping(value = "/page/notice.do", method = RequestMethod.GET)
	public String moveNotice(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_notice";
	}

	@RequestMapping(value = "/page/news.do", method = RequestMethod.GET)
	public String moveNews(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_news";
	}
	@RequestMapping(value = "/page/ranking.do", method = RequestMethod.GET)
	public String moveRanking(@ModelAttribute("searchVO") SampleVO loginVO, ModelMap model) throws Exception {
		return "main/page_ranking";
	}
	

	

	
}
