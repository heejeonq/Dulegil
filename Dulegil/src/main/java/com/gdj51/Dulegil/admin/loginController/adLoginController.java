package com.gdj51.Dulegil.admin.loginController;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class adLoginController {
	
	
	// 로그인 페이지
	@RequestMapping(value="/adLogin")
	public ModelAndView adLogin(ModelAndView mav) {
		
		mav.setViewName("admin/0_adLogin/ad_login");
		return mav;
	}
	
	
	

}
