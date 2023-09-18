
 package egovframework.counseling.news.service.impl;
 
 
 import java.util.List;
 
 import javax.annotation.Resource;
 
 import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl; 
 import org.springframework.stereotype.Service;

import egovframework.counseling.news.service.NewsService;
import egovframework.counseling.notice.service.impl.NoticeDAO;

 
@Service("newsService")
public class NewsServiceImpl extends EgovAbstractServiceImpl implements NewsService {


@Resource(name = "newsDAO")
private NewsDAO newsDAO;


	@Override
	public List<NewsVO> selectNewss(NewsVO newsVo) throws Exception  {
		
		List<NewsVO> result = newsDAO.selectNews(newsVo);
		
		
		// TODO Auto-generated method stub
		return result;
	}
		 
 
 
 
 }
