package egovframework.counseling.notice.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.notice.service.NoticeService;
import egovframework.example.sample.service.impl.SampleDAO;

@Service("noticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {

//	/** SampleDAO */
//	// TODO ibatis 사용
   @Resource(name = "noticeDAO")
  private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> selectNotice() throws Exception {

		System.out.println("qqqqqqqqqqqqq");

		List<NoticeVO> noticeInfo = noticeDAO.selectNoticeList();
		System.out.println("wwwwwwwwww" +noticeInfo.toString());
		return noticeInfo;
	}

}
