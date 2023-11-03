package egovframework.counseling.notice.service;

import java.util.List;

import egovframework.counseling.notice.service.impl.NoticeVO;

public interface NoticeService {

	List<NoticeVO> selectNotices(NoticeVO noticeVO);

	List<NoticeVO> selectNoticeOne(String id);

	boolean insertNoticeOne(NoticeVO noticeVO);


	boolean deleteNoticeOne(String id);

	boolean updateNoticeOne(NoticeVO noticeVO);
	
	

}
