
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
	public List<NewsVO> selectNewss(NewsVO newsVo) {

		return newsDAO.selectNews(newsVo);

	}

	/**
	 * 알림 상세조회
	 */
	@Override
	public NewsVO selectNewsOne(int id) {
		
		NewsVO result = newsDAO.selectNewsOne(id);
		
		// 알림 읽음처리
		updateNewsReadYn(id);
		
		return result;
	}

	public int updateNewsReadYn(int id) {
		return newsDAO.updateNewsReadYn(id);
	}

	/**
	 * 알림 읽음처리
	 */
	@Override
	public boolean updateNewsRead(List<Integer> newsSqnoArry) {
		
		boolean result = false;
		int resultCnt = 0;
		for(int newsSqno : newsSqnoArry) {
			resultCnt += updateNewsReadYn(newsSqno);
		}
		
		if(resultCnt != 0) result = true;
		
		return result;
	}
	

	/**
	 * 알림 상세조회
	 */
	@Override
	public boolean insertNews(NewsVO newsVo) {
		
		return newsDAO.insertNews(newsVo);
	}
	

	/**
	 * 알림 상세조회
	 */
	@Override
	public int selectNewsNotReadCnt(NewsVO newsVo) {
		
		return newsDAO.selectNewsNotReadCnt(newsVo);
	}

	
	
	
	
	
	
 
 }
