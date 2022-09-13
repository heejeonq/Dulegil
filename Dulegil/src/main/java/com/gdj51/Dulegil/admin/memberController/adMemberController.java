package com.gdj51.Dulegil.admin.memberController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj51.Dulegil.common.service.IPagingService;
import com.gdj51.Dulegil.web.dao.IDao;
import com.mysql.fabric.xmlrpc.base.Data;

@Controller
public class adMemberController {
	@Autowired
	public IDao dao;

	@Autowired IPagingService ips;


	// 리스트 취득
	@RequestMapping(value="/adCmtList")
	public ModelAndView adCmtList(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{


		int page = 1;

		if(params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("admin/2_adMember/ad_comment");
		return mav;
	}




	// 아작스
	@RequestMapping(value="/adCmtAjax",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String adCmtAjax(
			@RequestParam HashMap<String, String> params)throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> model = new HashMap<String, Object>();

		List<HashMap<String, String>> list = dao.getList("adComment.list", params);
		
		model.put("list", list);
		return mapper.writeValueAsString(model);
	}


}
