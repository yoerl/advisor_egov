package egovframework.counseling.advisor.service;

import egovframework.counseling.advisor.service.impl.AdvisorDTO;

public interface AdvisorService {

	/**
	 * 알림 목록조회
	 */
	boolean updateSummary(AdvisorDTO advisorDTO);

	/**
	 * 알림 목록조회
	 */
	boolean updateKmsRply(AdvisorDTO advisorDTO);

	/**
	 * 알림 목록조회
	 */
	boolean updateAiRplyHist(AdvisorDTO advisorDTO);

}
