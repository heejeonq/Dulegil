package com.gdj51.Dulegil.web.courseReviw.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

@Controller
public class CourseReviewController {
	
	@Autowired 
	public IDao dao;
	
	@Autowired
	public IPagingService ips;
	
	//리스트
	@RequestMapping(value="/courseReview")
	public ModelAndView courseReview(
			@RequestParam HashMap<String,String> params,
			ModelAndView mav) throws Throwable{
		
		int page = 1;
		
		if(params.get("page")!= null && params.get("page")!= "" ) {
			page=Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("courseReviw/courseReviw_list");
				
		return mav;
	}
	
	@RequestMapping(value="/CourseRevListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CourseRevListAjax(
			@RequestParam HashMap<String,String> params) 
					throws Throwable{
			ObjectMapper mapper =  new ObjectMapper();
			
			Map<String,Object> model = new HashMap<String,Object>();
			
			int cnt = dao.getInt("courseR.getCnt",params);
			
			HashMap<String, Integer> pd
			= ips.getPagingData(Integer.parseInt(params.get("page")),						
				cnt,8,5);
			
			params.put("start", Integer.toString(pd.get("start")));
			params.put("end", Integer.toString(pd.get("end")));
			
			List<HashMap<String,String>> list = dao.getList("courseR.courseRList",params);
			//T에 있는 겟리스트를 가져올거여
		
			model.put("list", list);
			model.put("pd", pd);
		
			return mapper.writeValueAsString(model);
	}
	
	// 글쓰기 업뎃 수정
	
	@RequestMapping(value="/courseReviewWrite")
	public ModelAndView courseReviewWrite(
			@RequestParam HashMap<String,String> params,
			ModelAndView mav) {
		
		mav.setViewName("courseReviw/courseReviw_write");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/CourseRevAction/{gbn}", 
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody//자바스크립트 형태로 넘어감
	public String CoreseRevAction(
			@PathVariable String gbn, 
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch (gbn) {
			case "insert":
				cnt = dao.insert("courseR.insert", params);
				break;
			case "update":
				cnt = dao.update("courseR.update", params);
				break;
			case "delete":
				cnt = dao.update("courseR.delete", params);
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
	//ModelAndView
	//Model :저장소
	//view: 출력 페이지
	@RequestMapping(value = "/courseReviewUpdate")
	public ModelAndView courseReviewUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		if (params.get("no") != null && params.get("no") != "") {

			HashMap<String, String> data = dao.getMap("courseR.getCR", params);

			mav.addObject("data", data);

			mav.setViewName("courseReviw/courseReviw_update");
		} else {
			mav.setViewName("redirect:courseReview");
		}

		return mav;
	}

	
	//상세보기
	@RequestMapping(value="/courseReviewDetail")
	public ModelAndView courseReviewDetail(
			@RequestParam HashMap<String,String> params,
			ModelAndView mav)throws Throwable {
		
		if(params.get("no") != null && params.get("no") != "") {
			
			dao.update("updateCRHit",params);
			
			HashMap<String,String> data = dao.getMap("courseR.getCR",params);
			mav.addObject("data", data);
			
			
			/*
			  int gcnt = dao.getInt("courseR.gcnt",params); 			 			 
			  cnt=dao.insert("courseR.insertG",params); int
			  cnt=dao.insert("courseR.deleteG",params);
			 */
		
		mav.setViewName("courseReviw/courseReviw_detail");
		}else { 
			 mav.setViewName("redirect:courseReview");  
		 }
		
		return mav;
	}
	

	
	//댓글
	@RequestMapping(value="/CourseRevCAction/{gbn}",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CourseRevCAction(
			@PathVariable String gbn,
			@RequestParam HashMap<String,String> params) throws Throwable{
			ObjectMapper mapper =  new ObjectMapper();
		
		Map<String,Object> model = new HashMap<String, Object>();
		
		int cnt=0;
	
		try {
			switch(gbn) {
			case "insert": 
				cnt=dao.insert("courseR.insertC",params);
				break;
			case "update": 
				cnt=dao.update("courseR.updateC",params);
				break;
			case "delete": 
				cnt=dao.update("courseR.deleteC",params);
				break;
			case "commentReport":
				cnt = dao.insert("courseR.commentReport", params);
				break;
			case "postReport":
				cnt = dao.insert("courseR.postReport", params);
				break;
		}
			if(cnt > 0) {
				model.put("msg","success");
			}else {
				model.put("msg","fail");
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		}
		
			
		return mapper.writeValueAsString(model);	
}
	
	@RequestMapping(value = "/commentCAjax", 
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentAjax(HttpSession session,@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt =dao.getInt("courseR.getCCnt",params);//댓글갯수
		
		HashMap<String, Integer> pd =
				ips.getPagingData(1,cnt,Integer.parseInt(params.get("cpage")),1); //페이징하는데
		//현재페이지 /총 게시물 개수/ 보여지는 게시물 수/ 페이징수
		params.put("start", Integer.toString(pd.get("start"))); //댓글 시작
		params.put("end", Integer.toString(pd.get("end"))); //댓글 끝

		List<HashMap<String, String>> list = dao.getList("courseR.getCList", params);
		
		HashMap<String,String> goodCheckData = dao.getMap("courseR.goodCheck",params);
		
		String goodCheck = "";
		
		if(goodCheckData == null) {
			goodCheck = "0";
		}else {
			goodCheck = "1";
		}
		
		HashMap<String, String> gList = dao.getMap("courseR.gcnt",params);
		
		model.put("list", list);
		
		model.put("goodCheck", goodCheck);	
		
		model.put("gList", gList);		

		model.put("pd", pd);//
		return mapper.writeValueAsString(model);

	}
	

	
	//좋아요
	@RequestMapping(value = "/goodajax/{gbn}", 
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String goodajaxgbn(
			@PathVariable String gbn, 
			@RequestParam HashMap<String, String> params) 
					throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();
	
		
		//좋아요 누른사람 확인
		
		
		int cnt = 0;//insert,delete받기위해
		
		
		try {
			switch(gbn) {
			case "insert": cnt= dao.insert("courseR.insertG",params);
						 
				break;
			case "delete": cnt= dao.delete("courseR.deleteG",params);
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
	
}