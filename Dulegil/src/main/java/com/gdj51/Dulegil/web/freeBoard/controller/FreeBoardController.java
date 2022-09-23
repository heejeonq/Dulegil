package com.gdj51.Dulegil.web.freeBoard.controller;

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

@Controller
public class FreeBoardController {
	@Autowired
	public IDao dao;

	@Autowired
	public IPagingService ips;

	// 리스트
	@RequestMapping(value = "/freeBoard")
	public ModelAndView freeBoardList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		int page = 1;

		if (params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}

		mav.addObject("page", page);

		mav.setViewName("freeBoard/freeBoard_list");

		return mav;
	}

	@RequestMapping(value = "/FreeListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String FreeListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = dao.getInt("free.getCnt", params);
		int ccnt = dao.getInt("free.getCCnt", params);
	

		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));

		List<HashMap<String, String>> list = dao.getList("free.getFreeList", params);
	
		// T에 있는 겟리스트를 가져올거여

		model.put("list", list);
		model.put("pd", pd);

		return mapper.writeValueAsString(model);
	}

	// 글쓰기 업뎃 수정
	@RequestMapping(value = "/freeBoardWrite")
	public ModelAndView freeBoardWrite(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		mav.setViewName("freeBoard/freeBoard_write");

		return mav;
	}

	@RequestMapping(value = "/FREEAction/{gbn}", 
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String FREEAction(
			@PathVariable String gbn, 
			@RequestParam HashMap<String, String> params) 
					throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch (gbn) {
			case "insert":
				cnt = dao.insert("free.insert", params);
				break;
			case "update":
				cnt = dao.update("free.update", params);
				break;
			case "delete":
				cnt = dao.update("free.delete", params);
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

	@RequestMapping(value = "/freeBoardUpdate")
	public ModelAndView freeBoardUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		if (params.get("no") != null && params.get("no") != "") {

			HashMap<String, String> data = dao.getMap("free.getF", params);

			mav.addObject("data", data);

			mav.setViewName("freeBoard/freeBoard_update");
		} else {
			mav.setViewName("redirect:freeBoard");
		}

		return mav;
	}

	// 상세보기
	@RequestMapping(value = "/freeBoardDetail")
	public ModelAndView freeBoardDetail(		
			@RequestParam HashMap<String, String> params,
			ModelAndView mav)throws Throwable {
			HashMap<String, String> data = dao.getMap("free.getF", params);
			mav.addObject("data", data);		

			if (params.get("no") != null && params.get("no") != "") { //만약 데이터가 넘어오면		
					
				dao.update("updateTHit", params);	//조회수를 업뎃해라
																	
					mav.setViewName("freeBoard/freeBoard_detail"); //디테일 보여줘
					//그리고 
					} else {										//그게아니면
						mav.setViewName("redirect:freeBoard");  //리스트로가
				}
			
		return mav;
	}

	// 댓글
	@RequestMapping(value = "/freeCAction/{gbn}", 
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String freeCAction(@PathVariable String gbn, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch (gbn) {
			case "insert":
				cnt = dao.insert("free.insertC", params);
				break;
			case "update":
				cnt = dao.update("free.updateC", params);
				break;
			case "delete":
				cnt = dao.update("free.deleteC", params);
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

	
	
	@RequestMapping(value = "/commentAjax", 
			method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> model = new HashMap<String, Object>();

		int cnt =dao.getInt("free.getCCnt",params);//댓글갯수

		HashMap<String, Integer> pd =
				ips.getPagingData(Integer.parseInt(params.get("cpage")), cnt,5,1); //페이징하는데

		params.put("start", Integer.toString(pd.get("start"))); //댓글 시작
		params.put("end", Integer.toString(pd.get("end"))); //댓글 끝

		List<HashMap<String, String>> list = dao.getList("free.getCList", params);


		model.put("list", list);

		model.put("pd", pd);//

		return mapper.writeValueAsString(model);

	}
	

}
