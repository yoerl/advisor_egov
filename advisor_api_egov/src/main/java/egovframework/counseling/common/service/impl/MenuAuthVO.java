package egovframework.counseling.common.service.impl;


public class MenuAuthVO {
	
	
	private String memo;
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getKnow() {
		return know;
	}
	public void setKnow(String know) {
		this.know = know;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public String getSetting() {
		return setting;
	}
	public void setSetting(String setting) {
		this.setting = setting;
	}
	public String getMonitering() {
		return monitering;
	}
	public void setMonitering(String monitering) {
		this.monitering = monitering;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getSystemChk() {
		return systemChk;
	}
	public void setSystemChk(String systemChk) {
		this.systemChk = systemChk;
	}
	public String getInsttcode() {
		return insttcode;
	}
	public void setInsttcode(String insttcode) {
		this.insttcode = insttcode;
	}
	public String getRolecode() {
		return rolecode;
	}
	public void setRolecode(String rolecode) {
		this.rolecode = rolecode;
	}
	@Override
	public String toString() {
		return "MenuAuthVO [memo=" + memo + ", know=" + know + ", history=" + history + ", setting=" + setting
				+ ", monitering=" + monitering + ", permission=" + permission + ", notice=" + notice + ", systemChk="
				+ systemChk + ", insttcode=" + insttcode + ", rolecode=" + rolecode + ", getMemo()=" + getMemo()
				+ ", getKnow()=" + getKnow() + ", getHistory()=" + getHistory() + ", getSetting()=" + getSetting()
				+ ", getMonitering()=" + getMonitering() + ", getPermission()=" + getPermission() + ", getNotice()="
				+ getNotice() + ", getSystemChk()=" + getSystemChk() + ", getInsttcode()=" + getInsttcode()
				+ ", getRolecode()=" + getRolecode() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	private String know;
	private String history;
    private String setting;
    private String monitering;
    private String permission;
    private String notice;
    private String systemChk;
    private String insttcode;
    private String rolecode;
    
    
    
    

    
}
