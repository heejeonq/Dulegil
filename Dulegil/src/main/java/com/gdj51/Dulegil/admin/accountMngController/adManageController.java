package com.gdj51.Dulegil.admin.accountMngController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;//
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
public class adManageController {

	@Autowired 
	public IDao dao;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value="/adminList")
	public ModelAndView adminList(
			HttpSession session,
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{

		if(session.getAttribute("adMemNm") != null && session.getAttribute("adMemNm") != "") {

		int page = 1;

		if(params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);
		
		mav.setViewName("admin/1_adAccountMng/ad_AccountMng");
		}else
			mav.setViewName("admin/0_adLogin/ad_Login");

		return mav;
	}
	
	@RequestMapping(value="/adminAjax",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String adminAjax(
			@RequestParam HashMap<String, String> params)throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		
		
		int cnt = dao.getInt("adMember.adCnt",params);
		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),cnt,5,3);
		 
		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));
		
		List<HashMap<String, String>> list = dao.getList("adMember.adList", params);
		
		model.put("list", list);
		model.put("pd", pd);
		return mapper.writeValueAsString(model);
	}
	
	@RequestMapping(value="/adminAction/{gbn}",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String adminAction(
		@PathVariable String gbn,
		@RequestParam HashMap<String, String> params) throws Throwable{
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> model = new HashMap<String, Object>();
	
	int cnt = 0;
	
	try {
		switch(gbn) {
		case "insert" : cnt = dao.insert("adMember.insertAdmin",params);
		break;
		case "update" : cnt = dao.update("adMember.update",params);
		break;
		case "delete" : cnt = dao.update("adMember.update",params);
		break;
		}
		if(cnt>0) {
			model.put("msg", "success");
		}else {
			model.put("msg", "fail");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		model.put("msg", "error");
	}
	
	return mapper.writeValueAsString(model);
	}
}
