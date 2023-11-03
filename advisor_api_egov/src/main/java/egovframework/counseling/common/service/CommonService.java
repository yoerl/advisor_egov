package egovframework.counseling.common.service;

import java.util.List;

import egovframework.counseling.common.service.impl.ChatbotVO;
import egovframework.counseling.common.service.impl.CommonVO;

public interface CommonService {

	List<CommonVO> selectAgency();

	List<CommonVO> selectCommonCode(CommonVO cmmonVO);
	
	List<CommonVO> selectAuthMenu(CommonVO cmmonVO);

	boolean updateMunuAuth(CommonVO commonVO);
	
	boolean updateChatBotOne(ChatbotVO userInfoVO);
	
	boolean updateChatBotGrop(ChatbotVO userInfoVO);

	boolean updateSystemChkAuth(CommonVO commonVO);

	List<CommonVO> selectSystemChkAuth(CommonVO commonVO);
	

}
