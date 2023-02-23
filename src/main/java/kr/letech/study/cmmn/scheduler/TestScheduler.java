//package kr.letech.study.cmmn.scheduler;
//
//import java.util.Date;
//
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//@Component
//public class TestScheduler {
//	/*
//	 * 초 0 ~ 59
//	 * 분 0 ~ 59
//	 * 시 0 ~ 23
//	 * 일 1 ~ 31
//	 * 월 1 ~ 12
//	 * 요일 0 ~ 7
//	 */
//	@Scheduled(cron = "*/5 * * * * *")
//	public void testCron() {
//		System.out.println("cron : " + new Date().toLocaleString());
//	}
//
//	/*
//	 * 이전 시작시간으로부터 지정된 시간이후 수행
//	 * ※ 지난프로세스가 종료 되지 않아도 시작된 시간으로 부터
//	 */
//	@Scheduled(fixedRate = 1000)
//	public void testFixedRate() {
//		System.out.println("fixedRate : " + new Date().toLocaleString());
//	}
//
//	/*
//	 * 최종 종료시간으로부터 지정된 이후 수행
//	 * ※ 지난프로세스가 종료된 이후
//	 */
//	@Scheduled(fixedDelay = 3000)
//	public void testFixedDelay() {
//		System.out.println("fixedDelay : " + new Date().toLocaleString());
//	}
//
//}
