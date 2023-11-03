
package egovframework.counseling.news.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository public class NewsDAO {
	

	private static final Logger logger = LogManager.getLogger(NewsDAO.class);
	
    @Resource(name = "newsMapper")
    private NewsMapper newsMapper;
    
    /**
     * 알림 목록 조회
     * @param newsVO
     * @return
     * @throws Exception
     */
    public List<NewsVO> selectNews(NewsVO newsVO){
    	List<NewsVO> newss = null;

        try {
        	// 페이징 처리를 위한 목록 count
        	int newsCnt = newsMapper.selectNewsListCnt(newsVO);

        	newsVO.getPagination().setTotalRecordCount(newsCnt);

        	newss = newsMapper.selectNews(newsVO);
        	newss.get(0).setPagination(newsVO.getPagination());
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("알림조회 : ", e);
        }
        

    	return newss;
    
    }

    /**
     * 알림 상세조회
     * @param id
     * @return
     * @throws Exception
     */
	public NewsVO selectNewsOne(int id) {
		NewsVO param = new NewsVO();
		param.setNewsSqno(id);
		return newsMapper.selectNewsOne(param);
	}

	/**
	 * 알림 읽음처리
	 * @param id
	 * @throws Exception
	 */
	public int updateNewsReadYn(int id){
		NewsVO param = new NewsVO();
		param.setNewsSqno(id);
		return newsMapper.updateNewsReadYn(param);
	}
	
	/**
	 * 알림 읽음처리
	 * @param id
	 * @throws Exception
	 */
	public int selectNewsNotReadCnt(NewsVO newsVo){
		return newsMapper.selectNewsNotReadCnt(newsVo);
	}
	
	
    @Transactional(rollbackFor = Exception.class)
    public boolean insertNews(NewsVO newsVO) {
    	

        try {
            int rowsAffected = newsMapper.insertNews(newsVO);
            return rowsAffected > 0; // INSERT 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("알림 입 : ", e);
        }
        

		return false;
    }


}
