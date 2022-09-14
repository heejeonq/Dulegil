package com.gdj51.Dulegil.web.mypage.controller;

import java.util.HashMap;
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
import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class MypageInfoController {
	@Autowired
	public IDao dao;
	
	@RequestMapping(value = "/mypageMyinfo")
	public ModelAndView mypageMyinfo(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		//로그인 안했을때 마이페이지 클릭했을 때 로그인 페이지로
		if(session.getAttribute("sMemNm") == null && session.getAttribute("sMemNm") == "") {
			
			mav.setViewName("login/login");		
		}
		else {
			params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));
			
			HashMap<String, String> data = dao.getMap("member.getMyinfo", params);
			
			mav.addObject("data", data);
			
			mav.setViewName("mypage/mypage_myinfo");
			
		}

		
		return mav;

	}
	
	@RequestMapping(value = "/mypagePasswordCheck")
	public ModelAndView mypagePasswordCheck(ModelAndView mav) throws Throwable {

		mav.setViewName("mypage/mypage_password_check");

		return mav;

	}
	
	@RequestMapping(value = "/PasswordCheckAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String PasswordCheckAjax (HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> model = new HashMap<String, String>();
		
//		//암호화
//		params.put("pwd", Utils.encryptAES128(params.get("pwd")));
//		System.out.println(params.get("pwd"));
//		
//		//복호화
//		System.out.println(Utils.decryptAES128(params.get("pwd")));
//		
		
		HashMap<String, String> data = dao.getMap("member.checkPwd", params);
		if(data != null) {
	
			model.put("msg", "success");
			
		}
		else {
			model.put("msg", "failed");
		}
		return mapper.writeValueAsString(model);
	}
	

	

	@RequestMapping(value = "/mypageMyinfoUpdate")
	public ModelAndView mypageMyinfoUpdate(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		
		//로그인 안했을 경우엔 로그인 페이지로
		if(session.getAttribute("sMemNm") == null && session.getAttribute("sMemNm") == "") {
			
			mav.setViewName("login/login");		
		}
		else {
			params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));
			
			HashMap<String, String> data = dao.getMap("member.getMyinfo", params);
			
			mav.addObject("data", data);
			
			mav.setViewName("mypage/mypage_myinfo_u");
			
		}
	

		return mav;

	}

	@RequestMapping(value = "/mypage_comment")
	public ModelAndView mypage_comment(ModelAndView mav) throws Throwable {

		mav.setViewName("mypage/mypage_comment");

		return mav;

	}
}
