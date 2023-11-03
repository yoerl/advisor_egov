package egovframework.counseling.advisor.service.impl;

public class AdvisorDTO {
	

	public String getCntn() {
		return cntn;
	}
	public void setCntn(String cntn) {
		this.cntn = cntn;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getConsHstrId() {
		return consHstrId;
	}
	public void setConsHstrId(String consHstrId) {
		this.consHstrId = consHstrId;
	}
	public String getSqnc() {
		return sqnc;
	}
	public void setSqnc(String sqnc) {
		this.sqnc = sqnc;
	}
	public String getKmsCntsSqnc() {
		return kmsCntsSqnc;
	}
	public void setKmsCntsSqnc(String kmsCntsSqnc) {
		this.kmsCntsSqnc = kmsCntsSqnc;
	}
	public String getUseDivCd() {
		return useDivCd;
	}
	public void setUseDivCd(String useDivCd) {
		this.useDivCd = useDivCd;
	}
	
	@Override
	public String toString() {
		return "AdvisorDTO [cntn=" + cntn + ", id=" + id + ", consHstrId=" + consHstrId + ", sqnc=" + sqnc
				+ ", kmsCntsSqnc=" + kmsCntsSqnc + ", useDivCd=" + useDivCd + "]";
	}

	private String cntn;
    private String id;
	private String consHstrId;
    private String sqnc;
	private String kmsCntsSqnc;
	private String useDivCd;
	
}
