
 package egovframework.counseling.news.service.impl;
 
 import java.util.List;
 
 import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
 
 
 @Mapper("newsMapper") 
 public interface NewsMapper {
 
 
 public List<NewsVO> selectNews() throws Exception;
 
 
 }
