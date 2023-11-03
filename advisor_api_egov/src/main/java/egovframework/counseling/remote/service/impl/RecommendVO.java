package egovframework.counseling.remote.service.impl;

import java.util.Arrays;

public class RecommendVO {
	

	

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String[] getCntntId() {
		return cntntId;
	}
	public void setCntntId(String[] cntntId) {
        this.cntntId = Arrays.copyOf(cntntId, cntntId.length);
	}
	public String[] getKmsKey() {
		return kmsKey;
	}
	public void setKmsKey(String[] kmsKey) {
        this.kmsKey = Arrays.copyOf(kmsKey, kmsKey.length);
	}
	public String[] getAiKey() {
		return aiKey;
	}
	public void setAiKey(String[] aiKey) {
        this.aiKey = Arrays.copyOf(aiKey, aiKey.length);
	}
	@Override
	public String toString() {
		return "RecommendVO [userId=" + userId + ", cntntId=" + Arrays.toString(cntntId) + ", kmsKey="
				+ Arrays.toString(kmsKey) + ", aiKey=" + Arrays.toString(aiKey) + "]";
	}
	private String userId;
	private String[] cntntId;
	private String[] kmsKey;
	private String[] aiKey;
	
	
	
	
	
}
