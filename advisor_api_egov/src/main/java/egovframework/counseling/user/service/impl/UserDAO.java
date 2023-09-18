package egovframework.counseling.user.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class UserDAO {

    @Resource(name = "userMapper")
    private UserMapper userMapper;

    public List<UserInfoVO> selectUser(UserInfoVO userInfoVO) throws Exception {
    	
    	System.out.println("입력" + userInfoVO.toString());
    	List<UserInfoVO> userInfoList = userMapper.selectUser(userInfoVO);

    	System.out.println("출력" + userInfoList.toString());
        return userInfoList;
    }
    

    public List<UserInfoVO> selectUsers(UserInfoVO userInfoVO) throws Exception {
    	
    	System.out.println("입력" + userInfoVO.toString());
    	List<UserInfoVO> userInfoList = userMapper.selectUsers(userInfoVO);

    	System.out.println("출력" + userInfoList.toString());
        return userInfoList;
    }

//    public List<NoticeVO> selectNoticeOne(String id) throws Exception {
//        NoticeVO param = new NoticeVO();
//        param.setNotiSqno(id);
//        return noticeMapper.selectNoticeOne(param);
//    }
//
//    @Transactional(rollbackFor = Exception.class)
//    public boolean insertNoticeOne(NoticeVO noticeVO) throws Exception {
//    	
//
//        try {
//            int rowsAffected = noticeMapper.insertNoticeOne(noticeVO);
//            return rowsAffected > 0; // INSERT 쿼리가 성공하면 true, 그렇지 않으면 false 반환
//        } catch (Exception e) {
//            // 예외 처리 로직 작성
//            e.printStackTrace();
//        }
//        
//
//		return false;
//    }
//
//    @Transactional(rollbackFor = Exception.class)
//    public boolean deleteNoticeOne(String id) throws Exception {
//        try {
//
//            NoticeVO param = new NoticeVO();
//            param.setNotiSqno(id);
//            int rowsAffected = noticeMapper.deleteNoticeOne(param);
//            return rowsAffected > 0; // DELETE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
//        } catch (Exception e) {
//            // 예외 처리 로직 작성
//            e.printStackTrace();
//            throw e; // 예외를 상위로 던집니다.
//        }
//    }
//    
//    @Transactional(rollbackFor = Exception.class)
//    public boolean updateNoticeOne(NoticeVO noticeVO) throws Exception {
//        try {
//            int rowsAffected = noticeMapper.updateNoticeOne(noticeVO);
//            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
//        } catch (Exception e) {
//            // 예외 처리 로직 작성
//            e.printStackTrace();
//            throw e; // 예외를 상위로 던집니다.
//        }
//    }

}
