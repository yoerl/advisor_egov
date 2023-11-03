
 package egovframework.counseling.advisor.service.impl;
 

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
 
 
 @Mapper("advisorMapper") 
 public interface AdvisorMapper {

		int updateSummary(AdvisorDTO advisorDTO);

		int updateKmsRply(AdvisorDTO advisorDTO);

		int updateAiRplyHist(AdvisorDTO advisorDTO);
 
 
 }
