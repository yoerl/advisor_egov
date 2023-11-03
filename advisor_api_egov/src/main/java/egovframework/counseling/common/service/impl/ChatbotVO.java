package egovframework.counseling.common.service.impl;

import java.sql.Timestamp;

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
public class ChatbotVO {
	

	
	
	public String getInttCd() {
		return inttCd;
	}
	public void setInttCd(String inttCd) {
		this.inttCd = inttCd;
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
	public String getUserDivCd() {
		return userDivCd;
	}
	public void setUserDivCd(String userDivCd) {
		this.userDivCd = userDivCd;
	}
	public String getRolePower() {
		return rolePower;
	}
	public void setRolePower(String rolePower) {
		this.rolePower = rolePower;
	}
	public String getKnow() {
		return know;
	}
	public void setKnow(String know) {
		this.know = know;
	}
	public String getUserDivNm() {
		return userDivNm;
	}
	public void setUserDivNm(String userDivNm) {
		this.userDivNm = userDivNm;
	}
	public String getBotId() {
		return botId;
	}
	public void setBotId(String botId) {
		this.botId = botId;
	}
	public String getExtnNo() {
		return extnNo;
	}
	public void setExtnNo(String extnNo) {
		this.extnNo = extnNo;
	}
	public String getConsStatCd() {
		return consStatCd;
	}
	public void setConsStatCd(String consStatCd) {
		this.consStatCd = consStatCd;
	}
	public Character getUseYn() {
		return useYn;
	}
	public void setUseYn(Character useYn) {
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
	public String getCmnSpcDivCd() {
		return cmnSpcDivCd;
	}
	public void setCmnSpcDivCd(String cmnSpcDivCd) {
		this.cmnSpcDivCd = cmnSpcDivCd;
	}
	@Override
	public String toString() {
		return "ChatbotVO [inttCd=" + inttCd + ", userId=" + userId + ", userNm=" + userNm + ", userDivCd=" + userDivCd
				+ ", rolePower=" + rolePower + ", know=" + know + ", userDivNm=" + userDivNm + ", botId=" + botId
				+ ", extnNo=" + extnNo + ", consStatCd=" + consStatCd + ", useYn=" + useYn + ", amndId=" + amndId
				+ ", amntDttm=" + amntDttm + ", rgsrId=" + rgsrId + ", rgsnDttm=" + rgsnDttm + ", cmnSpcDivCd="
				+ cmnSpcDivCd + "]";
	}
	private String inttCd;
    private String userId;
    private String userNm;
    private String userDivCd;
    private String rolePower;
    private String know;
	private String userDivNm;
    private String botId;
    private String extnNo;
    private String consStatCd;
    private Character useYn;
    private String amndId;
    private Timestamp amntDttm;
    private String rgsrId;
    private Timestamp rgsnDttm;
    private String cmnSpcDivCd;
    
    

}
