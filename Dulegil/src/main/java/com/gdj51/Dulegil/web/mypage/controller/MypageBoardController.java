package com.gdj51.Dulegil.web.mypage.controller;

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
public class MypageBoardController {
	@Autowired
	public IDao iDao;

	@Autowired
	public IPagingService ips;

	@RequestMapping(value = "/mypageBoard")
	public ModelAndView mypage_board(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		int page = 1;

		if (params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}

		List<HashMap<String, String>> cate = iDao.getList("mypage.getCateAllList");
		mav.addObject("cate", cate);
		mav.addObject("page", page);
		mav.setViewName("mypage/mypage_board");

		return mav;

	}

	@RequestMapping(value = "/mypage_boardAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String mypage_boardAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		int delete = 0;
		try {
			delete = iDao.delete("mypage.deleteBoard", params);
			if (delete > 0) {
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러");
		}

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = iDao.getInt("mypage.getCnt", params);

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = iDao.getList("mypage.getBoardList", params);

		List<HashMap<String, String>> cate = iDao.getList("mypage.getCateAllList");
		model.put("list", list);
		model.put("cate", cate);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}

	/*
	 * @RequestMapping(value = "/mypage_boardAction/{gbn}", method =
	 * RequestMethod.POST, produces = "text/json;charset=UTF-8")
	 * 
	 * @ResponseBody public String mypage_boardAction(@PathVariable String
	 * gbn, @RequestParam HashMap<String, String> params) throws Throwable {
	 * ObjectMapper mapper = new ObjectMapper();
	 * 
	 * Map<String, Object> model = new HashMap<String, Object>();
	 * 
	 * int cnt = 0;
	 * 
	 * try {
	 * 
	 * cnt = iDao.delete("mypage.deleteBoard", params);
	 * 
	 * if (cnt > 0) { model.put("msg", "success"); } else { model.put("msg",
	 * "fail"); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); model.put("msg", "error"); }
	 * 
	 * return mapper.writeValueAsString(model); }
	 */
	@RequestMapping(value = "/mypage_boardDetail")
	public ModelAndView mypage_boardDetail(ModelAndView mav) {

		mav.setViewName("mypage/mypage_boardDetail");

		return mav;
	}

}
