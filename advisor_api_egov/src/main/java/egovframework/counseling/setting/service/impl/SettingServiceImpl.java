package egovframework.counseling.setting.service.impl;


import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.counseling.notice.service.impl.NoticeVO;
import egovframework.counseling.setting.service.SettingService;

@Service("settingService")
public class SettingServiceImpl extends EgovAbstractServiceImpl implements SettingService {

   @Resource(name = "settingDAO")
   private SettingDAO settingDAO;
   
   /**
    * 환경설정 조회
    */
   @Override
   public SettingVO selectSetting(SettingVO settingVO) throws Exception {
	   return settingDAO.selectSetting(settingVO);
   }
   
   
   @Transactional(rollbackFor = Exception.class)
   public boolean inserfont(SettingVO settingVO) throws Exception {
	   boolean result = settingDAO.insetfont(settingVO);
	   
	   return result;
   }
   
   /**
    * 폰트사이즈 등록
    */
   @Transactional(rollbackFor = Exception.class)
   public boolean insertFontSize(SettingVO settingVO) throws Exception {
	   boolean result = settingDAO.insertFontSize(settingVO);
	   
	   return result;
   }
   
   
	
	
	
   
}
