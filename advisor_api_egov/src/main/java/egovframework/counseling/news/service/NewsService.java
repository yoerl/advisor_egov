
 package egovframework.counseling.news.service;

import java.util.List;

import egovframework.counseling.news.service.impl.NewsVO;

 public interface NewsService {
 
	 List<NewsVO> selectNewss(NewsVO newsVo);
	 
	 NewsVO selectNewsOne(int id);

	boolean updateNewsRead(List<Integer> newsSqnoArry);

	/**
	 * 알림 상세조회
	 */
	boolean insertNews(NewsVO newsVo);

	/**
	 * 알림 상세조회
	 */
	int selectNewsNotReadCnt(NewsVO newsVo);

}