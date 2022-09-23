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
	
	
	
	//로그인 후 관리자 페이지로 이동 화면
	@RequestMapping(value="/adAccountMng")
	public ModelAndView adAccountMng(ModelAndView mav) {
		mav.setViewName("admin/1_adAccountMng/ad_AccountMng");
		
	return mav;
	}
	
	
	// 메뉴 - 공지사항
	@RequestMapping(value="/adNtc")
	public ModelAndView adNtc (ModelAndView mav) {
		
		mav.setViewName("admin/3_adNotice/ad_notice_list");
		return mav;
	} 
	
	
	
	
	
	// 메뉴 - 웹사이트 활동 집계
	@RequestMapping(value="/adWebTotal")
	public ModelAndView adWebTotal (ModelAndView mav) {
		
		mav.setViewName("admin/5_adAggregation/ad_websiteTotal");
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
		
		mav.setViewName("admin/2_adMember/ad_report");
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

	

