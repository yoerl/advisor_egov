package egovframework.counseling.user.service;

import java.util.List;

import egovframework.counseling.user.service.impl.UserInfoVO;

public interface UserService {

	List<UserInfoVO> selectUser(UserInfoVO userInfoVO);

	List<UserInfoVO> selectUsers(UserInfoVO userInfoVO);


	boolean updateConsStat(UserInfoVO userInfoVO);
	
	

}
