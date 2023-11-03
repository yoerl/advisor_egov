package egovframework.counseling.notice.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.notice.service.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {

//	/** SampleDAO */
   @Resource(name = "noticeDAO")
  private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> selectNotices(NoticeVO noticeVO){


		return noticeDAO.selectNoticeList(noticeVO);
	}
	
	
	@Override
	public List<NoticeVO> selectNoticeOne(String id){


		return noticeDAO.selectNoticeOne(id);
	}
	

	@Override
	public boolean insertNoticeOne(NoticeVO noticeVO){
		
		return noticeDAO.insertNoticeOne(noticeVO);
	
	}
	

	@Override
	public boolean deleteNoticeOne(String id){
		
		
		return noticeDAO.deleteNoticeOne(id);
	
	}

    // 공지사항을 수정하는 메서드를 추가합니다.
	@Override
    public boolean updateNoticeOne(NoticeVO noticeVO){
        return noticeDAO.updateNoticeOne(noticeVO);
    }


	

}
