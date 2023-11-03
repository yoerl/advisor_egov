package egovframework.counseling.user.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.user.service.UserService;

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {

	
  @Resource(name = "userDAO")
  private UserDAO userDAO;
	


	@Override
	public List<UserInfoVO> selectUser(UserInfoVO userInfoVO){

		return userDAO.selectUser(userInfoVO);
	}
	


	@Override
	public boolean updateConsStat(UserInfoVO userInfoVO) {
		
		return userDAO.updateConsStat(userInfoVO);
	}

	@Override
	public List<UserInfoVO> selectUsers(UserInfoVO userInfoVO) {

		return userDAO.selectUsers(userInfoVO);
	}
	
}
