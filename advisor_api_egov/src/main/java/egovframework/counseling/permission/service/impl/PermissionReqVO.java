package egovframework.counseling.permission.service.impl;

    import java.sql.Timestamp;

    public class PermissionReqVO {
     

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
		public String getUserNm() {
			return userNm;
		}
		public void setUserNm(String userNm) {
			this.userNm = userNm;
		}
		public String getAthrTypeCd() {
			return athrTypeCd;
		}
		public void setAthrTypeCd(String athrTypeCd) {
			this.athrTypeCd = athrTypeCd;
		}
		public String getAthrCd() {
			return athrCd;
		}
		public void setAthrCd(String athrCd) {
			this.athrCd = athrCd;
		}
		public String getAthrNm() {
			return athrNm;
		}
		public void setAthrNm(String athrNm) {
			this.athrNm = athrNm;
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
		public Timestamp getRgsnDttm() {
			return rgsnDttm;
		}
		public void setRgsnDttm(Timestamp rgsnDttm) {
			this.rgsnDttm = rgsnDttm;
		}
		@Override
		public String toString() {
			return "PermissionReqVO [notiSqno=" + notiSqno + ", userId=" + userId + ", userNm=" + userNm
					+ ", athrTypeCd=" + athrTypeCd + ", athrCd=" + athrCd + ", athrNm=" + athrNm + ", useYn=" + useYn
					+ ", amndId=" + amndId + ", amntDttm=" + amntDttm + ", rgsrId=" + rgsrId + ", rgsnDttm=" + rgsnDttm
					+ "]";
		}
		private int notiSqno;
        private String userId;
        private String userNm;
        private String athrTypeCd;
        private String athrCd;
        private String athrNm;
        private char useYn;
        private String amndId;
        private Timestamp amntDttm;
        private String rgsrId;
        private Timestamp rgsnDttm;
    }
