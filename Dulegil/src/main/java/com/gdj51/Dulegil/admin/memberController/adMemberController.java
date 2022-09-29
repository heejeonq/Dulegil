package com.gdj51.Dulegil.admin.memberController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.mapper.Mapper;
import org.aspectj.weaver.AjAttribute.MethodDeclarationLineNumberAttribute;
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
import com.mysql.fabric.xmlrpc.base.Data;

@Controller
public class adMemberController {
	@Autowired
	public IDao dao;

	@Autowired IPagingService ips;

	
	// 리스트 취득
	@RequestMapping(value="/adMemList")
	public ModelAndView adMemList(
			HttpSession session,
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{

		if(session.getAttribute("sMemNm") != null && session.getAttribute("sMemNm") != "") {

		int page = 1;

		if(params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		
		List<HashMap<String, String>> cate = dao.getList("adMember.category");
		List<HashMap<String, String>> cmCate = dao.getList("adMember.commonCategory", params);
		
		mav.addObject("page", page);
		
		mav.addObject("cate", cate);
		mav.addObject("cmCate", cmCate);
		
		mav.setViewName("admin/2_adMember/ad_member");
		}else
			mav.setViewName("admin/0_adLogin/ad_Login");

		return mav;
	}




	// 아작스
	@RequestMapping(value="/adMemAjax",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String adMemAjax(
			@RequestParam HashMap<String, String> params)throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		
		int cnt = dao.getInt("adMember.cnt",params);
		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),cnt,10,3);
		
		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));
		
		List<HashMap<String, String>> list = dao.getList("adMember.list", params);
		
		List<HashMap<String, String>> cate = dao.getList("adMember.category", params);

		model.put("list", list);
		model.put("cate", cate);
		model.put("pd", pd);
		return mapper.writeValueAsString(model);
	}
	
	
	// 회원 ajax
	@RequestMapping(value="/adMemAction/{gbn}",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String adMemAction(
			@PathVariable String gbn,
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		
		int cnt = 0;
		
		try {
			switch(gbn) {
			case "update" : cnt = dao.update("adMember.update",params);
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
	
	
	// 리스트 취득
		@RequestMapping(value="/adMemUpdateList")
		public ModelAndView adMemUpdateList(
				HttpSession session,
				@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable{

			if(session.getAttribute("sMemNm") != null && session.getAttribute("sMemNm") != "") {

			int page = 1;

			if(params.get("page") != null && params.get("page") != "") {
				page = Integer.parseInt(params.get("page"));
			}
			
			mav.addObject("page", page);
			mav.setViewName("admin/2_adMember/ad_member_update");
			
			}else {
				mav.setViewName("admin/0_adLogin/ad_Login");

			}
			return mav;
		}

		@RequestMapping(value = "/adMemDetailAjax",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		
		@ResponseBody
		public String adMemDetailAjax(
				@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> model = new HashMap<String, Object>();
			
			HashMap<String, String> data = dao.getMap("adMember.info", params);
			model.put("data", data);
			
			return mapper.writeValueAsString(model);
		}	

}
