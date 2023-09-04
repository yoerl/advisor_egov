package egovframework.counseling.notice.service;

import java.util.List;

import egovframework.counseling.notice.service.impl.NoticeVO;
import egovframework.example.sample.service.SampleVO;

public interface NoticeService {

	List<NoticeVO> selectNotice() throws Exception;

}
