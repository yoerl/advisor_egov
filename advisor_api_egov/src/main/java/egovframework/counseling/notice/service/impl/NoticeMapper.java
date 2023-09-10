package egovframework.counseling.notice.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;


@Mapper("noticeMapper")
public interface NoticeMapper  {


    public List<NoticeVO> selectNotice() throws Exception;
    
    public List<NoticeVO> selectNoticeOne(NoticeVO param) throws Exception;

	public int insertNoticeOne(NoticeVO noticeVO) throws Exception;

	public int deleteNoticeOne(NoticeVO param) throws Exception;

	public int updateNoticeOne(NoticeVO noticeVO) throws Exception;
}
