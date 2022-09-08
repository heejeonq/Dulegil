package com.gdj51.Dulegil.web.login.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginController {


	@RequestMapping(value = "/login")
	public ModelAndView login(ModelAndView mav) throws Throwable {

		mav.setViewName("login/login");

		return mav;
	}
}
