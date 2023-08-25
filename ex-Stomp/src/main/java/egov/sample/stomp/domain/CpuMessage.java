package egov.sample.stomp.domain;

import lombok.Data;

@Data
public class CpuMessage {

	private String id;
	private String roomId;
	private String msg;
	private double cpuLoad;
}
