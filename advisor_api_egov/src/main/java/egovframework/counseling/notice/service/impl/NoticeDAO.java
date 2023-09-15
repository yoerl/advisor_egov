package egovframework.counseling.notice.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Repository
public class NoticeDAO {

    @Resource(name = "noticeMapper")
    private NoticeMapper noticeMapper;

    public List<NoticeVO> selectNoticeList() throws Exception {
        List<NoticeVO> notices = noticeMapper.selectNotice();

        // 가져온 timestamp 값을 원하는 형식으로 변환
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (NoticeVO notice : notices) {
            Date timestamp = notice.getRgsnDttm(); // 이 부분은 NoticeVO 클래스에 따라서 변경될 수 있습니다.
            String formattedDate = dateFormat.format(timestamp);
            notice.setRgsnDttmStr(formattedDate); // 변환된 값을 NoticeVO 객체에 저장합니다.
        }

        return notices;
    }


    
    public List<NoticeVO> selectNoticeOne(String id) throws Exception {
        NoticeVO param = new NoticeVO();
        param.setNotiSqno(id);
        return noticeMapper.selectNoticeOne(param);
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean insertNoticeOne(NoticeVO noticeVO) throws Exception {
    	

        try {
            int rowsAffected = noticeMapper.insertNoticeOne(noticeVO);
            return rowsAffected > 0; // INSERT 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (Exception e) {
            // 예외 처리 로직 작성
            e.printStackTrace();
        }
        

		return false;
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean deleteNoticeOne(String id) throws Exception {
        try {

            NoticeVO param = new NoticeVO();
            param.setNotiSqno(id);
            int rowsAffected = noticeMapper.deleteNoticeOne(param);
            return rowsAffected > 0; // DELETE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (Exception e) {
            // 예외 처리 로직 작성
            e.printStackTrace();
            throw e; // 예외를 상위로 던집니다.
        }
    }
    
    @Transactional(rollbackFor = Exception.class)
    public boolean updateNoticeOne(NoticeVO noticeVO) throws Exception {
        try {
            int rowsAffected = noticeMapper.updateNoticeOne(noticeVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (Exception e) {
            // 예외 처리 로직 작성
            e.printStackTrace();
            throw e; // 예외를 상위로 던집니다.
        }
    }

}
