
package egovframework.counseling.news.service.impl;

import org.springframework.stereotype.Repository; 
import org.springframework.transaction.annotation.Transactional;

import egovframework.counseling.notice.service.impl.NoticeMapper;
import egovframework.counseling.notice.service.impl.NoticeVO;

import javax.annotation.Resource;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Repository public class NewsDAO {
	

    @Resource(name = "newsMapper")
    private NewsMapper newsMapper;
    
    
    public List<NewsVO> selectNews(NewsVO param) throws Exception {

    	System.out.println("22222222");
    	 List<NewsVO> newss = newsMapper.selectNews();
    	System.out.println("33333");
    	
    	
  
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        for (NewsVO news : newss) {
            Date timestamp = news.getRgsnDttm(); // 이 부분은 NoticeVO 클래스에 따라서 변경될 수 있습니다.
            String formattedDate = dateFormat.format(timestamp);
            news.setRgsnDttmStr(formattedDate); // 변환된 값을 NoticeVO 객체에 저장합니다.
        }
        
        
    	 return newss;
    
    }

}
