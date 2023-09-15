package egovframework.counseling.news.service.impl;

import java.sql.Timestamp;

public class NewsVO {
    @Override
	public String toString() {
		return "NewsVO [newsSqno=" + newsSqno + ", receiverId=" + receiverId + ", newsTitlNm=" + newsTitlNm
				+ ", newsCntn=" + newsCntn + ", useYn=" + useYn + ", amndId=" + amndId + ", amntDttm=" + amntDttm
				+ ", rgsrId=" + rgsrId + ", rgsrNm=" + rgsrNm + ", rgsnDttm=" + rgsnDttm + "]";
	}

	private int newsSqno;
    private String receiverId;
    private String newsTitlNm;
    private String newsCntn;
    private char useYn;
    private String amndId;
    private Timestamp amntDttm;
    private String rgsrId;
    private String rgsrNm;
    private Timestamp rgsnDttm;

    // 생성자, Getter 및 Setter 메서드는 필요에 따라 추가할 수 있습니다.

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
}
