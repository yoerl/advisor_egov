package egovframework.counseling.setting.service;


import egovframework.counseling.setting.service.impl.SettingVO;


public interface SettingService {

	// 환경설정 조회
	public SettingVO selectSetting(SettingVO settingVO) throws Exception;

	// 환경설정 조회
	public boolean inserfont(SettingVO settingVO) throws Exception;
	
	// 폰트사이즈 등록
	public boolean insertFontSize(SettingVO settingVO) throws Exception;
	
}
