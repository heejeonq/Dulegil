package com.gdj51.Dulegil.web.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
public class LoginController {

	@Autowired
	public IDao dao;

	@RequestMapping(value = "/login")
	public ModelAndView login(HttpSession session, ModelAndView mav) throws Throwable {

		if (session.getAttribute("sMemNm") != null && session.getAttribute("sMemNm") != "") {
			mav.setViewName("redirect:main");
		} else {
			mav.setViewName("login/login");
		}

		return mav;
	}

	@RequestMapping(value = "/memberLoginAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String loginAjax(HttpSession session, 
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> model = new HashMap<String, String>();

		params.put("pwd", Utils.encryptAES128(params.get("pwd")));
		System.out.println(params.get("pwd"));
		
		
		HashMap<String, String> data = dao.getMap("adLogin.checkMember", params);
		if (data != null) {
			session.setAttribute("sMemNo", data.get("MEMBER_NO"));
			session.setAttribute("sMemNm", data.get("NM"));
			model.put("msg", "success");

		} else {
			model.put("msg", "failed");
		}
		return mapper.writeValueAsString(model);
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession sesstion, ModelAndView mav) {
		// 요청 사용자 세션 초기화
		sesstion.invalidate();
		mav.setViewName("redirect:main");
		return mav;
	}

}
