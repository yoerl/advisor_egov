package egov.sample.stomp.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class UserMessage implements Serializable {
	private String id;
	private String msg;
	private String roomId;
	private String toUser;
}
