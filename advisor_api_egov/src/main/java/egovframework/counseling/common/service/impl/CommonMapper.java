package egovframework.counseling.common.service.impl;


import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;



@Mapper("commonMapper")
public interface CommonMapper  {


    public List<CommonVO> selectAgency();

    public List<CommonVO> selectCommonData(CommonVO commonVO);
    
    
    public List<CommonVO> selectAuthMenu(CommonVO commonVO);

    public int updateMunuAuth(CommonVO commonVO);
    
	public int updateSystemChkAuth(CommonVO commonVO);
	

	public int updateChatBotOne(ChatbotVO chatbotVO);
	public int updateChatBotGrop(ChatbotVO chatbotVO);

    public List<CommonVO> selectSystemChkAuth(CommonVO commonVO);
	
    
    
}

