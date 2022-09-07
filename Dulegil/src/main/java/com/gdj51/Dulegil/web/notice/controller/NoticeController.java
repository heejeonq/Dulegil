package com.gdj51.Dulegil.web.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	@RequestMapping(value="/notice")
	public ModelAndView aob(ModelAndView mav) {
		
		mav.setViewName("notice/notice_list");
		
		return mav;
	}
}
