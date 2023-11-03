package egovframework.counseling.common.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.common.service.CommonService;




@Service("commonService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService {

	@Resource(name = "commonDAO")
	private CommonDAO commonDAO;
	
	
	@Override
	public List<CommonVO> selectAgency(){
	

		return commonDAO.selectAgencyList();
	}

	@Override
	public List<CommonVO> selectCommonCode(CommonVO cmmonVO){


		return commonDAO.selectCommonData(cmmonVO);
	}
	

	@Override
	public List<CommonVO> selectAuthMenu(CommonVO cmmonVO) {
		

		return commonDAO.selectAuthMenu(cmmonVO);
	}
	// 공지사항을 수정하는 메서드를 추가합니다.
	@Override
    public boolean updateSystemChkAuth(CommonVO commonVO) {
        return commonDAO.updateSystemChkAuth(commonVO);
    }

    // 공지사항을 수정하는 메서드를 추가합니다.
	@Override
    public boolean updateMunuAuth(CommonVO commonVO) {
        return commonDAO.updateMunuAuth(commonVO);
    }

    // 공지사항을 수정하는 메서드를 추가합니다.
	@Override
    public boolean updateChatBotOne(ChatbotVO chatbotVO) {
        return commonDAO.updateChatBotOne(chatbotVO);
    }
	
    // 공지사항을 수정하는 메서드를 추가합니다.
	@Override
    public boolean updateChatBotGrop(ChatbotVO chatbotVO) {
        return commonDAO.updateChatBotGrop(chatbotVO);
    }	
    // 공지사항을 수정하는 메서드를 추가합니다.
	@Override
	public List<CommonVO> selectSystemChkAuth(CommonVO commonVO) {
        return commonDAO.selectSystemChkAuth(commonVO);
    }
	


}
