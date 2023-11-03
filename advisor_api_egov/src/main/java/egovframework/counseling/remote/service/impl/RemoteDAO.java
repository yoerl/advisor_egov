package egovframework.counseling.remote.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

import java.util.List;

@Repository
public class RemoteDAO {


	private static final Logger logger = LogManager.getLogger(RemoteDAO.class);
	
    @Resource(name = "remoteMapper")
    private RemoteMapper remoteMapper;

    public List<SummaryVO> selectSummary(SummaryVO summaryVO) {


    	// 페이징 처리를 위한 목록 count
    	int summaryCnt = remoteMapper.selectSummaryAllCnt(summaryVO);
    	summaryVO.getPagination().setTotalRecordCount(summaryCnt);
    	
		
		List<SummaryVO> result = null;
        try {
        	result = remoteMapper.selectSummary(summaryVO);
        	result.get(0).setPagination(summaryVO.getPagination());
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
        	logger.error("Exception : "+ e, e.toString());
            // 예외 처리 로직 작성

			
        }
        
        
        return result;
        
        
        
        
        
        
        
        
        
        
        
    }
    

    public List<SummaryVO> selectOneSummary(SummaryVO summaryVO) {

		
		List<SummaryVO> result = null;
        try {
        	result = remoteMapper.selectOneSummary(summaryVO);
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("상담요약상세조회 에러 ", e);
        }
        
        
        return result;
    }

}
