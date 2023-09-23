
 package egovframework.counseling.news.service.impl;
 
 
 import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.news.service.NewsService;

 
@Service("newsService")
public class NewsServiceImpl extends EgovAbstractServiceImpl implements NewsService {


@Resource(name = "newsDAO")
private NewsDAO newsDAO;

	
	/**
	 * 알림 목록조회
	 */
	@Override
	public List<NewsVO> selectNewss(NewsVO newsVo) throws Exception  {
		return newsDAO.selectNews(newsVo);
	}

	/**
	 * 알림 상세조회
	 */
	@Override
	public NewsVO selectNewsOne(int id) throws Exception {
		
		NewsVO result = newsDAO.selectNewsOne(id);
		
		// 알림 읽음처리
		updateNewsReadYn(id);
		
		return result;
	}

	public int updateNewsReadYn(int id) throws Exception {
		return newsDAO.updateNewsReadYn(id);
	}

	/**
	 * 알림 읽음처리
	 */
	@Override
	public boolean updateNewsRead(List<Integer> newsSqnoArry) throws Exception {
		
		boolean result = false;
		int resultCnt = 0;
		for(int newsSqno : newsSqnoArry) {
			resultCnt += updateNewsReadYn(newsSqno);
		}
		
		if(resultCnt != 0) result = true;
		
		return result;
	}
 
 
 
 }
