
 package egovframework.counseling.news.service.impl;
 
 import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
 
 
 @Mapper("newsMapper") 
 public interface NewsMapper {
 
 
	 public List<NewsVO> selectNews(NewsVO newsVO) throws Exception;

	 public int selectNewsListCnt() throws Exception;

	 public NewsVO selectNewsOne(NewsVO param) throws Exception;

	 public int updateNewsReadYn(NewsVO param) throws Exception;
 }
