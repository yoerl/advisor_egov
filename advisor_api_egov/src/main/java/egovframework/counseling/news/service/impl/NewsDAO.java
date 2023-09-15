
package egovframework.counseling.news.service.impl;

import org.springframework.stereotype.Repository; import
org.springframework.transaction.annotation.Transactional;

import egovframework.counseling.notice.service.impl.NoticeMapper;
import egovframework.counseling.notice.service.impl.NoticeVO;

import javax.annotation.Resource; import java.util.List;

@Repository public class NewsDAO {
	

    @Resource(name = "newsMapper")
    private NewsMapper newsMapper;
    
    
    public List<NewsVO> selectNews(NewsVO param) throws Exception {

    	System.out.println("22222222");
    	 List<NewsVO> result = newsMapper.selectNews();
    	System.out.println("33333");
    	
    	 return result;
    
    }

}
