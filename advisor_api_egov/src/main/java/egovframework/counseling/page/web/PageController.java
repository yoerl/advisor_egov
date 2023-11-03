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

import egovframework.counseling.news.service.NewsService;
import egovframework.counseling.notice.service.impl.NoticeVO;
import egovframework.counseling.remote.service.impl.SummaryVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;


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

	private static final String NOTICE_INFO = "noticeInfo";
	
	
	/** EgovSampleService */
	@Resource(name = "newsService")
	private NewsService newsService;

	
	@GetMapping("/api/login/check.do")
	public String moveLoginckeck(HttpServletRequest request){

		
	    return "main/page_login";
	}
	
	
	
	@GetMapping("/api/page/login.do")
	public String moveLogin(HttpServletRequest request){

		
	    return "main/page_login";
	}
	
	
	
	@GetMapping("/page/summary.do")
	public String movePageSummary(ModelMap model)  {
		return "main/page_summary";
	}
	

	
	
	
	
	
	
	
	@GetMapping("/page/history.do")
	public String movePageHistory(ModelMap model) {
		return "main/page_history";
	}
	

	@GetMapping("/page/answer.do")
	public String moveAnwer(ModelMap model) {
		return "main/page_answer";
	}
	
	@GetMapping("/page/history_popup.do")
	public String movePageHistoryPopup(@RequestParam("call_id") String callId, ModelMap model) {
		model.addAttribute("callId", callId);
		return "main/page_history_popup";
	}
	
	

	@GetMapping("/page/setting.do")
	public String movePageSetting(ModelMap model) {
		return "main/page_setting";
	}
	

	@GetMapping("/page/setting_font.do")
	public String movePageSettingFont(ModelMap model) {
		return "main/page_setting_font";
	}
	

	@GetMapping("/page/setting_my.do")
	public String movePageSettingMy(ModelMap model) {
		return "main/page_setting_my";
	}
	
	

	@GetMapping("/page/setting_size.do")
	public String movePageSettingSize(ModelMap model) {
		return "main/page_setting_size";
	}
	@GetMapping("/page/setting_system.do")
	public String movePageSettingSystem(ModelMap model) {
		return "main/page_setting_system";
	}
	
	@GetMapping("/page/monitoring.do")
	public String movePageMonitoring(ModelMap model) {
		return "main/page_monitoring";
	}
	
	@GetMapping("/page/authority.do")
	public String movePageAuthority(ModelMap model){
		return "main/page_authority";
	}

	@GetMapping("/page/authority_setting.do")
	public String moveAuthoritySetting(ModelMap model) {
		return "main/page_authority_setting";
	}

	@GetMapping("/page/authority_group.do")
	public String moveAuthorityGroup(ModelMap model) {
		return "main/page_authority_group";
	}

	@GetMapping("/page/summary_view.do")
	public String moveSummaryView(@ModelAttribute("SummaryVO") SummaryVO summaryVO, ModelMap model) {

        model.addAttribute("summaryVO", summaryVO);
		return "main/page_summary_view";
	}
	

	
	
	
	@GetMapping("/page/summary_modify.do")
	public String moveSummaryModify(ModelMap model) {
		return "main/page_summary_modify";
	}
	
	@GetMapping("/page/notice.do")
	public String moveNotice(ModelMap model)  {
		return "main/page_notice";
	}

	@GetMapping("/page/news.do")
	public String moveNews(ModelMap model) {
		return "main/page_news";
	}
	@GetMapping("/page/ranking.do")
	public String moveRanking(ModelMap model) {
		return "main/page_ranking";
	}

	@GetMapping("/page/news_write.do")
	public String moveNewswrite(ModelMap model) {
		return "main/page_news_write";
	}

	@GetMapping("/page/monitoring_popup.do")
	public String moveMonitoringPopup(@RequestParam("user_id") String userId, ModelMap model) {
		
		model.addAttribute("userId", userId);
		
		return "main/page_monitoring_popup";
	}
	

	@GetMapping("/page/news_view.do")
	public String moveNewsView(ModelMap model) {
		return "main/page_news_view";
	}

	@GetMapping("/page/notice_view.do")
	public String moveNoticeView(@ModelAttribute("NoticeVo") NoticeVO noticeVO, ModelMap model) {


        model.addAttribute(NOTICE_INFO, noticeVO);
		return "main/page_notice_view";
	}

	@GetMapping("/page/news_modify.do")
	public String moveNewsModify(@ModelAttribute("NoticeVo") NoticeVO noticeVO, ModelMap model)  {

        model.addAttribute(NOTICE_INFO, noticeVO);
		return "main/page_news_modify";
	}
	

	@GetMapping("/page/notice_modify.do")
	public String moveNoticeModify(@ModelAttribute("NoticeVo") NoticeVO noticeVO, ModelMap model)  {

        model.addAttribute(NOTICE_INFO, noticeVO);
		return "main/page_notice_modify";
	}
	

	@GetMapping("/page/notice_write.do")
	public String moveNoticeWrite()  {
		return "main/page_notice_write";
	}
	

	@GetMapping("/page/spa.do")
	public String moveSPA() {
		return "main/page_spa";
	}
	



	@GetMapping("/page/home.do")
	public String movePageHome(ModelMap model) {
		

		return "main/page_spa";
	}
}
