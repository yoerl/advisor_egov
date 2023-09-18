package egovframework.counseling.user.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.notice.service.NoticeService;
import egovframework.counseling.user.service.UserService;

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {

  @Resource(name = "userDAO")
  private UserDAO userDAO;
	


	@Override
	public List<UserInfoVO> selectUser(UserInfoVO userInfoVO) throws Exception {

		System.out.println("22222" + userInfoVO.toString());
		List<UserInfoVO> userInfoVOList = userDAO.selectUser(userInfoVO);
		System.out.println("22222" + userInfoVO.toString());
		return userInfoVOList;
	}

	@Override
	public List<UserInfoVO> selectUsers(UserInfoVO userInfoVO) throws Exception {

		List<UserInfoVO> userInfoVOList = userDAO.selectUsers(userInfoVO);
		return userInfoVOList;
	}
	
//	
//	@Override
//	public List<NoticeVO> selectNoticeOne(String id) throws Exception {
//
//
//		List<NoticeVO> noticeInfo = noticeDAO.selectNoticeOne(id);
//
//		return noticeInfo;
//	}
//	
//
//	@Override
//	public boolean insertNoticeOne(NoticeVO noticeVO) throws Exception{
//		
//		boolean result = noticeDAO.insertNoticeOne(noticeVO);
//		
//		return result;
//	
//	}
//	
//
//	@Override
//	public boolean deleteNoticeOne(String id) throws Exception{
//		
//		boolean result = noticeDAO.deleteNoticeOne(id);
//		
//		return result;
//	
//	}
//
//    // 공지사항을 수정하는 메서드를 추가합니다.
//    public boolean updateNoticeOne(NoticeVO noticeVO) throws Exception {
//        boolean result = noticeDAO.updateNoticeOne(noticeVO);
//        return result;
//    }

}
