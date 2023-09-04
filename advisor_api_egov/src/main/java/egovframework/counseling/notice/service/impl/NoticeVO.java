package egovframework.counseling.notice.service.impl;

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
public class NoticeVO{

	private int notiSqno;
    private String userId;
    private String notiDivNm;
    private String notiTitlNm;
    private String notiCntn;
    private String useYn;
    private String amndId;
    private Date amntDttm;
    private String rgsrId;
    private Date rgsnDttm;
    

    public int getNotiSqno() {
		return notiSqno;
	}
	public void setNotiSqno(int notiSqno) {
		this.notiSqno = notiSqno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNotiDivNm() {
		return notiDivNm;
	}
	public void setNotiDivNm(String notiDivNm) {
		this.notiDivNm = notiDivNm;
	}
	public String getNotiTitlNm() {
		return notiTitlNm;
	}
	public void setNotiTitlNm(String notiTitlNm) {
		this.notiTitlNm = notiTitlNm;
	}
	public String getNotiCntn() {
		return notiCntn;
	}
	public void setNotiCntn(String notiCntn) {
		this.notiCntn = notiCntn;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getAmndId() {
		return amndId;
	}
	public void setAmndId(String amndId) {
		this.amndId = amndId;
	}
	public Date getAmntDttm() {
		return amntDttm;
	}
	public void setAmntDttm(Date amntDttm) {
		this.amntDttm = amntDttm;
	}
	public String getRgsrId() {
		return rgsrId;
	}
	public void setRgsrId(String rgsrId) {
		this.rgsrId = rgsrId;
	}
	public Date getRgsnDttm() {
		return rgsnDttm;
	}
	public void setRgsnDttm(Date rgsnDttm) {
		this.rgsnDttm = rgsnDttm;
	}

	@Override
	public String toString() {
		return "NoticeVO [notiSqno=" + notiSqno + ", userId=" + userId + ", notiDivNm=" + notiDivNm + ", notiTitlNm="
				+ notiTitlNm + ", notiCntn=" + notiCntn + ", useYn=" + useYn + ", amndId=" + amndId + ", amntDttm="
				+ amntDttm + ", rgsrId=" + rgsrId + ", rgsnDttm=" + rgsnDttm + "]";
	}
    

}
