package egovframework.counseling.notice.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;


@Mapper("noticeMapper")
public interface NoticeMapper  {

	
    public List<NoticeVO> selectNotice() throws Exception;
 
 
}
