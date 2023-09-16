package egovframework.counseling.setting.service.impl;

import org.springframework.stereotype.Repository;

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


}
