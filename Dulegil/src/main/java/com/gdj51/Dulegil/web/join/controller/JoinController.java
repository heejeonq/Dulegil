package com.gdj51.Dulegil.web.join.controller;

import java.util.HashMap;
import java.util.List;
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
import com.gdj51.Dulegil.web.join.dao.IJoinDao;


@Controller
public class JoinController {
	
	@Autowired
	public IJoinDao dao;

	@RequestMapping(value = "join")
	public ModelAndView join(ModelAndView mav) throws Throwable {

		mav.setViewName("join/join");

		return mav;
	}

	@RequestMapping(value = "/joinAction/{gbn}", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody

	public String joinAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;
		try {
			switch (gbn) {
			case "insert":	cnt = dao.insert("member.insertMember", params);
				
				break;
			case "update": cnt = dao.update("member.updateMember", params);
				
				break;
			case "delete": cnt = dao.update("member.deleteMember", params);
				
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
	
	@RequestMapping(value = "/chkIdAjax", 
			   method = RequestMethod.POST,
			 produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String chkIdAjax(
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		HashMap<String, String> data = dao.getMap("member.chkMemId", params);
		
		if(data != null) {
			model.put("data", data);
			model.put("msg", "success");
		
		}else {
			model.put("msg", "failed");
		}
		
		return mapper.writeValueAsString(model);
	}
	
}
