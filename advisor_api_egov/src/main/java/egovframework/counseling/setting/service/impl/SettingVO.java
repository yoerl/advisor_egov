package egovframework.counseling.setting.service.impl;

public class SettingVO {
	
	private String envrStupDivCd;
	private String userId;
	private String envrStupDivNm;
	private String envrStupVl;
	private String amndId;
	private String amntDttm;
	private String rgsrId;
	private String rgsnDttm;
	
	public String getEnvrStupDivCd() {
		return envrStupDivCd;
	}
	public void setEnvrStupDivCd(String envrStupDivCd) {
		this.envrStupDivCd = envrStupDivCd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEnvrStupDivNm() {
		return envrStupDivNm;
	}
	public void setEnvrStupDivNm(String envrStupDivNm) {
		this.envrStupDivNm = envrStupDivNm;
	}
	public String getEnvrStupVl() {
		return envrStupVl;
	}
	public void setEnvrStupVl(String envrStupVl) {
		this.envrStupVl = envrStupVl;
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
	public String getRgsnDttm() {
		return rgsnDttm;
	}
	public void setRgsnDttm(String rgsnDttm) {
		this.rgsnDttm = rgsnDttm;
	}
	@Override
	public String toString() {
		return "SettingVO [envrStupDivCd=" + envrStupDivCd + ", userId=" + userId + ", envrStupDivNm=" + envrStupDivNm
				+ ", envrStupVl=" + envrStupVl + ", amndId=" + amndId + ", amntDttm=" + amntDttm + ", rgsrId=" + rgsrId
				+ ", rgsnDttm=" + rgsnDttm + "]";
	}
	
}
