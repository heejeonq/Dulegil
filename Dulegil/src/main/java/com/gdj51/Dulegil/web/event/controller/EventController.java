package com.gdj51.Dulegil.web.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {

	@RequestMapping(value = "/event")
	public ModelAndView event(ModelAndView mav) throws Throwable {

		mav.setViewName("event/event_calendar");

		return mav;
	}
	
	@RequestMapping(value = "/eventDtl")
	public ModelAndView eventDtl(ModelAndView mav) throws Throwable {

		mav.setViewName("event/event_detail");

		return mav;
	}
}
