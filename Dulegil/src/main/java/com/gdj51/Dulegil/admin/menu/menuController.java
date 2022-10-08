package com.gdj51.Dulegil.admin.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj51.Dulegil.web.dao.IDao;


@Controller
public class menuController {

	@Autowired 
	public IDao dao;
	
	
	
	
	
	// 메뉴 - 공지사항
	@RequestMapping(value="/adNtc")
	public ModelAndView adNtc (ModelAndView mav) {
		
		mav.setViewName("admin/3_adNotice/ad_notice_list");
		return mav;
	} 
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 메뉴 - 회원관리
	@RequestMapping(value="/adMemMng")
	public ModelAndView adMemMng (ModelAndView mav) {
		
		mav.setViewName("admin/2_adMember/ad_member");
		return mav;
	} 
	
	
	// 메뉴 - 신고 내역 관리
	@RequestMapping(value="/adMemRep")
	public ModelAndView adMemRep (ModelAndView mav) {
		
		mav.setViewName("admin/2_adMember/ad_report2__TEST");
		return mav;
	} 
	
	
	// 메뉴 - 게시물 관리
	@RequestMapping(value="/adMemPost")
	public ModelAndView adMemPost (ModelAndView mav) {
		
		mav.setViewName("admin/2_adMember/ad_post");
		return mav;
	} 
	
	
	// 메뉴 - 댓글 관리
	@RequestMapping(value="/adMemCmt")
	public ModelAndView adMemCmt (ModelAndView mav) {
		
		mav.setViewName("admin/2_adMember/ad_comment");
		return mav;
	} 
}

	

