package com.gdj51.Dulegil.admin.aggregationController;

import java.util.HashMap;
import java.util.List;
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
import com.gdj51.Dulegil.common.service.IPagingService;
import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class adAggregationController {
	
	@Autowired
	public IDao dao;
	
	@Autowired
	public IPagingService ips;

	
	
	
	// 통계 화면
	@RequestMapping(value="/adWebTotal")
	public ModelAndView adWebTotal(
			HttpSession session,
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		if(session.getAttribute("adMemNm") != null && session.getAttribute("adMemNm") != "") {

			int page = 1;

			if(params.get("page") != null && params.get("page") != "") {
				page = Integer.parseInt(params.get("page"));
			}
			
			HashMap<String, String> data = dao.getMap("adWebTotal.list", params);
			HashMap<String, String> acped = dao.getMap("adWebTotal.acped", params);
			
			mav.addObject("acped", acped);
			mav.addObject("data", data);
			mav.addObject("page", page);
			mav.setViewName("admin/5_adAggregation/ad_websiteTotal");
		}else
			mav.setViewName("admin/0_adLogin/ad_Login");
		return mav;
	}
	
	
	
	// 통계 아작스
		@RequestMapping(value="/totalAjax",
				method=RequestMethod.POST,
				produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String totalAjax(
				@RequestParam HashMap<String, String> params)throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> model = new HashMap<String, Object>();

			int cnt = dao.getInt("adWebTotal.cnt",params);
			HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),cnt,15,5);

			params.put("start", Integer.toString(pd.get("start")));
			params.put("end", Integer.toString(pd.get("end")));
			
			// LIST
			List<HashMap<String, String>> list = dao.getList("adWebTotal.list", params);
			List<HashMap<String, String>> year = dao.getList("adWebTotal.year", params);
			List<HashMap<String, String>> month = dao.getList("adWebTotal.month", params);
			List<HashMap<String, String>> day = dao.getList("adWebTotal.day", params);

			model.put("list", list);
			model.put("year", year);
			model.put("month", month);
			model.put("day", day);
			model.put("pd", pd);
			return mapper.writeValueAsString(model);
		}

	
	

}
