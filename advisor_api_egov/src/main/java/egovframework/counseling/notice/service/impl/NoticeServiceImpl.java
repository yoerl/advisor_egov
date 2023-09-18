package egovframework.counseling.notice.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.notice.service.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {

//	/** SampleDAO */
//	// TODO ibatis 사용
   @Resource(name = "noticeDAO")
  private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> selectNotices(NoticeVO noticeVO) throws Exception {


		List<NoticeVO> noticeInfo = noticeDAO.selectNoticeList(noticeVO);
		return noticeInfo;
	}
	
	
	@Override
	public List<NoticeVO> selectNoticeOne(String id) throws Exception {


		List<NoticeVO> noticeInfo = noticeDAO.selectNoticeOne(id);

		return noticeInfo;
	}
	

	@Override
	public boolean insertNoticeOne(NoticeVO noticeVO) throws Exception{
		
		boolean result = noticeDAO.insertNoticeOne(noticeVO);
		
		return result;
	
	}
	

	@Override
	public boolean deleteNoticeOne(String id) throws Exception{
		
		boolean result = noticeDAO.deleteNoticeOne(id);
		
		return result;
	
	}

    // 공지사항을 수정하는 메서드를 추가합니다.
    public boolean updateNoticeOne(NoticeVO noticeVO) throws Exception {
        boolean result = noticeDAO.updateNoticeOne(noticeVO);
        return result;
    }


	

}
