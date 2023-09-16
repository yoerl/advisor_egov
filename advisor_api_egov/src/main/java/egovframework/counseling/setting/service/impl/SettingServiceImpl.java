package egovframework.counseling.setting.service.impl;


import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

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
}
