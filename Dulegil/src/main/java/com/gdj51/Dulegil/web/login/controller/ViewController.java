package com.gdj51.Dulegil.web.login.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "/viewAction/{gbn}", 
			method = RequestMethod.POST, 
			produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String viewAction(@PathVariable String gbn, 
			@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;
		
		try {
			switch (gbn) {
			case "update":	
				cnt = dao.insert("member.updMemPwd", params);
			break;
			default:
			break;
			}
			
			if(cnt > 0) {
				model.put("msg", "success");
			}else {
				model.put("msg", "fail");
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		}

		return mapper.writeValueAsString(model);
	}
}
