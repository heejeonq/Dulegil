package com.gdj51.Dulegil.web.course.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseController {

	@RequestMapping(value="/course1")
	public ModelAndView course1(ModelAndView mav) {
		
		mav.setViewName("course/course1");
		
		return mav;
	}
	
	@RequestMapping(value="/course2")
	public ModelAndView course2(ModelAndView mav) {
		
		mav.setViewName("course/course2");
		
		return mav;
	}
	
	@RequestMapping(value="/course3")
	public ModelAndView course3(ModelAndView mav) {
		
		mav.setViewName("course/course3");
		
		return mav;
	}
	
	@RequestMapping(value="/course4")
	public ModelAndView course4(ModelAndView mav) {
		
		mav.setViewName("course/course4");
		
		return mav;
	}
	
	@RequestMapping(value="/course5")
	public ModelAndView course5(ModelAndView mav) {
		
		mav.setViewName("course/course5");
		
		return mav;
	}
	
	@RequestMapping(value="/course6")
	public ModelAndView course6(ModelAndView mav) {
		
		mav.setViewName("course/course6");
		
		return mav;
	}
	
	@RequestMapping(value="/course7")
	public ModelAndView course7(ModelAndView mav) {
		
		mav.setViewName("course/course7");
		
		return mav;
	}
	
	@RequestMapping(value="/course8")
	public ModelAndView course8(ModelAndView mav) {
		
		mav.setViewName("course/course8");
		
		return mav;
	}
	
	@RequestMapping(value="/nf1")
	public ModelAndView nf1(ModelAndView mav) {
		
		mav.setViewName("course/NewFile");
		
		return mav;
	}

}
