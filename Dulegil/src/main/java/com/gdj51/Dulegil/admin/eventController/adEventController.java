package com.gdj51.Dulegil.admin.eventController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.Dulegil.common.service.IPagingService;
import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class adEventController {
	
	@Autowired
	public IDao dao;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value = "adEvtDtl")
	public ModelAndView adEvtDtl(ModelAndView mav) throws Throwable {

		mav.setViewName("admin/4_adEvent/ad_event_detail");

		return mav;
	}
	
	@RequestMapping(value = "adEvtUpd")
	public ModelAndView adEvtUpd(ModelAndView mav) throws Throwable {

		mav.setViewName("admin/4_adEvent/ad_event_update");

		return mav;
	}
	
	@RequestMapping(value = "adEvtReg")
	public ModelAndView adEvtReg(ModelAndView mav) throws Throwable {

		mav.setViewName("admin/4_adEvent/ad_event_write");

		return mav;
	}

}
