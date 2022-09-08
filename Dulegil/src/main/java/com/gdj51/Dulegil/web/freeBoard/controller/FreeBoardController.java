package com.gdj51.Dulegil.web.freeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class FreeBoardController {	
	
	@RequestMapping(value="/freeBoardList")
	public ModelAndView freeBoardList(ModelAndView mav) {
		
		mav.setViewName("freeBoard/freeBoard_list");
		
		return mav;
	}
	
	@RequestMapping(value="/freeBoardDetail")
	public ModelAndView freeBoardDetail(ModelAndView mav) {
		
		mav.setViewName("freeBoard/freeBoard_detail");
		
		return mav;
	}
	
	@RequestMapping(value="/freeBoardWrite")
	public ModelAndView freeBoardWrite(ModelAndView mav) {
		
		mav.setViewName("freeBoard/freeBoard_write");
		
		return mav;
	}
		
		
		
		
		
}
