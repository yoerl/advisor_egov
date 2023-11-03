
 package egovframework.counseling.news.service.impl;
 
 import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
 
 
 @Mapper("newsMapper") 
 public interface NewsMapper {
 
 
	 public List<NewsVO> selectNews(NewsVO newsVO);

	 public int selectNewsListCnt(NewsVO param);
	 
	 public int selectNewsNotReadCnt(NewsVO param);

	 public NewsVO selectNewsOne(NewsVO param);

	 public int updateNewsReadYn(NewsVO param);
	 
	 
	 public int insertNews(NewsVO param);
	 
	 
 }
