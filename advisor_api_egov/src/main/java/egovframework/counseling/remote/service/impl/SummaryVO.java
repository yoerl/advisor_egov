package egovframework.counseling.remote.service.impl;


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
public class SummaryVO{


	public SummaryVO() {
		this.pagination = new Pagination();
	}


	public String getInttCd() {
		return inttCd;
	}

	public void setInttCd(String inttCd) {
		this.inttCd = inttCd;
	}

	public String getRecpNo() {
		return recpNo;
	}

	public void setRecpNo(String recpNo) {
		this.recpNo = recpNo;
	}

	public String getAiBrfCntn() {
		return aiBrfCntn;
	}

	public void setAiBrfCntn(String aiBrfCntn) {
		this.aiBrfCntn = aiBrfCntn;
	}

	public String getKmsMemoCntn() {
		return kmsMemoCntn;
	}

	public void setKmsMemoCntn(String kmsMemoCntn) {
		this.kmsMemoCntn = kmsMemoCntn;
	}

	public String getCallId() {
		return callId;
	}

	public void setCallId(String callId) {
		this.callId = callId;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
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

	public String getConsSttTime() {
		return consSttTime;
	}

	public void setConsSttTime(String consSttTime) {
		this.consSttTime = consSttTime;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	@Override
	public String toString() {
		return "SummaryVO [inttCd=" + inttCd + ", recpNo=" + recpNo + ", aiBrfCntn=" + aiBrfCntn + ", kmsMemoCntn="
				+ kmsMemoCntn + ", callId=" + callId + ", userNm=" + userNm + ", pageNumber=" + pageNumber
				+ ", pageSize=" + pageSize + ", consSttTime=" + consSttTime + ", pagination=" + pagination + "]";
	}

	private String inttCd; // 기관번호
	private String recpNo; // 고객번호
	private String aiBrfCntn; // 내용
	private String kmsMemoCntn; // kms 메모 내용
	private String callId; // kms 메모 내용
	private String userNm; // kms 메모 내용
	
    private String consSttTime;
    

    private String pageNumber;
    private String pageSize;
    private Pagination pagination;
    
    
    
    

}
