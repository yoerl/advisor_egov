
 package egovframework.counseling.news.service;

import java.util.List;

import egovframework.counseling.news.service.impl.NewsVO; import
egovframework.counseling.notice.service.impl.NoticeVO;

 public interface NewsService {
 
		/*
		 * List<NoticeVO> selectNewsOne(String id);
		 * 
		 * boolean readNews(String id);
		 */

List<NewsVO> selectNewss(NewsVO newsVo) throws Exception;



}