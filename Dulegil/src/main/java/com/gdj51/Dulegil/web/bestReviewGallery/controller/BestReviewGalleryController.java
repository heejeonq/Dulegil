package com.gdj51.Dulegil.web.bestReviewGallery.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@Controller
public class BestReviewGalleryController {
	
	@Autowired 
	public IDao dao;
	
	@Autowired
	public IPagingService ips;
	
	//리스트
	@RequestMapping(value = "/bestReviewGallery")
	public ModelAndView bestReviewGallery(
			@RequestParam HashMap<String,String> params,
			ModelAndView mav) throws Throwable{
		
		int page = 1;
		
		if(params.get("page")!= null && params.get("page")!= "" ) {
			page=Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page",page);		
		
		mav.setViewName("bestReviewGallery/bestReviewGallery_list");

		return mav;
	}
	
	@RequestMapping(value="/BestRevListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BestRevListAjax(
			@RequestParam HashMap<String,String> params) 
					throws Throwable{
			ObjectMapper mapper =  new ObjectMapper();
			
			Map<String,Object> model = new HashMap<String,Object>();
			
			int cnt = dao.getInt("bstRev.getCnt",params);
			
			List<HashMap<String,String>> list = dao.getList("bstRev.bstRList",params);
			
		
			model.put("list", list);
		
			return mapper.writeValueAsString(model);
	}	
	
	
}
