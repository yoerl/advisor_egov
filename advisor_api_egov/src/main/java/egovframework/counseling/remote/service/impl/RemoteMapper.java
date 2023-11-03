package egovframework.counseling.remote.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;


@Mapper("remoteMapper")
public interface RemoteMapper  {

    public List<SummaryVO> selectSummary(SummaryVO summaryVO);

    public List<SummaryVO> selectOneSummary(SummaryVO summaryVO);
    public int selectSummaryAllCnt(SummaryVO summaryVO);
    
    
}
