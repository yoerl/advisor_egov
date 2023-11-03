package egovframework.counseling.remote.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import egovframework.counseling.remote.service.RemoteService;

@Service("remoteService")
public class RemoteServiceImpl extends EgovAbstractServiceImpl implements RemoteService {

	   @Resource(name = "remoteDAO")
	   private RemoteDAO remoteDAO;
	 	
	   @Override
	   public List<SummaryVO> selectSummary(SummaryVO summaryVO) {

	

			
	     return remoteDAO.selectSummary(summaryVO);
	   }
	   
	   @Override
	   public List<SummaryVO> selectOneSummary(SummaryVO summaryVO) {


	     return remoteDAO.selectOneSummary(summaryVO);
	   }
	   

}
