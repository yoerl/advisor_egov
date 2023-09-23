
 package egovframework.counseling.news.service;

import java.util.List;

import egovframework.counseling.news.service.impl.NewsVO;

 public interface NewsService {
 
	 List<NewsVO> selectNewss(NewsVO newsVo) throws Exception;
	 
	 NewsVO selectNewsOne(int id) throws Exception;

	boolean updateNewsRead(List<Integer> newsSqnoArry) throws Exception;

}