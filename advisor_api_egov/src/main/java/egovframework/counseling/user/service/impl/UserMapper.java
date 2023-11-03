package egovframework.counseling.user.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;


@Mapper("userMapper")
public interface UserMapper  {


    public List<UserInfoVO> selectUser(UserInfoVO userInfoVO);

    public List<UserInfoVO> selectUsers(UserInfoVO userInfoVO);
    

    public int updateConsStat(UserInfoVO userInfoVO);
}
