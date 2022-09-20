package com.gdj51.Dulegil.web.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj51.Dulegil.util.Utils;
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
	
	@RequestMapping(value= "/evtListAjax", 
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String evtListAjax(
			@RequestParam HashMap<String, String>params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		List<HashMap<String, String>> list = dao.getList("evt.getEvtList",params);

		list = Utils.toLowerListMapKey(list);

		return mapper.writeValueAsString(list);
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
