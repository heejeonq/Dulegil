package com.gdj51.Dulegil.web.mypage.controller;

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
public class MypageBoardController {
	@Autowired
	public IDao iDao;

	@Autowired
	// 페이징처리를 위해서 필요.
	public IPagingService ips;

	@RequestMapping(value = "/mypageBoard")
	public ModelAndView mypageBoard(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

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

	@RequestMapping(value = "/mypageBoardAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String mypageBoardAjax(@PathVariable String gbn, @RequestParam HashMap<String, String> params)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int delete = 0;

		try {
			switch (gbn) {
			case "delete":
				delete = iDao.delete("mypage.deleteBoard", params);
				if (delete > 0) {
					model.put("msg", "success");
				} else {
					model.put("msg", "fail");
				}
				break;
			case "select":
				int cnt = iDao.getInt("mypage.getBCnt", params);

				HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);

				params.put("start", Integer.toString(pd.get("start")));
				params.put("end", Integer.toString(pd.get("end")));

				List<HashMap<String, String>> list = iDao.getList("mypage.getBoardList", params);

				List<HashMap<String, String>> cate = iDao.getList("mypage.getCateAllList");

				model.put("list", list);
				model.put("cate", cate);
				model.put("pd", pd);
				break;
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return mapper.writeValueAsString(model);
	}
}
