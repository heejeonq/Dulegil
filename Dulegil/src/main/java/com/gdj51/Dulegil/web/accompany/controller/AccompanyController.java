package com.gdj51.Dulegil.web.accompany.controller;

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
public class AccompanyController {
	
	@Autowired 
	public IDao dao;
	
	@Autowired
	public IPagingService ips;
	
	//리스트
	@RequestMapping(value = "/accompany")
	public ModelAndView accompany(
			@RequestParam HashMap<String,String> params,
			ModelAndView mav) throws Throwable {
		
		int page = 1;
		if(params.get("page")!= null && params.get("page")!= "" ) {
			page=Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("accompany/accompany_list");

		return mav;
	}
	@RequestMapping(value="/AccompanyAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	
	public String AccompanyAjax(
			@RequestParam HashMap<String,String> params) throws Throwable{
			ObjectMapper mapper =  new ObjectMapper();
			
			Map<String,Object> model = new HashMap<String,Object>();
			
			int cnt = dao.getInt("accom.getCnt",params);
			
			HashMap<String, Integer> pd
			= ips.getPagingData(Integer.parseInt(params.get("page")),						
				cnt,10,5);
			
			params.put("start", Integer.toString(pd.get("start")));
			params.put("end", Integer.toString(pd.get("end")));
			
			List<HashMap<String,String>> list = dao.getList("accom.getAccomList",params);
			//T에 있는 겟리스트를 가져올거여
		
			model.put("list", list);
			model.put("pd", pd);
		
			return mapper.writeValueAsString(model);
	}
	
	@RequestMapping(value = "/accompanyUpdate")
	public ModelAndView accompanyUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		if (params.get("no") != null && params.get("no") != "") {

			HashMap<String, String> data = dao.getMap("accom.getA", params);

			mav.addObject("data", data);

			mav.setViewName("accompany/accompany_update");
		} else {
			mav.setViewName("redirect:accompany");
		}

		return mav;
	}
	
	
	//상세보기
	@RequestMapping(value="/accompanyDetail")
	public ModelAndView accompanyDetail
			(@RequestParam HashMap<String,String> params,
			ModelAndView mav) throws Throwable {
		if(params.get("no") != null && params.get("no") != "") {
			dao.update("updateTHit",params);
						
			HashMap<String,String> data = dao.getMap("accom.getAC",params);	
		
					
			mav.addObject("data", data);
		
			
			mav.setViewName("accompany/accompany_detail");
		} 
			 else { mav.setViewName("accompany"); }
			
		
		
		return mav;
	}
	// 댓글
	@RequestMapping(value = "/accompanyCAction/{gbn}", 
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String accompanyCAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch (gbn) {
			case "insert":
				cnt = dao.insert("accom.insertC", params);
				break;
			case "update":
				cnt = dao.update("accom.updateC", params);
				break;
			case "delete":
				cnt = dao.update("accom.deleteC", params);
				break;
			case "apply":
				cnt = dao.insert("accom.insertApply", params);
				break;
			}
			if (cnt > 0) {
				model.put("msg", "success");
			} else {
				model.put("msg", "fail");
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		}

		return mapper.writeValueAsString(model);
	}

	
	
	@RequestMapping(value = "/accompanyCommentAjax", 
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String accompanyCommentAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = dao.getInt("accom.getCCnt",params);//댓글갯수

		HashMap<String, Integer> pd =
				ips.getPagingData(Integer.parseInt(params.get("cpage")), cnt,5,1); //페이징하는데

		params.put("start", Integer.toString(pd.get("start"))); //댓글 시작
		params.put("end", Integer.toString(pd.get("end"))); //댓글 끝
		
		List<HashMap<String, String>> list = dao.getList("accom.getCList", params);
		
		//동행 신청자 목록
		List<HashMap<String, String>> list2 = dao.getList("accom.getApplyMemList", params);

		//동행 신청자 수
		HashMap<String,String> applyCnt = dao.getMap("accom.getApplyCnt",params);	

		model.put("list", list);
		model.put("list2", list2);
		model.put("applyCnt", applyCnt);

		model.put("pd", pd);//

		return mapper.writeValueAsString(model);

	}
	
		
	@RequestMapping(value="/accompanyWrite")
	public ModelAndView AccompanyWrite(ModelAndView mav) {
		
		mav.setViewName("accompany/accompany_write");
		
		return mav;
	}
}
