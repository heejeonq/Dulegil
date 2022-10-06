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
public class adCommentController {
	@Autowired
	public IDao dao;

	@Autowired 
	public IPagingService ips;

	
	// 리스트 취득
	@RequestMapping(value="/adCmtList")
	public ModelAndView adCmtList(
			HttpSession session,
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{

		if(session.getAttribute("adMemNm") != null && session.getAttribute("adMemNm") != "") {

		int page = 1;

		if(params.get("page") != null && params.get("page") != "") {
			page = Integer.parseInt(params.get("page"));
		}
		
		List<HashMap<String, String>> cate = dao.getList("adComment.category");
		
		mav.addObject("page", page);
		
		mav.addObject("cate", cate);
		
		mav.setViewName("admin/2_adMember/ad_comment");
		}else
			mav.setViewName("admin/0_adLogin/ad_Login");
			
		return mav;
	}


	// 아작스
	@RequestMapping(value="/adCmtAjax",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String adCmtAjax(
			@RequestParam HashMap<String, String> params)throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		
		int cnt = dao.getInt("adComment.cnt",params);
		HashMap<String, Integer> pd = ips.getPagingData(Integer.parseInt(params.get("page")),cnt,15,5);
		
		params.put("start", Integer.toString(pd.get("start")));
		params.put("end", Integer.toString(pd.get("end")));
		
		List<HashMap<String, String>> list = dao.getList("adComment.list", params);
		
		List<HashMap<String, String>> cate = dao.getList("adComment.category");

		model.put("list", list);
		model.put("cate", cate);
		model.put("pd", pd);
		return mapper.writeValueAsString(model);
	}
	
	
	// 댓글 삭제 
	@RequestMapping(value="/adCmtAction/{gbn}",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String adCmtAction(
			@PathVariable String gbn,
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> model = new HashMap<String, Object>();
		
		int cnt = 0;
		
		try {
			switch(gbn) {
			case "checkDel" : cnt=dao.update("adComment.checkDel",params);
			break;
			case "del" : cnt=dao.update("adComment.del",params);
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
	
	
	
	// tr 클릭시 상세페이지
		@RequestMapping(value="/cmtDt")
		public ModelAndView cmtDt(
				HttpSession session,
				ModelAndView mav) {

			if(session.getAttribute("adCmtNo") != null && session.getAttribute("adCmtNo") != "") {
				// 게시판 유형에 따라 redirect 하는 곳이 달라져야함. {gbn} 설정해서 보내야하나? 
				// if 로 값을 나눠야 할거 같은..
				// adCmtMemNo 댓글 번호 들어오면 회원번호 취득 -> 왜냐하면 디테일 들어갈때 세션에 sMemNo가 있어야 해서 
				session.getAttribute("adCmtMemNo");
				
				
				
				
				// 게시판 : 코스별 후기
				if(session.getAttribute("adBoardType") == "1" ) {
					mav.setViewName("redirect:courseReviewDetail");
					
				// 게시판 : 동행 구하기	
				}else if (session.getAttribute("adBoardType") == "2" ){
					mav.setViewName("redirect:accompanyDetail");
				
				// 게시판 : 둘레길 이야기
				}else
					mav.setViewName("redirect:freeBoardDetail");
			
				
			}else {
				mav.setViewName("admin/2_adMember/ad_comment");
			}
			return mav;
		}

		// tr 클릭시 상세페이지 댓글 정보 취득)
		@RequestMapping(value = "/cmtDtAjax",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String cmtDtAjax(
				HttpSession session,
				@RequestParam HashMap<String, String> params) throws Throwable {

			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> model = new HashMap<String, Object>();

			HashMap<String, String> data = dao.getMap("adComment.cmtDt", params);
			
			if(data != null) {
				session.setAttribute("adCmtNo", data.get("COMMENT_NO"));
				session.setAttribute("adCmtMemNo", data.get("MEMBER_NO"));
				session.setAttribute("adCmtPost", data.get("POST_NO"));
				session.setAttribute("adBoardType", data.get("BLTNBOARD_NO"));
				model.put("msg", "success");
			}else {
				model.put("msg", "failed");
			}
			return mapper.writeValueAsString(model);
		}


}
