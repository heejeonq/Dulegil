package com.gdj51.Dulegil.admin.aggregationController;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
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
				HttpServletRequest request,
				@RequestParam HashMap<String, String> params)throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> model = new HashMap<String, Object>();

			// LIST
			List<HashMap<String, String>> list = dao.getList("adWebTotal.list", params);
			
			
			
			
			
			model.put("list", list);
			
			return mapper.writeValueAsString(model);
		}

	
		
		
		
		
		
		// 차트 아작스
				@RequestMapping(value="/chartAjax",
						method=RequestMethod.POST,
						produces = "text/json;charset=UTF-8")

				@ResponseBody
				public String chartAjax(
						HttpServletRequest request,
						@RequestParam HashMap<String, String> params)throws Throwable {
					ObjectMapper mapper = new ObjectMapper();
					Map<String, Object> model = new HashMap<String, Object>();

					
					
					// 쿼리에서 불러온 월 별 총 집계
					List<HashMap<String, String>> month = dao.getList("adWebTotal.month", params);
					
					
					
					
					model.put("month", month);
					return mapper.writeValueAsString(model);
				}


}
