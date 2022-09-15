package com.gdj51.Dulegil.web.login.controller;

import java.util.HashMap;
import java.util.Map;

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
	
	@RequestMapping(value = "/updPwdAjax", 
			   method = RequestMethod.POST,
			 produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updPwdAjax(
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		HashMap<String, String> data = dao.getMap("member.updMemPwd", params);
		
		if(data != null) {
			model.put("data", data);
			model.put("msg", "success");
		
		}else {
			model.put("msg", "failed");
		}
		
		return mapper.writeValueAsString(model);
	}
}
