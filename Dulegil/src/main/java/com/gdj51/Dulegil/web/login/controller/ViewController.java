package com.gdj51.Dulegil.web.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class ViewController {

	@Autowired
	public IDao dao;

	@RequestMapping(value = "viewId")
	public ModelAndView viewId(ModelAndView mav) throws Throwable {

		mav.setViewName("login/view_ID");

		return mav;
	}
	
	@RequestMapping(value = "viewPwd")
	public ModelAndView viewPwd(ModelAndView mav) throws Throwable {

		mav.setViewName("login/view_PW");

		return mav;
	}
}
