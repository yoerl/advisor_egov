package egovframework.counseling.remote.service;

import java.util.List;

import egovframework.counseling.remote.service.impl.SummaryVO;

public interface RemoteService {

	List<SummaryVO> selectSummary(SummaryVO summaryVO);

	List<SummaryVO> selectOneSummary(SummaryVO summaryVO);

}
