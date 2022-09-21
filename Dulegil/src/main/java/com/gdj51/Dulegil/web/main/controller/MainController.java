package com.gdj51.Dulegil.web.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.Dulegil.web.dao.IDao;

@Controller
public class MainController {

	@Autowired
	public IDao dao;

	@RequestMapping(value = "/main")
	public ModelAndView main(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		int cnt = 0;
		if (session.getAttribute("sMemNm") != null && session.getAttribute("sMemNm") != "") {
			params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));

			cnt = dao.getInt("mypage.alarmCnt", params);

			List<HashMap<String, String>> data = dao.getList("mypage.AANm", params);

			mav.addObject("data", data);
			mav.addObject("cnt", cnt);

		}

		mav.setViewName("main/main");

		return mav;
	}

}
