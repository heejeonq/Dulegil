package com.gdj51.Dulegil.admin.loginController;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class adLoginController {


	// 로그인 페이지
	@RequestMapping(value="/adLogin")
	public ModelAndView adLogin(ModelAndView mav) {

		mav.setViewName("admin/0_adLogin/ad_login");
		return mav;
	}

	// 로그인 아작스(로그인 정보 취득)
	@RequestMapping(value = "/loginAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String loginAjax(
			@RequestParam HashMap<String, String>params)throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();


		//HashMap<String, String> data = 다오.getMap("xml_namespace.id", params)
		return mapper.writeValueAsString(model);
	}


	//로그인 후 관리자 페이지로 이동 화면


}
