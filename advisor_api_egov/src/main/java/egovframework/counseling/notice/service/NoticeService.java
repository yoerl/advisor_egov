package egovframework.counseling.notice.service;

import java.util.List;

import egovframework.counseling.notice.service.impl.NoticeVO;

public interface NoticeService {

	List<NoticeVO> selectNotices() throws Exception;

	List<NoticeVO> selectNoticeOne(String id) throws Exception;

	boolean insertNoticeOne(NoticeVO noticeVO) throws Exception;


	boolean deleteNoticeOne(String id) throws Exception;

	boolean updateNoticeOne(NoticeVO noticeVO) throws Exception;
	
	

}
