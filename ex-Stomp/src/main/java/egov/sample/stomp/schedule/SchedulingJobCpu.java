package egov.sample.stomp.schedule;

import java.lang.management.ManagementFactory;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;

import com.sun.management.OperatingSystemMXBean;

import egov.sample.stomp.annotation.EgovJob;
import egov.sample.stomp.domain.CpuMessage;
import lombok.extern.slf4j.Slf4j;

@EgovJob("socketSchedulingJob")
@Slf4j
public class SchedulingJobCpu {

	@Autowired
	private SimpMessageSendingOperations messagingTemplate;
	private List<CpuMessage> listCpuLoad = new ArrayList<>();
	
	public void startJob() {
		
//		System.out.println("===>>> Start Scheduling!,"+this.hashCode());
//
//		OperatingSystemMXBean osBean = ManagementFactory.getPlatformMXBean(OperatingSystemMXBean.class);
//		double cpuLoad = osBean.getSystemCpuLoad() * 100;
//		//log.debug("CPU Usage : " + String.format("%.2f", cpuLoad));
//
//		CpuMessage cpuMessage = new CpuMessage();
//		cpuMessage.setId(""+System.currentTimeMillis());
//		cpuMessage.setRoomId("cpuLoad");
//		if (cpuLoad < 10.0) {
//			cpuMessage.setMsg("Idle");
//		} else if (cpuLoad > 90.0) {
//			cpuMessage.setMsg("Busy");
//		} else {
//			cpuMessage.setMsg("");
//		}
//		cpuMessage.setCpuLoad(cpuLoad);
//		log.debug("CPU Message Count = " + listCpuLoad.size());
//		
//		if ( listCpuLoad.size() >= 50 ) {
//			listCpuLoad.remove(0);
//			listCpuLoad.add(cpuMessage);
//		} else {
//			listCpuLoad.add(cpuMessage);
//		}
//		
//		log.debug("RoomId = " + cpuMessage.getRoomId());
//		log.debug("ID = " + cpuMessage.getId());
//		log.debug("CPU Load = " + cpuMessage.getCpuLoad());
//		log.debug("MSG = " + cpuMessage.getMsg());
//		//messagingTemplate.convertAndSend("/topic/" + message.getRoomid(), message.getMsg());
//		messagingTemplate.convertAndSend("/topic/" + cpuMessage.getRoomId(), listCpuLoad);
	}

}
