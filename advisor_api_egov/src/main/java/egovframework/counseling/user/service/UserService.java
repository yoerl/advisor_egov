package egovframework.counseling.user.service;

import java.util.List;

import egovframework.counseling.notice.service.impl.NoticeVO;
import egovframework.counseling.user.service.impl.UserInfoVO;

public interface UserService {

	List<UserInfoVO> selectUser(UserInfoVO userInfoVO) throws Exception;

	List<UserInfoVO> selectUsers(UserInfoVO userInfoVO) throws Exception;
	
	

}
