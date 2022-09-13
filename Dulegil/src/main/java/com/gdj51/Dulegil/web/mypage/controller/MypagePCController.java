package com.gdj51.Dulegil.web.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypagePCController {

	@RequestMapping(value = "/mypage_myinfo")
	public ModelAndView mypage_myinfo(ModelAndView mav) throws Throwable {

		mav.setViewName("mypage/mypage_myinfo");

		return mav;

	}

	@RequestMapping(value = "/mypage_password_check")
	public ModelAndView mypage_password_check(ModelAndView mav) throws Throwable {

		mav.setViewName("mypage/mypage_password_check");

		return mav;

	}

	@RequestMapping(value = "/mypage_myinfo_u")
	public ModelAndView mypage_myinfo_u(ModelAndView mav) throws Throwable {

		mav.setViewName("mypage/mypage_myinfo_u");

		return mav;

	}

	@RequestMapping(value = "/mypage_comment")
	public ModelAndView mypage_comment(ModelAndView mav) throws Throwable {

		mav.setViewName("mypage/mypage_comment");

		return mav;

	}
}
