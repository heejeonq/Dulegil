package com.gdj51.Dulegil.web.mypage.controller;

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
import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class MypageAccopanyController {
	@Autowired
	public IDao dao;
	
	
	@RequestMapping(value="/mypageAccompany")
	public ModelAndView mypageAccopany(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		// 로그인 안했을때 마이페이지 이동시 로그인 페이지로
		if (session.getAttribute("sMemNm") == null || session.getAttribute("sMemNm") == "") {

			mav.setViewName("login/login");
		} 
		else {
			
			mav.setViewName("mypage/mypage_accompany");
		}
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/accompanyAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String accompanyAjax(@PathVariable String gbn, HttpSession session,
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

//		//암호화
//		params.put("pwd", Utils.encryptAES128(params.get("pwd")));
//		System.out.println(params.get("pwd"));
//		
//		//복호화
//		System.out.println(Utils.decryptAES128(params.get("pwd")));
//		

		HashMap<String, String> data = new HashMap<String, String>();

		int cnt = 0;
		try {
			switch (gbn) {
			case "passwordCheck":
				data = dao.getMap("member.checkPwd", params);
				if (data != null) {
					model.put("msg", "success");
				}
				else {
					model.put("msg", "fail");
				}

				break;
			case "myinfoUpdate":
				cnt = dao.update("member.updateMyinfo", params);
				if (cnt > 0) {
					model.put("msg", "success");
				} else {
					model.put("msg", "fail");
				}
				break;

			default:
				break;
			}
	

		} catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		}
		return mapper.writeValueAsString(model);
	}
	
	
	@RequestMapping(value="accompanyList", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String accompanyList (HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));
		
		List<HashMap<String, String>> list1 = dao.getList("accompany.applyMemList", params);
		List<HashMap<String, String>> list2 = dao.getList("accompany.chatList", params);
		List<HashMap<String, String>> list3 = dao.getList("accompany.myApply", params);
		List<HashMap<String, String>> list4 = dao.getList("accompany.accompanyHistory", params);
		List<HashMap<String, String>> list5 = dao.getList("accompany.accompanyRate", params);
		
		model.put("list1", list1);
		model.put("list2", list2);
		model.put("list3", list3);
		model.put("list4", list4);
		model.put("list5", list5);

		
		
		return mapper.writeValueAsString(model);
	}
	
	@RequestMapping(value="accompanyMemList", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String accompanyMemList (HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> model = new HashMap<String, Object>();
		params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));

		List<HashMap<String, String>> memList = dao.getList("accompany.accompanyMemList", params);


		model.put("memList", memList);
		
		
		return mapper.writeValueAsString(model);
	}
}
