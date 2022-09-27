package com.gdj51.Dulegil.web.mypage.controller;

import java.util.HashMap;
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
public class MypageInfoController {
	@Autowired
	public IDao dao;

	@RequestMapping(value = "/mypageMyinfo")
	// 값을 받아와서 화면에 출력시켜줌.
	public ModelAndView mypageMyinfo(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		// 로그인 안했을때 마이페이지 클릭했을 때 로그인 페이지로
		if (session.getAttribute("sMemNm") == null || session.getAttribute("sMemNm") == "") {

			mav.setViewName("login/login");

		} else {

			params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));

			HashMap<String, String> data = dao.getMap("member.getMyinfo", params);
			session.setAttribute("sMemNm", data.get("NM"));
			mav.addObject("data", data);
			mav.setViewName("mypage/mypage_myinfo");
		}
		return mav;
	}

	@RequestMapping(value = "/mypagePasswordCheck")
	public ModelAndView mypagePasswordCheck(HttpSession session, ModelAndView mav) throws Throwable {

		if (session.getAttribute("sMemNm") == null || session.getAttribute("sMemNm") == "") {

			mav.setViewName("login/login");

		} else {

			mav.setViewName("mypage/mypage_password_check");

		}

		return mav;
	}

	@RequestMapping(value = "/mypageAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	// ModelAndView는 ModelAndView만 줄수 있는데 @ResponseBody는 스트링으로 줄 수 있음.
	@ResponseBody
	public String mypageAjax(@PathVariable String gbn, HttpSession session,
			@RequestParam HashMap<String, String> params) throws Throwable {

		// 스트링을 제이슨으로 바꿔주는 라이브러리가 ObjectMapper임.
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

				// int qwe = dao.getInt2(7, 5);

				// 메소드 = 함수

				// 메소드 생성()괄호 안에 있는 값을 받아야함

				// 메소드 호출()괄호 안에 있는 것은 보내주는 값.
				data = dao.getMap("member.checkPwd", params);
				if (data != null) {
					model.put("msg", "success");
				} else {
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
		} // writeValueAsString: model을 제이슨형태로 돌려주는 메서드
		return mapper.writeValueAsString(model);
	}

	@RequestMapping(value = "/mypageMyinfoUpdate", produces = "test/json;charset=UTF-8")
	public ModelAndView mypageMyinfoUpdate(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		// 로그인 안했을 경우엔 로그인 페이지로
		if (session.getAttribute("sMemNm") == null || session.getAttribute("sMemNm") == "") {
			mav.setViewName("login/login");
		} else {
			params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));

			HashMap<String, String> data = dao.getMap("member.getMyinfo", params);

			mav.addObject("data", data);
			mav.setViewName("mypage/mypage_myinfo_u");
		}
		return mav;
	}
}