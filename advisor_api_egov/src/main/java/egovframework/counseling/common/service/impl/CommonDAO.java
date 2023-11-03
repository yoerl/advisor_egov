package egovframework.counseling.common.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.Resource;
import java.util.List;

@Repository
public class CommonDAO {


	private static final Logger logger = LogManager.getLogger(CommonDAO.class);
	@Resource(name = "commonMapper")
	private CommonMapper commonMapper;

	public List<CommonVO> selectAgencyList() {
		return commonMapper.selectAgency();
	}
	

	public List<CommonVO> selectCommonData(CommonVO commonVO) {
		
		return commonMapper.selectCommonData(commonVO);
	}
	
	

	public List<CommonVO> selectSystemChkAuth(CommonVO commonVO) {
		
		return commonMapper.selectSystemChkAuth(commonVO);
	}
	

	public List<CommonVO> selectAuthMenu(CommonVO commonVO) {

		
		commonVO.setComnCd("menu_"+commonVO.getComnCd());
	
		return commonMapper.selectAuthMenu(commonVO);
		
	}
	
	@Transactional(rollbackFor = Exception.class)
    public boolean updateSystemChkAuth(CommonVO commonVO) {
        try {
            int rowsAffected = commonMapper.updateSystemChkAuth(commonVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {

        	logger.error("에러 : "+ e, e.toString());
        }
		return false;
    }

	
    @Transactional(rollbackFor = Exception.class)
    public boolean updateMunuAuth(CommonVO commonVO) {
        try {
            int rowsAffected = commonMapper.updateMunuAuth(commonVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성

        	logger.error("에러 : "+ e, e.toString());
        }
		return false;
    }

	

	
    @Transactional(rollbackFor = Exception.class)
    public boolean updateChatBotOne(ChatbotVO chatbotVO) {
        try {
            int rowsAffected = commonMapper.updateChatBotOne(chatbotVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        }
		return false;
    }
    

	
    @Transactional(rollbackFor = Exception.class)
    public boolean updateChatBotGrop(ChatbotVO chatbotVO) {
        try {
            int rowsAffected = commonMapper.updateChatBotGrop(chatbotVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        }
		return false;
    }

    
	
}
