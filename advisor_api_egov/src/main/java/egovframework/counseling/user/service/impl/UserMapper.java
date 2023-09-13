package egovframework.counseling.user.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;


@Mapper("userMapper")
public interface UserMapper  {


    public List<UserInfoVO> selectUser(UserInfoVO userInfoVO) throws Exception;

    public List<UserInfoVO> selectUsers(UserInfoVO userInfoVO) throws Exception;
}
