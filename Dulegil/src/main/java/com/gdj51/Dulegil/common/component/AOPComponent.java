package com.gdj51.Dulegil.common.component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
@EnableAspectJAutoProxy
public class AOPComponent {
	// Pointcut -> 적용범위
	// @Pointcut(범위설정)
	/*
	 * 범위 execution -> include필터 !execution -> exclude필터 * -> 모든것 *(..) -> 모든 메소드 ..
	 * -> 모든 경로 && -> 필터 추가
	 */
	@Pointcut("execution(* com.gdj51.Dulegil..HomeController.*(..))")
	public void testAOP() {
	}

	// ProceedingJoinPoint -> 대상 적용 이벤트 필터
	/*
	 * @Before -> 메소드 실행 전
	 * 
	 * @After -> 메소드 실행 후
	 * 
	 * @After-returning -> 메소드 정상실행 후
	 * 
	 * @After-throwing -> 메소드 예외 발생 후
	 * 
	 * @Around -> 모든 동작시점
	 */
	@Around("testAOP()")
	public ModelAndView testAOP(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = new ModelAndView();

		// Request 객체 취득
		HttpServletRequest request 
				= ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();

		mav = (ModelAndView) joinPoint.proceed(); // 기존 이벤트 처리 행위를 이어서 진행

		System.out.println("------- testAOP 실행됨 ------");

		return mav;
	}
	
		
	@Pointcut("execution(* com.gdj51.Dulegil..adNoticeController.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..adNoticeController.*Ajax(..))")
	public void adNtAOP() {};
	
	@Around("adNtAOP()")
	public ModelAndView adNtAOP(ProceedingJoinPoint joinPoint) throws Throwable{
	   ModelAndView mav = new ModelAndView();
	   //세션을 가져와야 로그인 됐는지 안됐는지 알 수 있기 때문에 가져오기
	   HttpServletRequest request
	   = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	   
	   HttpSession session = request.getSession();
	   
	   if(session.getAttribute("adMemNm")!=null
	         && session.getAttribute("adMemNm") !="") { //로그인중일 경우
	      mav = (ModelAndView) joinPoint.proceed(); //기존 이벤트 처리 행위를 이어서 진행
	   }else { //비로그인인 경우
	      mav.setViewName("redirect:adLogin");
	   }
	   return mav;
	}
	
	
@Pointcut("execution(* com.gdj51.Dulegil..MypageInfoController.*(..))"
            + "&& !execution(* com.gdj51.Dulegil..MypageInfoController.*Ajax(..))")
public void MyInAOP() {};

@Around("MyInAOP()")
public ModelAndView MyInAOP(ProceedingJoinPoint joinPoint) throws Throwable{
   ModelAndView mav = new ModelAndView();
   //세션을 가져와야 로그인 됐는지 안됐는지 알 수 있기 때문에 가져오기
   HttpServletRequest request
   = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
   
   HttpSession session = request.getSession();
   
   if(session.getAttribute("sMemNm")!=null
         && session.getAttribute("sMemNm") !="") { //로그인중일 경우
      mav = (ModelAndView) joinPoint.proceed(); //기존 이벤트 처리 행위를 이어서 진행
   }else { //비로그인인 경우
      mav.setViewName("redirect:login");
   }
   return mav;
}
	
	
	
	
	
}