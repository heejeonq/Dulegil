package com.gdj51.Dulegil.web.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FAQController {
	@RequestMapping(value = "/FAQ")
	public ModelAndView FAQ(ModelAndView mav) throws Throwable {

		mav.setViewName("faq/faq");

		return mav;
	}

	
}
