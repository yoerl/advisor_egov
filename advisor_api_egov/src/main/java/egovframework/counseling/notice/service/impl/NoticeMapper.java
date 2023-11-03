package egovframework.counseling.notice.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;


@Mapper("noticeMapper")
public interface NoticeMapper  {


    public List<NoticeVO> selectNotice(NoticeVO noticeVO);
    
    public int selectNoticeListCnt();
    
    public List<NoticeVO> selectNoticeOne(NoticeVO param);

	public int insertNoticeOne(NoticeVO noticeVO);

	public int deleteNoticeOne(NoticeVO param);

	public int updateNoticeOne(NoticeVO noticeVO);
}
