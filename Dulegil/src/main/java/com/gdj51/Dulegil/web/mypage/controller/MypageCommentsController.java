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
public class MypageCommentsController {
	@Autowired
	public IDao iDao;

	@Autowired
	public IPagingService ips;

	@RequestMapping(value = "/mypageComment")
	public ModelAndView mypage_comment(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		int page = 1;

		if (params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}

		List<HashMap<String, String>> cate = iDao.getList("mypage.getCateAllList");
		mav.addObject("cate", cate);
		mav.addObject("page", page);
		mav.setViewName("mypage/mypage_comments");

		return mav;

	}

	@RequestMapping(value = "/mypage_commentsAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String mypage_commentsAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		int delete = 0;
		try {
			delete = iDao.delete("mypage.deleteComments", params);
			if (delete > 0) {
				System.out.println("success");
			} else {
				System.out.println("fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = iDao.getInt("mypage.getCCnt", params);

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = iDao.getList("mypage.getCommentsList", params);

		List<HashMap<String, String>> cate = iDao.getList("mypage.getCateAllList");
		model.put("list", list);
		model.put("cate", cate);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}
}
