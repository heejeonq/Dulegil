package com.gdj51.Dulegil.admin.loginController;


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
import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class adLoginController {

	@Autowired 
	public IDao dao;

	// 로그인 페이지
	@RequestMapping(value="/adLogin")
	public ModelAndView adLogin(
			HttpSession session,
			ModelAndView mav) {

		if(session.getAttribute("sMemNm") != null && session.getAttribute("sMemNm") != "") {
			mav.setViewName("redirect:adAccountMng");
		}else {
			mav.setViewName("admin/0_adLogin/ad_Login");
		}
		return mav;
	}



	
	
	

	// 로그인 아작스(로그인 정보 취득)
	@RequestMapping(value = "/loginAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String loginAjax(
			HttpSession session,
			@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();


		HashMap<String, String> data = dao.getMap("adLogin.checkAd", params);
		
		if(data != null) {
			session.setAttribute("sMemNo", data.get("MEMBER_NO"));
			session.setAttribute("sMemNm", data.get("EMAIL"));
			session.setAttribute("sMemPw", data.get("PWD"));
			model.put("msg", "success");
		}else {
			model.put("msg", "failed");
		}

		return mapper.writeValueAsString(model);
	}



	
	// 로그아웃
	@RequestMapping(value="/adLogout")
	public ModelAndView adLogout(
			HttpSession session,
			ModelAndView mav) {
		session.invalidate();
		
		mav.setViewName("redirect:adLogin");
		return mav;
	}
	
	

}
