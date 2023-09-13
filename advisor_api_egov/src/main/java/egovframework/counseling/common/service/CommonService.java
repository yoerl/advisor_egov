package egovframework.counseling.common.service;

import java.util.List;

import egovframework.counseling.common.service.impl.AgencyVO;
import egovframework.counseling.common.service.impl.CommonVO;
import egovframework.counseling.notice.service.impl.NoticeVO;

public interface CommonService {

	List<CommonVO> selectAgency() throws Exception;
	
	List<CommonVO> selectCommonCode(CommonVO cmmonVO) throws Exception;

//	List<NoticeVO> selectNoticeOne(String id) throws Exception;
//
//	boolean insertNoticeOne(NoticeVO noticeVO) throws Exception;
//
//
//	boolean deleteNoticeOne(String id) throws Exception;
//
//	boolean updateNoticeOne(NoticeVO noticeVO) throws Exception;
//	
	

}
