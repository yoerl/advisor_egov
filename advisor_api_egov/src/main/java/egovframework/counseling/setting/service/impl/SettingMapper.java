package egovframework.counseling.setting.service.impl;


import org.egovframe.rte.psl.dataaccess.mapper.Mapper;


@Mapper("settingMapper")
public interface SettingMapper  {

	//환경설정 정보 조회
    public SettingVO selectSettingOne(SettingVO settingVO) throws Exception;

	public int insertFont(SettingVO settingVO) throws Exception;
	
	public int insertFontSize(SettingVO settingVO) throws Exception;
}
