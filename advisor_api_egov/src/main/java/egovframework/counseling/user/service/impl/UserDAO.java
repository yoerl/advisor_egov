package egovframework.counseling.user.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.Resource;
import java.util.List;

@Repository
public class UserDAO {
	
	private static final Logger logger = LogManager.getLogger(UserDAO.class);

    @Resource(name = "userMapper")
    private UserMapper userMapper;

    public List<UserInfoVO> selectUser(UserInfoVO userInfoVO){
    	
        return userMapper.selectUser(userInfoVO);
    }
    

    @Transactional(rollbackFor = Exception.class)
    public boolean updateConsStat(UserInfoVO userInfoVO){
    	
    	
        try {
            int rowsAffected = userMapper.updateConsStat(userInfoVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("통화 상태 변경 : ", e);
        }
		return false;
    }
    

    public List<UserInfoVO> selectUsers(UserInfoVO userInfoVO){
    	
        return userMapper.selectUsers(userInfoVO);
    }


}
