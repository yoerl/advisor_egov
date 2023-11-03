package egovframework.counseling.common.service.impl;

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
public class PerformanceVO {

	public String getCpuAll() {
		return cpuAll;
	}
	public void setCpuAll(String cpuAll) {
		this.cpuAll = cpuAll;
	}
	public String getCpuUse() {
		return cpuUse;
	}
	public void setCpuUse(String cpuUse) {
		this.cpuUse = cpuUse;
	}
	public String getMemoryAll() {
		return memoryAll;
	}
	public void setMemoryAll(String memoryAll) {
		this.memoryAll = memoryAll;
	}
	public String getMemoryUse() {
		return memoryUse;
	}
	public void setMemoryUse(String memoryUse) {
		this.memoryUse = memoryUse;
	}
	public String getDiskAll() {
		return diskAll;
	}
	public void setDiskAll(String diskAll) {
		this.diskAll = diskAll;
	}
	public String getDiskUse() {
		return diskUse;
	}
	public void setDiskUse(String diskUse) {
		this.diskUse = diskUse;
	}
	private String cpuAll;
	@Override
	public String toString() {
		return "PerformanceVO [cpuAll=" + cpuAll + ", cpuUse=" + cpuUse + ", memoryAll=" + memoryAll + ", memoryUse="
				+ memoryUse + ", diskAll=" + diskAll + ", diskUse=" + diskUse + "]";
	}
	
	
	private String cpuUse;
	private String memoryAll;
	private String memoryUse;
	private String diskAll;
	private String diskUse;

	
	
}
