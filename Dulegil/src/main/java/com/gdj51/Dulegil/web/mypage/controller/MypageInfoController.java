package com.gdj51.Dulegil.web.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class MypageInfoController {
	@Autowired
	public IDao dao;
	
	@RequestMapping(value = "/mypage_myinfo")
	public ModelAndView mypage_myinfo(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		//로그인 안했을때 마이페이지 클릭했을 때 로그인 페이지로
		if(session.getAttribute("sMemNm") == null && session.getAttribute("sMemNm") == "") {
			
			mav.setViewName("login/login");		
		}
		else {
			params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));
			
			HashMap<String, String> data = dao.getMap("member.getMyinfo", params);
			
			mav.addObject("data", data);
			
			mav.setViewName("mypage/mypage_myinfo");
			
		}

		
		return mav;

	}
}
