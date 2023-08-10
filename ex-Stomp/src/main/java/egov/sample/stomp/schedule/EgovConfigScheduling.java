package egov.sample.stomp.schedule;

import org.quartz.JobDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.scheduling.quartz.SimpleTriggerFactoryBean;

import egov.sample.stomp.annotation.EgovScheduler;

@EgovScheduler
public class EgovConfigScheduling {

	@Bean
	public MethodInvokingJobDetailFactoryBean jobDetail(@Autowired SchedulingJobCpu schedulingJobCpu) {
		
		MethodInvokingJobDetailFactoryBean mjfb = new MethodInvokingJobDetailFactoryBean();
		mjfb.setTargetObject(schedulingJobCpu);
		mjfb.setTargetMethod("startJob");
		mjfb.setConcurrent(false);
		return mjfb;
	}
	
	@Bean
	public SimpleTriggerFactoryBean simpleTrigger(@Autowired MethodInvokingJobDetailFactoryBean jobDetail) {
		
		SimpleTriggerFactoryBean stfb = new SimpleTriggerFactoryBean();
		stfb.setJobDetail((JobDetail) jobDetail.getObject());
		stfb.setStartDelay(3*1000); // milisecond
		stfb.setRepeatInterval(1*1000); // milisecond
		
		return stfb;
	}
	
	@Bean
	public SchedulerFactoryBean scheduler(@Autowired SimpleTriggerFactoryBean simpleTrigger) {
		
		SchedulerFactoryBean sfb = new SchedulerFactoryBean();
		sfb.setTriggers(simpleTrigger.getObject());
		return sfb;
	}
}
