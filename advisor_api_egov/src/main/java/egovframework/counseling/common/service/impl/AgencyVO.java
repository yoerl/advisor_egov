package egovframework.counseling.common.service.impl;

import java.sql.Timestamp;
import java.util.Date;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class AgencyVO{

	private String inttCd;
	private String inttNm;
	
	public String getInttCd() {
		return inttCd;
	}
	public void setInttCd(String inttCd) {
		this.inttCd = inttCd;
	}
	public String getInttNm() {
		return inttNm;
	}
	public void setInttNm(String inttNm) {
		this.inttNm = inttNm;
	}
	@Override
	public String toString() {
		return "AgencyVO [inttCd=" + inttCd + ", inttNm=" + inttNm + "]";
	}
	
	
}
