package egovframework.counseling.setting.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


@Repository
public class SettingDAO {


	private static final Logger logger = LogManager.getLogger(SettingDAO.class);
	
    @Resource(name = "settingMapper")
    private SettingMapper settingMapper;

    /**
     * 환경설정 정보 조회
     * @return
     * @throws Exception
     */
    public SettingVO selectSetting(SettingVO settingVO) {
    
        return settingMapper.selectSettingOne(settingVO);
    }
    

    /**
     * 폰트저장
     * @return
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean insetfont(SettingVO settingVO) {

        try {
            int rowsAffected = settingMapper.insertFont(settingVO);
            return rowsAffected > 0; // INSERT 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("폰트 입력 : ", e);
        }
        
        return false;
    }
    
    /**
     * 폰트 사이즈 저장
     * @return
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean insertFontSize(SettingVO settingVO) {
    	
    	try {
    		int rowsAffected = settingMapper.insertFontSize(settingVO);
    		return rowsAffected > 0; // INSERT 쿼리가 성공하면 true, 그렇지 않으면 false 반환
    	} catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("에러 : "+ e, e.toString());
        } catch (Exception e) {
    		// 예외 처리 로직 작성
        	logger.error("폰트사이즈 입력 : ", e);
    	}
    	
    	return false;
    }
    



}
