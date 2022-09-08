package com.gdj51.Dulegil.web.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	@RequestMapping(value="/notice")
	public ModelAndView notice(ModelAndView mav) {
		
		mav.setViewName("notice/notice_list");
		
		return mav;
	}
	@RequestMapping(value="/noticeDetail")
	public ModelAndView noticeDetail(ModelAndView mav) {
		
		mav.setViewName("notice/notice_detail");
		
		return mav;
	
	}
}
