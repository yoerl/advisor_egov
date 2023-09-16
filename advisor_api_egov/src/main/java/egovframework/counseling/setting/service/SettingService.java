package egovframework.counseling.setting.service;


import egovframework.counseling.setting.service.impl.SettingVO;


public interface SettingService {

	// 환경설정 조회
	public SettingVO selectSetting(SettingVO settingVO) throws Exception;
}
