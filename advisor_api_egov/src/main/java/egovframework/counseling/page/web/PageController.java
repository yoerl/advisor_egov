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
package egovframework.counseling.page.web;

import java.util.List;

import egovframework.counseling.news.service.impl.NewsVO;
//import egovframework.advisor.counseling.auth.service.AuthDTO;
//import egovframework.advisor.counseling.auth.service.AuthService;
import egovframework.counseling.notice.service.impl.NoticeVO;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@GetMapping("/page/template.do")
	public String movePageTemplate(ModelMap model) throws Exception {
		return "template";
	}
	@GetMapping("/page/home.do")
	public String movePageHome(ModelMap model) throws Exception {
		return "main/page_home";
	}
	
	@GetMapping("/page/summary.do")
	public String movePageSummary(ModelMap model) throws Exception {
		return "main/page_summary";
	}
	

	@GetMapping("/page/history.do")
	public String movePageHistory(ModelMap model) throws Exception {
		return "main/page_history";
	}
	
	@GetMapping("/page/history_popup.do")
	public String movePageHistoryPopup(ModelMap model) throws Exception {
		return "main/page_history_popup";
	}

	@GetMapping("/page/setting.do")
	public String movePageSetting(ModelMap model) throws Exception {
		return "main/page_setting";
	}
	

	@GetMapping("/page/setting_font.do")
	public String movePageSettingFont(ModelMap model) throws Exception {
		return "main/page_setting_font";
	}
	

	@GetMapping("/page/setting_my.do")
	public String movePageSettingMy(ModelMap model) throws Exception {
		return "main/page_setting_my";
	}
	
	

	@GetMapping("/page/setting_size.do")
	public String movePageSettingSize(ModelMap model) throws Exception {
		return "main/page_setting_size";
	}
	@GetMapping("/page/setting_system.do")
	public String movePageSettingSystem(ModelMap model) throws Exception {
		return "main/page_setting_system";
	}
	
	@GetMapping("/page/monitoring.do")
	public String movePageMonitoring(ModelMap model) throws Exception {
		return "main/page_monitoring";
	}
	
	@GetMapping("/page/authority.do")
	public String movePageAuthority(ModelMap model) throws Exception {
		return "main/page_authority";
	}

	@GetMapping("/page/authority_setting.do")
	public String moveAuthoritySetting(ModelMap model) throws Exception {
		return "main/page_authority_setting";
	}

	@GetMapping("/page/authority_group.do")
	public String moveAuthorityGroup(ModelMap model) throws Exception {
		return "main/page_authority_group";
	}

	@GetMapping("/page/summary_view.do")
	public String moveSummaryView(ModelMap model) throws Exception {
		return "main/page_summary_view";
	}
	
	@GetMapping("/page/summary_modify.do")
	public String moveSummaryModify(ModelMap model) throws Exception {
		return "main/page_summary_modify";
	}
	
	@GetMapping("/page/notice.do")
	public String moveNotice(ModelMap model) throws Exception {
		return "main/page_notice";
	}

	@GetMapping("/page/news.do")
	public String moveNews(ModelMap model) throws Exception {
		return "main/page_news";
	}
	@GetMapping("/page/ranking.do")
	public String moveRanking(ModelMap model) throws Exception {
		return "main/page_ranking";
	}

	@GetMapping("/page/news_write.do")
	public String moveNewswrite(ModelMap model) throws Exception {
		return "main/page_news_write";
	}

	@GetMapping("/page/monitoring_popup.do")
	public String moveMonitoringPopup(ModelMap model) throws Exception {
		return "main/page_monitoring_popup";
	}
	

	@GetMapping("/page/news_view.do")
	public String moveNewsView(@ModelAttribute("NewsVO") NewsVO newsVO, ModelMap model) throws Exception {
		model.addAttribute("newsVO", newsVO);
		return "main/page_news_view";
	}

	@GetMapping("/page/notice_view.do")
	public String moveNoticeView(@ModelAttribute("NoticeVo") NoticeVO noticeVO, ModelMap model) throws Exception {


        model.addAttribute("noticeInfo", noticeVO);
		return "main/page_notice_view";
	}

	@GetMapping("/page/news_modify.do")
	public String moveNewsModify(@ModelAttribute("NoticeVo") NoticeVO noticeVO, ModelMap model) throws Exception {

        model.addAttribute("noticeInfo", noticeVO);
		return "main/page_news_modify";
	}
	

	@GetMapping("/page/notice_modify.do")
	public String moveNoticeModify(@ModelAttribute("NoticeVo") NoticeVO noticeVO, ModelMap model) throws Exception {

        model.addAttribute("noticeInfo", noticeVO);
		return "main/page_notice_modify";
	}
	
	
	@GetMapping("/page/notice_write.do")
	public String moveNoticeWrite() throws Exception {
		return "main/page_notice_write";
	}
	


}
