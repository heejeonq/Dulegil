package com.gdj51.Dulegil.web.accompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccompanyController {
	
	@RequestMapping(value = "/accompany")
	public ModelAndView accompany(ModelAndView mav) throws Throwable {

		mav.setViewName("accompany/accompany_list");

		return mav;
	}
	@RequestMapping(value="/accompanyDetail")
	public ModelAndView AccompanyDetail(ModelAndView mav) {
		
		mav.setViewName("accompany/accompany_detail");
		
		return mav;
	}
	@RequestMapping(value="/accompanyWrite")
	public ModelAndView AccompanyWrite(ModelAndView mav) {
		
		mav.setViewName("accompany/accompany_write");
		
		return mav;
	}
}
