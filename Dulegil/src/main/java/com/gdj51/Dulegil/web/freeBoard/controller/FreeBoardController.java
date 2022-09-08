package com.gdj51.Dulegil.web.freeBoard.controller;

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




@Controller
public class FreeBoardController {	
	//@Autowired 
	//public IDulDao dao;
	
	@Autowired
	public IPagingService ips;
		
	@RequestMapping(value="/freeBoardList")
	public ModelAndView freeBoardList(
			@RequestParam HashMap<String,String> params,
			ModelAndView mav) throws Throwable{
		int page = 1;
		
		if(params.get("page")!= null && params.get("page")!= "" ) {
			page=Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("freeBoard/freeBoard_list");
		
		return mav;
	}
	
	@RequestMapping(value="/FreeListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String FreeListAjax(
			@RequestParam HashMap<String,String> params) throws Throwable{
			ObjectMapper mapper =  new ObjectMapper();
			
			Map<String,Object> model = new HashMap<String,Object>();
			
				//int cnt = dao.getInt("free.getCnt",params);
			
			//HashMap<String, Integer> pd
			//= ips.getPagingData(Integer.parseInt(params.get("page")),						
				//	cnt,10,5);
			
			//params.put("start", Integer.toString(pd.get("start")));
			//params.put("end", Integer.toString(pd.get("end")));
			
			//List<HashMap<String,String>>list = dao.getList("T.getTList",params);
			//T에 있는 겟리스트를 가져올거여
		
			//model.put("list", list);
			//model.put("pd", pd);
		
			return mapper.writeValueAsString(model);
	}
	
	
	
	@RequestMapping(value="/freeBoardDetail")
	public ModelAndView freeBoardDetail(ModelAndView mav) {
		
		mav.setViewName("freeBoard/freeBoard_detail");
		
		return mav;
	}
	
	@RequestMapping(value="/freeBoardWrite")
	public ModelAndView freeBoardWrite(ModelAndView mav) {
		
		mav.setViewName("freeBoard/freeBoard_write");
		
		return mav;
	}				
		
}
