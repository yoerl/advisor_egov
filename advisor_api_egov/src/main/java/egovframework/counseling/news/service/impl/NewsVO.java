package egovframework.counseling.news.service.impl;

import java.sql.Timestamp;

import egovframework.util.Pagination;

public class NewsVO {

	public NewsVO() {
		this.pagination = new Pagination();
	}
	
	public int getNewsSqno() {
		return newsSqno;
	}
	public void setNewsSqno(int newsSqno) {
		this.newsSqno = newsSqno;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public String getNewsTitlNm() {
		return newsTitlNm;
	}
	public void setNewsTitlNm(String newsTitlNm) {
		this.newsTitlNm = newsTitlNm;
	}
	public String getNewsCntn() {
		return newsCntn;
	}
	public void setNewsCntn(String newsCntn) {
		this.newsCntn = newsCntn;
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
	public String getAmntDttm() {
		return amntDttm;
	}
	public void setAmntDttm(String amntDttm) {
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
	public String getRgsnDttm() {
		return rgsnDttm;
	}
	public void setRgsnDttm(String rgsnDttm) {
		this.rgsnDttm = rgsnDttm;
	}
	public String getRgsnDttmStr() {
		return rgsnDttmStr;
	}
	public void setRgsnDttmStr(String rgsnDttmStr) {
		this.rgsnDttmStr = rgsnDttmStr;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	public String getReadYn() {
		return readYn;
	}
	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}
	
	@Override
	public String toString() {
		return "NewsVO [newsSqno=" + newsSqno + ", receiverId=" + receiverId + ", newsTitlNm=" + newsTitlNm
				+ ", newsCntn=" + newsCntn + ", useYn=" + useYn + ", amndId=" + amndId + ", amntDttm=" + amntDttm
				+ ", rgsrId=" + rgsrId + ", rgsrNm=" + rgsrNm + ", rgsnDttm=" + rgsnDttm + ", rgsnDttmStr="
				+ rgsnDttmStr + ", readYn=" + readYn + ", pagination=" + pagination + "]";
	}

	private int newsSqno;
    private String receiverId;
    private String newsTitlNm;
    private String newsCntn;
    private char useYn;
    private String amndId;
    private String amntDttm;
    private String rgsrId;
    private String rgsrNm;
    private String rgsnDttm;
    private String rgsnDttmStr;
    private String readYn;
    
    private Pagination pagination;

}
