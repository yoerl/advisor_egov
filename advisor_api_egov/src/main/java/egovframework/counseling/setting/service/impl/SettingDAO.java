package egovframework.counseling.setting.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import egovframework.counseling.notice.service.impl.NoticeVO;

import javax.annotation.Resource;

import java.util.List;

@Repository
public class SettingDAO {

    @Resource(name = "settingMapper")
    private SettingMapper settingMapper;

    /**
     * 환경설정 정보 조회
     * @return
     * @throws Exception
     */
    public SettingVO selectSetting(SettingVO settingVO) throws Exception {
        SettingVO setting = settingMapper.selectSettingOne(settingVO);

        return setting;
    }
    

    /**
     * 환경설정 정보 조회
     * @return
     * @throws Exception
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean insetfont(SettingVO settingVO) throws Exception {

        try {
            int rowsAffected = settingMapper.insertFont(settingVO);
            return rowsAffected > 0; // INSERT 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (Exception e) {
            // 예외 처리 로직 작성
            e.printStackTrace();
        }
        
        return false;
    }
    



}
