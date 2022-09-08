package com.gdj51.Dulegil.web.accompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccompanyController {
	
	@RequestMapping(value="/Accompany")
	public ModelAndView Accompany(ModelAndView mav) {
		
		mav.setViewName("accompany/accompany_list");
		
		return mav;
	}
	@RequestMapping(value="/AccompanyDetail")
	public ModelAndView AccompanyDetail(ModelAndView mav) {
		
		mav.setViewName("accompany/accompany_detail");
		
		return mav;
	}
	@RequestMapping(value="/AccompanyWrite")
	public ModelAndView AccompanyWrite(ModelAndView mav) {
		
		mav.setViewName("accompany/accompany_write");
		
		return mav;
	}

}
