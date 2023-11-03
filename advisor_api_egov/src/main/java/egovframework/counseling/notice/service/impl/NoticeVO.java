package egovframework.counseling.notice.service.impl;

import java.sql.Timestamp;

import egovframework.util.Pagination;

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


	public NoticeVO() {
		this.pagination = new Pagination();
	}
	
	public String getNotiSqno() {
		return notiSqno;
	}
	public void setNotiSqno(String notiSqno) {
		this.notiSqno = notiSqno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
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
	public char getUseYn() {
		return useYn;
	}
	public void setUseYn(char useYn) {
		this.useYn = useYn;
	}
	public String getAmndId() {
		return amndId;
	}
	public void setAmndId(String amndId) {
		this.amndId = amndId;
	}
	public String getAmndNm() {
		return amndNm;
	}
	public void setAmndNm(String amndNm) {
		this.amndNm = amndNm;
	}
	public Timestamp getAmntDttm() {
		return amntDttm;
	}
	public void setAmntDttm(Timestamp amntDttm) {
		this.amntDttm = amntDttm;
	}
	public String getRgsrId() {
		return rgsrId;
	}
	public void setRgsrId(String rgsrId) {
		this.rgsrId = rgsrId;
	}
	public String getRgsrNm() {
		return rgsrNm;
	}
	public void setRgsrNm(String rgsrNm) {
		this.rgsrNm = rgsrNm;
	}
	public Timestamp getRgsnDttm() {
		return rgsnDttm;
	}
	public void setRgsnDttm(Timestamp rgsnDttm) {
		this.rgsnDttm = rgsnDttm;
	}
	public String getRgsnDttmStr() {
		return rgsnDttmStr;
	}
	public void setRgsnDttmStr(String rgsnDttmStr) {
		this.rgsnDttmStr = rgsnDttmStr;
	}
	public String getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(String pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
	
	@Override
	public String toString() {
		return "NoticeVO [notiSqno=" + notiSqno + ", userId=" + userId + ", userNm=" + userNm + ", notiDivNm="
				+ notiDivNm + ", notiTitlNm=" + notiTitlNm + ", notiCntn=" + notiCntn + ", useYn=" + useYn + ", amndId="
				+ amndId + ", amndNm=" + amndNm + ", amntDttm=" + amntDttm + ", rgsrId=" + rgsrId + ", rgsrNm=" + rgsrNm
				+ ", rgsnDttm=" + rgsnDttm + ", rgsnDttmStr=" + rgsnDttmStr + ", pageNumber=" + pageNumber
				+ ", pageSize=" + pageSize + ", pagination=" + pagination + "]";
	}


	private String notiSqno;
	private String userId;
    private String userNm;
    private String notiDivNm;
    private String notiTitlNm;
    private String notiCntn;
    private char useYn;
    private String amndId;
    private String amndNm;
    private Timestamp amntDttm;
    private String rgsrId;
    private String rgsrNm;
    private Timestamp rgsnDttm;
    private String rgsnDttmStr;
    
    
    private String pageNumber;
    private String pageSize;
    
    private Pagination pagination;
    
    

}
