package com.gdj51.Dulegil.web.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class FindController {
	
	@Autowired
	public IDao dao;

	@RequestMapping(value = "findId")
	public ModelAndView findId(ModelAndView mav) throws Throwable {

		mav.setViewName("login/find_ID");

		return mav;
	}
	
	@RequestMapping(value = "findPwd")
	public ModelAndView findPwd(ModelAndView mav) throws Throwable {

		mav.setViewName("login/find_PW");

		return mav;
	}

}
