package egovframework.counseling.common.service.impl;

import java.sql.Timestamp;

public class CommonVO {
    public String getComnCd() {
		return comnCd;
	}
	public void setComnCd(String comnCd) {
		this.comnCd = comnCd;
	}
	public String getComnCdNm() {
		return comnCdNm;
	}
	public void setComnCdNm(String comnCdNm) {
		this.comnCdNm = comnCdNm;
	}
	public String getComnCdVal() {
		return comnCdVal;
	}
	public void setComnCdVal(String comnCdVal) {
		this.comnCdVal = comnCdVal;
	}
	public String getComnCdValNm() {
		return comnCdValNm;
	}
	public void setComnCdValNm(String comnCdValNm) {
		this.comnCdValNm = comnCdValNm;
	}
	public String getHgrnComnCd() {
		return hgrnComnCd;
	}
	public void setHgrnComnCd(String hgrnComnCd) {
		this.hgrnComnCd = hgrnComnCd;
	}
	public String getHgrnComnCdNm() {
		return hgrnComnCdNm;
	}
	public void setHgrnComnCdNm(String hgrnComnCdNm) {
		this.hgrnComnCdNm = hgrnComnCdNm;
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
	public Timestamp getRgsnDttm() {
		return rgsnDttm;
	}
	public void setRgsnDttm(Timestamp rgsnDttm) {
		this.rgsnDttm = rgsnDttm;
	}
	@Override
	public String toString() {
		return "CommonVO [comnCd=" + comnCd + ", comnCdNm=" + comnCdNm + ", comnCdVal=" + comnCdVal + ", comnCdValNm="
				+ comnCdValNm + ", hgrnComnCd=" + hgrnComnCd + ", hgrnComnCdNm=" + hgrnComnCdNm + ", useYn=" + useYn
				+ ", amndId=" + amndId + ", amntDttm=" + amntDttm + ", rgsrId=" + rgsrId + ", rgsnDttm=" + rgsnDttm
				+ "]";
	}
	private String comnCd;
    private String comnCdNm;
    private String comnCdVal;
    private String comnCdValNm;
    private String hgrnComnCd;
    private String hgrnComnCdNm;
    private String useYn;
    private String amndId;
    private Timestamp amntDttm;
    private String rgsrId;
    private Timestamp rgsnDttm;

}
