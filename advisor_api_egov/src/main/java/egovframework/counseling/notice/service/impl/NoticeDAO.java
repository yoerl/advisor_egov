package egovframework.counseling.notice.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Repository
public class NoticeDAO {


	private static final Logger logger = LogManager.getLogger(NoticeDAO.class);
	
    @Resource(name = "noticeMapper")
    private NoticeMapper noticeMapper;

    public List<NoticeVO> selectNoticeList(NoticeVO noticeVO) {
    	
    	// 페이징 처리를 위한 목록 count
    	int noticesCnt = noticeMapper.selectNoticeListCnt();
    	noticeVO.getPagination().setTotalRecordCount(noticesCnt);
    	
        List<NoticeVO> notices = noticeMapper.selectNotice(noticeVO);
        
        if(!notices.isEmpty())
        {
            notices.get(0).setPagination(noticeVO.getPagination());

            // 가져온 timestamp 값을 원하는 형식으로 변환
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            for (NoticeVO notice : notices) {
                Date timestamp = notice.getRgsnDttm(); // 이 부분은 NoticeVO 클래스에 따라서 변경될 수 있습니다.
                String formattedDate = dateFormat.format(timestamp);
                notice.setRgsnDttmStr(formattedDate); // 변환된 값을 NoticeVO 객체에 저장합니다.
            }
        }
        return notices;
    }
    

    public List<NoticeVO> selectNoticeOne(String id) {
        NoticeVO param = new NoticeVO();
        param.setNotiSqno(id);
        return noticeMapper.selectNoticeOne(param);
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean insertNoticeOne(NoticeVO noticeVO){
    	

        try {
            int rowsAffected = noticeMapper.insertNoticeOne(noticeVO);
            return rowsAffected > 0; // INSERT 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        }  catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("공지사항 입력 : ", e);
        }
        

		return false;
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean deleteNoticeOne(String id){
        try {

            NoticeVO param = new NoticeVO();
            param.setNotiSqno(id);
            int rowsAffected = noticeMapper.deleteNoticeOne(param);
            return rowsAffected > 0; // DELETE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("공지사항 삭제 : ", e);
        }
		return false;
    }
    
    @Transactional(rollbackFor = Exception.class)
    public boolean updateNoticeOne(NoticeVO noticeVO){
        try {
            int rowsAffected = noticeMapper.updateNoticeOne(noticeVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
        	logger.error("공지사항 수정 : ", e);
            // 예외 처리 로직 작성

        }
		return false;
    }





	

}
