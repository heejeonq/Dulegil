package com.gdj51.Dulegil.web.main.controller;

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
public class MainController {

	@Autowired
	public IDao dao;

	@RequestMapping(value = "/main")
	public ModelAndView main(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		mav.setViewName("main/main");

		return mav;
	}

	@RequestMapping(value = "/header")
	public ModelAndView header(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));

		int cnt = 0;
		if (session.getAttribute("sMemNm") != null && session.getAttribute("sMemNm") != "") {
			params.put("memNo", String.valueOf(session.getAttribute("sMemNo")));

		}

		mav.setViewName("common/header");

		return mav;
	}

	@RequestMapping(value = "/alarm/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String alramCheck(@PathVariable String gbn, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		try {
			switch (gbn) {
			case "alarmCheck":
				dao.update("header.alarmCheck", params);
				break;

			}

		} catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "error");
		}

		int cnt = dao.getInt("header.alarmCnt", params);

		List<HashMap<String, String>> list = dao.getList("header.alarmContents", params);

		model.put("cnt", cnt);
		model.put("list", list);

		return mapper.writeValueAsString(model);
	}

}
