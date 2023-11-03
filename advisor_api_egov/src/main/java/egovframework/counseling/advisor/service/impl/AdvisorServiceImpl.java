
 package egovframework.counseling.advisor.service.impl;
 
 

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.advisor.service.AdvisorService;

 
@Service("advisorService")
public class AdvisorServiceImpl extends EgovAbstractServiceImpl implements AdvisorService {
	

@Resource(name = "advisorDAO")
private AdvisorDAO advisorDAO;

	
	/**
	 * 알림 목록조회
	 */
	@Override
	public boolean updateSummary(AdvisorDTO advisorDTO) {

		

        return advisorDAO.updateSummary(advisorDTO);

	}

	/**
	 * 알림 목록조회
	 */
	@Override
	public boolean updateKmsRply(AdvisorDTO advisorDTO) {

		

        return advisorDAO.updateKmsRply(advisorDTO);

	}
 
	

	
	/**
	 * 알림 목록조회
	 */
	@Override
	public boolean updateAiRplyHist(AdvisorDTO advisorDTO) {

		

        return advisorDAO.updateAiRplyHist(advisorDTO);

	}
 
	
 
 }
