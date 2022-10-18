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
	@Pointcut("execution(* com.gdj51.Dulegil.admin..*Controller.*(..))"
			+ "&& !execution(* com.gdj51.Dulegil.admin..adLoginController.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil.admin..*Controller.*Ajax(..))"
	            + "&& !execution(* com.gdj51.Dulegil.admin..*Controller.*Action(..))")
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
	
	@Pointcut("execution(* com.gdj51.Dulegil..*Controller.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..*Controller.*Ajax(..))"
	            + "&& !execution(* com.gdj51.Dulegil..*Controller.*Action(..))"
	            + "&& !execution(* com.gdj51.Dulegil..MainController.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..LoginController.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil.admin..*Controller.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..BestReviewGalleryController.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..CourseReviewController.courseReview.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..FreeBoardController.freeBoardList*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..AccompanyController.Accompany*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..NoticeController.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..FAQController.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..CourseController.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil..EventController.*(..))"
	            + "&& !execution(* com.gdj51.Dulegil.web.join..JoinController.*(..))"
	            )
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