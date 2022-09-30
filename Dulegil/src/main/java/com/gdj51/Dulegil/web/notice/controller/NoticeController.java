package com.gdj51.Dulegil.web.notice.controller;

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
public class NoticeController {
	@Autowired
	public IDao dao;

	@Autowired
	public IPagingService ips;

	
	@RequestMapping(value="/notice")
	public ModelAndView notice(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav)throws Throwable {
		
		int page = 1;

		if (params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		
		mav.setViewName("notice/notice_list");
		
		return mav;
	}
	
	@RequestMapping(value = "/noticeAjax", 
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String noticeAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = dao.getInt("notice.getCnt", params);
	
	

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 7, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = dao.getList("notice.getNoticeList", params);
	
		// T에 있는 겟리스트를 가져올거여

		model.put("list", list);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}
	
	
	@RequestMapping(value="/noticeDetail")
	public ModelAndView noticeDetail(		
			@RequestParam HashMap<String, String> params,
			ModelAndView mav)throws Throwable {
		
		HashMap<String, String> data = dao.getMap("notice.getN", params);
		mav.addObject("data", data);
		
		if (params.get("no") != null && params.get("no") != "") { //만약 데이터가 넘어오면		
			
			dao.update("notice.updateNTHit", params);	//조회수를 업뎃해라
																
			mav.setViewName("notice/notice_detail");//디테일 보여줘
				//그리고 
				} else {//그게아니면
					mav.setViewName("redirect:notic");  //리스트로가
			}
		
		return mav;
	
	}
}
