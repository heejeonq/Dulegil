package com.gdj51.Dulegil.admin.aggregationController;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class adAggregationController {

	@RequestMapping(value="/adAggregation")
	public ModelAndView adLogin(HttpSession session,
			ModelAndView mav) {
		if(session.getAttribute("adMemNm") != null && session.getAttribute("adMemNm") != "") {

			mav.setViewName("admin/5_adAggregation/ad_websiteTotal");
		}else
			mav.setViewName("admin/0_adLogin/ad_Login");
		return mav;
	}

}
