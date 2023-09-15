package egovframework.counseling.common.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.common.service.CommonService;
import egovframework.counseling.notice.service.NoticeService;
import egovframework.counseling.notice.service.impl.NoticeVO;




@Service("commonService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService {

	@Resource(name = "commonDAO")
	private CommonDAO commonDAO;
	
	
	@Override
	public List<CommonVO> selectAgency() throws Exception {
		// TODO Auto-generated method stub

		List<CommonVO> agencyInfo = commonDAO.selectAgencyList();
		
		return agencyInfo;
	}
	
	@Override
	public List<CommonVO> selectCommonCode(CommonVO cmmonVO) throws Exception {
		// TODO Auto-generated method stub

		List<CommonVO> agencyInfo = commonDAO.selectCommonData(cmmonVO);
		
		return agencyInfo;
	}

	

}
