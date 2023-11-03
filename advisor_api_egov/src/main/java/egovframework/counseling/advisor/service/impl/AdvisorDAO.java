
package egovframework.counseling.advisor.service.impl;


import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository public class AdvisorDAO {

	private static final Logger logger = LogManager.getLogger(AdvisorDAO.class);

    @Resource(name = "advisorMapper")
    private AdvisorMapper advisorMapper;


    @Transactional(rollbackFor = Exception.class)
    public boolean updateSummary(AdvisorDTO advisorDTO) {
    	

        try {
            int rowsAffected = advisorMapper.updateSummary(advisorDTO);
            return rowsAffected > 0; // INSERT 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("요약 수정 : ", e);
        	
        }
        

		return false;
    }
    


    @Transactional(rollbackFor = Exception.class)
    public boolean updateAiRplyHist(AdvisorDTO advisorDTO) {
    	

        try {
            int rowsAffected = advisorMapper.updateAiRplyHist(advisorDTO);
            return rowsAffected > 0; // INSERT 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("요약 수정 : ", e);
        	
        }
        

		return false;
    }
    


    @Transactional(rollbackFor = Exception.class)
    public boolean updateKmsRply(AdvisorDTO advisorDTO) {
    	

        try {
            int rowsAffected = advisorMapper.updateKmsRply(advisorDTO);
            return rowsAffected > 0; // INSERT 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("요약 수정 : ", e);
        	
        }
        

		return false;
    }
    
    
	

}
