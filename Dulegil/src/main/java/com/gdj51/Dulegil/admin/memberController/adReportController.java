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
public class adReportController {
	@Autowired
	public IDao dao;

	@Autowired IPagingService ips;


	// 리스트 취득
	@RequestMapping(value="/adReportList")
	public ModelAndView adRepList(
			HttpSession session,
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{

		if(session.getAttribute("adMemNm") != null && session.getAttribute("adMemNm") != "") {


			int page = 1;

			if(params.get("page") != null && params.get("page") != "") {
				page = Integer.parseInt(params.get("page"));
			}

			mav.addObject("page", page);
			mav.setViewName("admin/2_adMember/ad_report");
		}else
			mav.setViewName("admin/0_adLogin/ad_Login");
		return mav;
	}




	// 아작스
	@RequestMapping(value="/adReportAjax",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String adReportAjax(
			@RequestParam HashMap<String, String> params)throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = dao.getInt("adReport.cnt",params);
		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),cnt,5,10);

		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));
		
		// LIST
		List<HashMap<String, String>> list = dao.getList("adReport.list", params);
		List<HashMap<String, String>> comment = dao.getList("adReport.comment", params);
		//List<HashMap<String, String>> post = dao.getList("adReport.post", params);

		//model.put("post", post);
		model.put("comment", comment);
		model.put("list", list);
		model.put("pd", pd);
		return mapper.writeValueAsString(model);
	}


	// 게시글 ajax
	@RequestMapping(value="/adReportAction/{gbn}",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String adReportAction(
			@PathVariable String gbn,
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();

		int cnt = 0;

		try {
			switch(gbn) {
			case "delete" : cnt=dao.update("adReport.delete",params);
			break;
			case "del" : cnt=dao.update("adReport.del",params);
			break;
			}
			if(cnt>0) {
				model.put("msg", "success");
			}else {
				model.put("msg", "fail");
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.put("msg", "exception");
		}

		return mapper.writeValueAsString(model);
	}



	//더보기 아작스	
	@RequestMapping(value="/addAjax",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String addAjax(
			@RequestParam HashMap<String, String> params)throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();


		// LIST
		List<HashMap<String, String>> comment = dao.getList("adReport.comment", params);
		List<HashMap<String, String>> post = dao.getList("adReport.post", params);

		model.put("post", post);
		model.put("comment", comment);
		return mapper.writeValueAsString(model);
	}


}
