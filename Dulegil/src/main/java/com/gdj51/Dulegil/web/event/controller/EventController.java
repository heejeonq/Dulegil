package com.gdj51.Dulegil.web.event.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class EventController {

	@Autowired
	public IDao dao;
	
	@RequestMapping(value = "/event")
	public ModelAndView event(ModelAndView mav) throws Throwable {

		mav.setViewName("event/event_calendar");

		return mav;
	}
	
	@RequestMapping(value = "/eventDtl")
	public ModelAndView eventDtl(
			
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
			dao.update("evt.evtHit", params);
		
			HashMap<String, String> data = dao.getMap("evt.getEvtDtl", params);
		
			mav.addObject("data", data);
			
			
			mav.setViewName("event/event_detail");
			
			return mav;
	}

}
