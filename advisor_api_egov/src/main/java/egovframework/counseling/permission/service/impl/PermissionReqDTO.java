package egovframework.counseling.permission.service.impl;


    public class PermissionReqDTO {
     
		
		public String getAthrTypeCd() {
			return athrTypeCd;
		}
		public void setAthrTypeCd(String athrTypeCd) {
			this.athrTypeCd = athrTypeCd;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		public String getUserNm() {
			return userNm;
		}
		public void setUserNm(String userNm) {
			this.userNm = userNm;
		}
		public String getAthrCd() {
			return athrCd;
		}
		public void setAthrCd(String athrCd) {
			this.athrCd = athrCd;
		}
		public String getExtnNo() {
			return extnNo;
		}
		public void setExtnNo(String extnNo) {
			this.extnNo = extnNo;
		}
		
		public String getInttCd() {
			return inttCd;
		}
		public void setInttCd(String inttCd) {
			this.inttCd = inttCd;
		}

		@Override
		public String toString() {
			return "PermissionReqDTO [athrTypeCd=" + athrTypeCd + ", userId=" + userId + ", role=" + role + ", userNm="
					+ userNm + ", athrCd=" + athrCd + ", extnNo=" + extnNo + ", inttCd=" + inttCd + "]";
		}

		private String athrTypeCd;
		private String userId;
		private String role;
        private String userNm;
        private String athrCd;
        private String extnNo;
        private String inttCd;
		
    }
