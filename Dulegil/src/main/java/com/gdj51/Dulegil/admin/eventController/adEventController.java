package com.gdj51.Dulegil.admin.eventController;

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
import com.gdj51.Dulegil.common.service.IPagingService;
import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class adEventController {
	
	@Autowired
	public IDao dao;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value="/adEvt")
	public ModelAndView adEvt (
			
			@RequestParam HashMap<String, String>params,
			ModelAndView mav) throws Throwable {
		
		int page = 1;
		
		if(params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		
		mav.setViewName("admin/4_adEvent/ad_event_list");
		return mav;
	} 
	
	@RequestMapping(value = "/adEvtListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String adEvtListAjax(
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		int cnt = dao.getInt("evt.getAdEvtCnt", params);
		
		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));
		
		List<HashMap<String, String>> list = dao.getList("evt.getAdEvtList", params);
		
		model.put("list", list);
		model.put("pd", pd);
		
		return mapper.writeValueAsString(model);
	}
	
	@RequestMapping(value = "adEvtDtl")
	public ModelAndView adEvtDtl(ModelAndView mav) throws Throwable {

		mav.setViewName("admin/4_adEvent/ad_event_detail");

		return mav;
	}
	
	@RequestMapping(value = "adEvtUpd")
	public ModelAndView adEvtUpd(ModelAndView mav) throws Throwable {

		mav.setViewName("admin/4_adEvent/ad_event_update");

		return mav;
	}
	
	@RequestMapping(value = "adEvtReg")
	public ModelAndView adEvtReg(
			
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {

		mav.setViewName("admin/4_adEvent/ad_event_write");

		return mav;
	}
	
	@RequestMapping(value = "/adEvtAction/{gbn}",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String adEvtAction(
			@PathVariable String gbn,
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		int cnt = 0;
		
		try {
			switch (gbn) {
			case "insert" : cnt = dao.insert("evt.reg", params);
				break;
			case "update": cnt = dao.update("evt.upd", params);
				break;
			case "delete": cnt = dao.update("evt.del", params);
				break;
			}
			
			if (cnt > 0) {
				model.put("msg", "success");
			}else {
				model.put("msg", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		}
		return mapper.writeValueAsString(model);
	}
}
