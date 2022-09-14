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
	
	@RequestMapping(value = "/findIdAjax", 
			   method = RequestMethod.POST,
			 produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String findIdAjax(
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		HashMap<String, String> data = dao.getMap("member.findMemId", params);
		
		if(data != null) {
			model.put("data", data);
			model.put("msg", "success");
		
		}else {
			model.put("msg", "failed");
		}
		
		return mapper.writeValueAsString(model);
	}
	
	@RequestMapping(value = "findPwd")
	public ModelAndView findPwd(ModelAndView mav) throws Throwable {

		mav.setViewName("login/find_PW");

		return mav;
	}

}
