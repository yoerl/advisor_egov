
package egovframework.counseling.news.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

@Repository public class NewsDAO {
	

    @Resource(name = "newsMapper")
    private NewsMapper newsMapper;
    
    /**
     * 알림 목록 조회
     * @param newsVO
     * @return
     * @throws Exception
     */
    public List<NewsVO> selectNews(NewsVO newsVO) throws Exception {
    	
    	// 페이징 처리를 위한 목록 count
    	int newsCnt = newsMapper.selectNewsListCnt();
    	newsVO.getPagination().setTotalRecordCount(newsCnt);
    	
    	List<NewsVO> newss = newsMapper.selectNews(newsVO);
    	newss.get(0).setPagination(newsVO.getPagination());

    	return newss;
    
    }

    /**
     * 알림 상세조회
     * @param id
     * @return
     * @throws Exception
     */
	public NewsVO selectNewsOne(int id) throws Exception {
		NewsVO param = new NewsVO();
		param.setNewsSqno(id);
		return newsMapper.selectNewsOne(param);
	}

	/**
	 * 알림 읽음처리
	 * @param id
	 * @throws Exception
	 */
	public int updateNewsReadYn(int id) throws Exception {
		NewsVO param = new NewsVO();
		param.setNewsSqno(id);
		return newsMapper.updateNewsReadYn(param);
	}
	

}
